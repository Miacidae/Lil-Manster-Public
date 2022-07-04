===========================================================================
===================Thracia 776 Tileset/World Map Editor====================
============================ Version 1.0.0  ===============================
============================Written by Robert==============================
===========================================================================

1. About
    This is a tileset editor for Fire Emblem: Thracia 776. Since Thracia 
    stores its world map as a tileset, it can also edit the world map.
    
2. Missing Features
    This is a beta release, so several features are missing.
    1. Editing palettes - currently there is no way to edit palettes. 
    2. Editing terrain data - currently the program can only edit the 
    graphical data of tilesets.
    
3. Basic Usage
    1. Open your ROM under File -> Open ROM.
    2. Make your edits.
    3. Export the files via File -> Export.
    4. Compress the files and insert them into your ROM at  an appropriate 
    address. You can use the FEBin compressor program "enc_fe45_new.exe" 
    for this:
    https://dl.dropboxusercontent.com/s/trx0vq6r6uca8zd/FEcompress.zip
    
4. Questions
    1. What version of Thracia should I use for this?
        In theory, this program should support all versions of Thracia.
        This includes NP, NP Rev. A, ROM, and translation patches.
        However it has currently not been extensivley tested with all 
        versions, so caveat emptor.
    2. Do I need a headered or unheadered ROM?
        The program should work with both headered and unheadered ROMS.
    3. There are some background tiles in the last row I can't edit!
        This is intentional. After Thracia loads the data for tilesets,
        it overwrites two tiles with solid color. I don't know why
        it does this, but it does, so these tiles can't be edited.
        
5. Detailed usage.
    After opening your ROM, the program will auto-load all of the
    information it needs for each of the tilesets in the game. It will
    default to displaying the last tileset (AKA the world map). 
    There are 4 sections of the program window to cover:
    1. Chapter Select - this allows you to select the chapter whose
    tileset you want to edit. It also shows the addresses of the data
    for each tileset(these cannot be edited). 
    
    2. Tileset Display - the big section on the left. This displayes
    the fully tileset. Clicking on a tile here will bring it into the
    active tile editor. 
    
    3. Active tile editor - Here you can edit the data of the 
    currently selected tile. The full 16x16 tile is shown in the top
    left, and you can click on the component backround tiles to bring
    one of them into focus for editing. The index of the curent background 
    tile is displayed to the right, alongside constols for the current 
    palette and vertical/horizontal flip.
    The current background tile is displayed below. Below that is the
    palette display. Here you can edit the pixels of the current 
    background tile. To change the color of a pixel, click on the desired 
    color in the palette display, then click on the pixel in the tile display
    to change its color.
    
    4. Backround Tileset Display - displays all of the background tiles 
    available in the current tileset. Double click on a tile here to set
    it as the active tile. You can also click and drag tiles onto another
    tile to copy its data.
    
    There are also some options in the menu bar. Under Edit there are Undo
    and Redo actions, also bound to hotkeys. Under Options there is a
    setting to "Highlight Shared BG Tiles" - this will highlight any tile 
    that uses the same background tile as the current active tile.
    
6. Briefly Explaining Tilesets
    In Thracia, every tileset has basically 3 graphical components:
        1. The "Tileset" - 16x16 tiles, each made up of four words containing
        an index to a backround tile, what palette to use, if the tile is 
        flipped horizontally, and if the tile is flipped vertically.
        2. The "Background Tiles" -  8x8 tiles of indexed color data. These are
        referenced by the 16x16 tiles.
        3. The "Palettes" - these store the actual color data for the tiles. 
        Each tileset has 5 associated palettes starting at palette index 3.
