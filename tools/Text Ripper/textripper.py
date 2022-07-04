import sys, os
import argparse

VERSION = "V0.1"

desc_text = "FE5 dialogue text ripper by Zane Avernathy " \
            "Version {0}".format(VERSION)

def show_exception_and_exit(exc_type, exc_value, tb):
    import traceback
    traceback.print_exception(exc_type, exc_value, tb)
    input("Press Enter key to exit.")
    sys.exit(-1)

def text_array(text):
    lines = text.splitlines()
    array = []
    for line in lines:
        chars = line.split("\t")
        for char in chars:
            array.append(char)
    return array

def lorom(input):
    return ((input >> 15) << 16) | (input & 0x7FFF) | 0x808000

def unmap(input):
    return (((input >> 16) & 0x7F) << 15) | (input & 0x7FFF)

def read_string(position, file, textarray):
    font = 0
    out = []
    while True:

        testval = int(file[position])
        if testval == 0: # Escape character

            if int(file[position+1]) == 0x2A: # clear both boxes
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                out.append("[clear all text]\n")
                position += 1

            elif int(file[position+1]) == 0x2E: # run ASM at address
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                position += 2
                pointer = int.from_bytes(file[position:position+3], byteorder="little")
                out.append("[run ASM ${0:0>6X}]\n".format(pointer))
                position += 2

            elif int(file[position+1]) == 0x32: # load portrait by char value in RAM
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                out.append("[load from RAM]\n")
                position += 1

            elif int(file[position+1]) == 0x38: # open text box
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                out.append("[open box]\n")
                position += 1

            elif int(file[position+1]) == 0x39: # retract text box
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                out.append("[retract box]\n")
                position += 1

            elif int(file[position+1]) == 0x3A: # load portrait
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                position += 2
                char = int.from_bytes(file[position:position+2], byteorder="little")
                out.append("[load ${0:0>4X}]\n".format(char))
                position += 1

            elif int(file[position+1]) == 0x3B: # unload portrait
                if (int(file[position-2]) >= 0x09) and int(file[position-3]) != 0:
                    out.append("\n")
                out.append("[unload portrait]\n")
                position += 1

            else:
                out.append("[unk ${0:0>2X}]".format(file[position+1]))
                position += 1
                pass

        elif testval == 1: # EOF
            if (int(file[position-2]) >= 0x09):
                out.append("\n")
            out.append("[end]")
            break

        elif testval == 2: # Newline
            out.append("\n")

        elif testval == 3: # Clear text
            out.append("[clear text]")
            if int(file[position+1]) >= 0x09:
                out.append("\n")

        elif testval == 4: # Scroll text
            out.append("[scroll text]")
            if int(file[position+1]) >= 0x09:
                out.append("\n")

        elif testval == 5: # break out of scene
            if (int(file[position-2]) >= 0x09):
                out.append("\n")
            out.append("[end scene]")
            break

        elif testval == 6: # target left slot
            out.append("[target left]")
            if int(file[position+1]) >= 0x09:
                out.append("\n")


        elif testval == 7: # target right slot
            out.append("[target right]")
            if int(file[position+1]) >= 0x09:
                out.append("\n")

        elif testval == 8: # wait for button
            out.append("[A]")
            if int(file[position+1]) <= 0x09:
                out.append("\n")

        elif testval in range(9, 15): # font selection
            font = testval - 9

        elif testval == 0x0F: # pause
            out.append("[pause ${0:0>2X}]".format(file[position+1]))
            position +=1

        elif (testval >= 0x10):
            out.append(textarray[(font*272)+(testval+16)])

        position += 1

    position += 1
    return ("".join(out)).encode(encoding="utf-8", errors="replace"), position





def main():
    sys.excepthook = show_exception_and_exit

    out_help = "Output text file containing " \
               "ripped text."

    offs_help = "Offset to read data from."

    unmap_help = "Treat input offset as unmapped." 

    table_help = "Treat input offset as the location " \
                 "of a pointer table of text entries."

    short_table_help = "Treat input offset as the location " \
                       "of a table of short pointers of text " \
                       "entries."

    rom_help = "Input FE5 ROM."

    char_help = "UTF-8 text file containing tab-separated " \
                "Japanese characters."

    ep_text = "Example input: -o 0x80000 -u FE5.sfc defaultfont.txt out.txt"

    end_help = "Optional end of ripping range."

    parser = argparse.ArgumentParser(description=desc_text, epilog=ep_text)

    parser.add_argument("-o", "--offset", help=offs_help)
    parser.add_argument("-e", "--end", help=end_help)
    parser.add_argument("-u", "--unmapped", help=unmap_help, action="store_true")
    parser.add_argument("-t", "--table", help=table_help, action="store_true")
    parser.add_argument("-s", "--short-table", help=short_table_help,
                        action="store_true")
    parser.add_argument("ROM", help=rom_help)
    parser.add_argument("charfile", help=char_help)
    parser.add_argument("output", help=out_help)

    args = parser.parse_args()


    with open(args.charfile, 'r', encoding="utf-8") as c:
        char_array = text_array(c.read())

    with open(args.ROM, 'rb') as r:
        rom = r.read()

    startpos = 0

    outname, outext = os.path.splitext(args.output)

    if args.offset is not None:
        if args.offset[0:2] == "0x":
            startpos = int(args.offset, base=16)
        else:
            startpos = int(args.offset, base=10)

    endpos = startpos
    if args.end is not None:
        if args.end[0:2] == "0x":
            endpos = int(args.end, base=16)
        else:
            endpos = int(args.end, base=10)

    if (args.short_table or args.table) is False:
        out = b''
        filenum = 0
        readpos = unmap(startpos)
        if args.unmapped is True:
            readpos = startpos
        endreadpos = unmap(endpos)
        if args.unmapped is True:
            endreadpos = endpos
        
        while readpos <= endreadpos:
            out, readpos = read_string(readpos, rom, char_array)
            with open(outname + str(filenum) + outext, 'wb') as o:
                o.write(out)
            filenum += 1

    elif args.table is True:
        tablepos = unmap(startpos)
        if args.unmapped is True:
            tablepos = startpos
        tableend = unmap(endpos)
        if args.unmapped is True:
            tableend = endpos
        poinnum = 0
        filenum = 0
        while tablepos <= tableend:
            out = b''
            ptr = rom[tablepos+(poinnum*3):tablepos+(poinnum*3)+3]
            readpos = unmap(int.from_bytes(ptr, byteorder="little"))
            if (int.from_bytes(ptr, byteorder="little") & 0x8000) == 0:
                # end of table, if applicable
                break
            out, readpos = read_string(readpos, rom, char_array)
            with open(outname + str(filenum) + outext, 'wb') as o:
                o.write(out)
            filenum += 1
            poinnum +=1








    input("Press Enter to continue.")








if __name__ == "__main__":
    main()
