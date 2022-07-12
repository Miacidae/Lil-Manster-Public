* = $000000
.logical $808000

	.include "Break.asm"
	.include "Joypad.asm"
	.include "BufferCopy.asm"
	.include "VBlankAndIRQ.asm"
	.include "ClearSprites.asm"
	.include "DMAByPushedPointer.asm"
	.include "OAMBuffer.asm"
	.include "Reset.asm"

.here

* = $000BD0
.logical $808BD0
	.include "SoundSystem.asm"
.here

* = $001B00
.logical $809B00
	.include "Code809B00.asm"
.here

* = $00291F
.logical $80A91F
	.include "Math.asm"
	.include "Fade.asm"
.here

* = $002C95
.logical $80AC95
	.include "DMA.asm"
.here

* = $002F93
.logical $80AF93
	.include "DecompByList.asm"
	.include "Code80B04B.asm"
.here

* = $0030D1
.logical $80B0D1
	.include "RNG.asm"
.here

* = $003208
.logical $80B208
	.include "PrepareBlockCopyRAM.asm"
.here

;	.include "Code80B231.asm"

* = $003340
.logical $80B340
	.include "BlockOperations.asm"
.here

* = $003554
.logical $80B554
	.include "Decompressor.asm"
	.include "Code80B88F.asm"
.here




* = $005E00
.logical $80DE00
	.include "RangePath.asm"
.here

* = $008000
.logical $818000
	.include "ActiveSpriteEngine.asm"
.here

* = $00A800
.logical $81A800
	.include "UpdateMaps.asm"
.here

;	.include "PhaseGraphics.asm"
;	.include "PROCS/PhaseGraphics.asm"
;	.include "PROCS/Unknown81B941.asm"

* = $00B982
.logical $81B982
	.include "Code81B982.asm"
	.include "PROCS/Unknown81BAC5.asm"
.here

* = $00BB21
.logical $81BB21
	.include "Code81BB21.asm"
.here

;	.include "PROCS/Unknown81BDA3.asm"
;	.include "PROCS/Unknown81BE18.asm"
;	.include "BattleForecast.asm"

* = $00C213
.logical $81C213
	.include "PROCS/PrepScreenMapScroll.asm"
.here

;	.include "SoundIfNotMuted.asm"

* = $00C318
.logical $81C318
	.include "ObjectiveMarkers.asm"
	.include "Code81C466.asm"
	.include "PROCS/FadeInClearJoypad.asm"
.here

* = $00C525
.logical $81C525
	.include "Save.asm"
.here

* = $00CE55
.logical $81CE55
    .include "Inventory.asm"
    .include "GetLeaderString.asm"
.here

* = $00FA24
.logical $81FA24
    .include "InventoryInfoWindows.asm"
.here

* = $00F108
.logical $81F108
	.include "PROCS/PrepItemsTradeInitiatorCursor.asm"
.here

;	.include "PROCS/EventTest.asm"
;	.include "PROCS/MapSwitch.asm"
;	.include "PROCS/NP.asm"

* = $00F590
.logical $81F590

    .include "PROCS/ItemInfo.asm"
    .include "PROCS/SkillInfo.asm"

.here

* = $010672
.logical $828672
	.include "PROCS/Dialogue.asm"
.here

;	.include "PROCS/ME.asm"

* = $010D2D
.logical $828D2D
	.include "PROCS/DialogueWithBG.asm"
.here

* = $010E2E
.logical $828E2E
	.include "PROCS/MusicEvent.asm"
	.include "PROCS/EventPause.asm"	
.here

* = $010EAC
.logical $828EAC
	.include "PROCS/EventFade.asm"
	.include "PROCS/Unknown828F09.asm"	
	.include "PROCS/MapScroll.asm"
	.include "PROCS/UnitAction.asm"	
.here

* = $01102B
.logical $82902B	
	.include "PROCS/Portraits.asm"
.here

* = $011BD5
.logical $829BD5
	.include "ProcEngine.asm"
	.include "ProcCode.asm"
	.include "PROCS/Fade.asm"
.here

;	.include "PROCS/Decompress.asm"
;	.include "PROCS/SoundByte.asm"

* = $012396
.logical $82A396
	.include "HDMAArrayEngine.asm"
	.include "HDMAArrayCode.asm"
	.include "IRQArrayEngine.asm"
.here

;	.include "UnknownChecksumChecker.asm"

* = $012989
.logical $82A989
	.include "Code82A989.asm"
.here


* = $018000
.logical $838000

	segmentStart
	.include "Code838000.asm"
	segmentEnd

.here

* = $060000
.logical $8C8000
	.include "EventEngine.asm"	
.here	

* = $06550E
.logical $8CD50E
	.include "Code8CD50E.asm"
.here	

* = $0D1C3C
.logical $9A9C3C
	segmentStart
	.include "GetWarpTileTargetCoords.asm"
	segmentEnd
.here

* = $0D653D
.logical $9AE53D
	.include "PROCS/DemoRain.asm"
.here


; Hacky LM fixes
.include "hacky/hostagec.asm"
.include "hacky/ending_prolong.asm"
.include "hacky/epiloguedeathfix.asm"
.include "hacky/fixshop.asm"
.include "hacky/loop_epilogue_song.asm"























