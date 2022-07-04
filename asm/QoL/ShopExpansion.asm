* = $029B26
.logical $859B26

lda #$0000
.byte $8D, $36, $18
lda # 2 | (0 << 8) ; X | Y coords
sta wR0
ldx #$0000
lda #$0088 			; portrait
jsl rlUnknown8CBF25 ; shopkeeper portrait proc
rtl 

.here

* = $0FF4D0
.logical $9FF4D0

ShopBG2ArmoryTilemapEdited .binary "ShopBG2ArmoryTilemapEdited.bin.fe4"
ShopBG2VendorTilemapEdited .binary "ShopBG2VendorTilemapEdited.bin.fe4"
ShopBG3TilemapEdited .binary "ShopBG3TilemapEdited.bin.fe4"

.here


; armory background

* = $029CB5 			
.logical $859CB5

lda #>`ShopBG2ArmoryTilemapEdited
sta lR18+1
lda #<>ShopBG2ArmoryTilemapEdited
sta lR18
lda #>`aBG2TilemapBuffer
sta lR19+1
lda #<>aBG2TilemapBuffer
sta lR19
jsl rlAppendDecompList

.here



; armory borders

* = $029CF0
.logical $859CF0

lda #>`ShopBG3TilemapEdited	 
sta lR18+1
lda #<>ShopBG3TilemapEdited
sta lR18
lda #>`aBG3TilemapBuffer
sta lR19+1
lda #<>aBG3TilemapBuffer 
sta lR19
jsl rlAppendDecompList
jsl rlDMAByStruct

.dstruct structDMAToVRAM, $7EE77C, $0700, $80, $A000

.here


; vendor background

* = $029C12 			
.logical $859C12

lda #>`ShopBG2VendorTilemapEdited
sta lR18+1
lda #<>ShopBG2VendorTilemapEdited
sta lR18
lda #>`aBG2TilemapBuffer
sta lR19+1
lda #<>aBG2TilemapBuffer
sta lR19
jsl rlAppendDecompList

.here


; vendor borders

* = $029C4D
.logical $859C4D

lda #>`ShopBG3TilemapEdited
sta lR18+1
lda #<>ShopBG3TilemapEdited
sta lR18
lda #>`aBG3TilemapBuffer
sta lR19+1
lda #<>aBG3TilemapBuffer 
sta lR19
jsl rlAppendDecompList
jsl rlDMAByStruct

.dstruct structDMAToVRAM, $7EE77C, $0700, $80, $A000

.here


* = $029DBC
.logical $859DBC

lda #$0009 		; shop description text y coord change;

.here

* = $00F818
.logical $81F818

lda #$000F 		; amount of lines cleared

.here


; HDMA Table Fix

* = $029E16
.logical $859E16 	

.binary "ShopBG2HDMATableEdited.bin" 	

.here
