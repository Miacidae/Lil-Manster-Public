;	Terrain repoints

* = $021FC8
.logical lorom($021FC8, 1)

.word	>`aTerrainTextData

.here

* = $021FD8
.logical lorom($021FD8, 1)

.long	aTerrainTextPointers

.here

;	Terrain pointers

	.section TerrainTextPointersSection

		.word	<>menutextTerrainNone
		.word	<>menutextTerrainPeak
		.word	<>menutextTerrainThicket
		.word	<>menutextTerrainCliff
		.word	<>menutextTerrainPlain
		.word	<>menutextTerrainForest
		.word	<>menutextTerrainSea
		.word	<>menutextTerrainRiver
		.word	<>menutextTerrainMountain
		.word	<>menutextTerrainSand
		.word	<>menutextTerrainCastle				; Unused
		.word	<>menutextTerrainFort
		.word	<>menutextTerrainHouseOpen
		.word	<>menutextTerrainGate
		.word	<>menutextTerrainImpassableOutdoors
		.word	<>menutextTerrainDesert
		.word	<>menutextTerrainBridge
		.word	<>menutextTerrainLake
		.word	<>menutextTerrainVillage			; Unused
		.word	<>menutextTerrainRuins
		.word	<>menutextTerrainImpassableUnused	; Unused
		.word	<>menutextTerrainImpassableHidden
		.word	<>menutextTerrainSupply
		.word	<>menutextTerrainChurchOpen
		.word	<>menutextTerrainHouseClosed		; Just "House" in vanilla FE5
		.word	<>menutextTerrainRoad
		.word	<>menutextTerrainArmory
		.word	<>menutextTerrainVendor
		.word	<>menutextTerrainArena
		.word	<>menutextTerrainFloor
		.word	<>menutextTerrainImpassableIndoors
		.word	<>menutextTerrainThrone
		.word	<>menutextTerrainDoor
		.word	<>menutextTerrainChestIndoors
		.word	<>menutextTerrainExit				; Unused, but exists in multiple tilesets.
		.word	<>menutextTerrainPillar
		.word	<>menutextTerrainDrawbridge
		.word	<>menutextTerrainSecret				; Unused
		.word	<>menutextTerrainImpassableCrack
		.word	<>menutextTerrainSandySoil			; Unused
		.word	<>menutextTerrainAltar				; Just "Floor" in vanilla FE5
		.word	<>menutextTerrainSeal				; Just "Floor" in vanilla FE5
		.word	<>menutextTerrainChurchClosed		; Just "Church" in vanilla FE5
		.word	<>menutextTerrainChestOutdoors

	.endsection TerrainTextPointersSection

;	Terrain names
;	Character limit: 10


	.section TerrainTextDataSection

		menutextTerrainNone
		menutextTerrainImpassableOutdoors
		menutextTerrainImpassableUnused
		menutextTerrainImpassableHidden
		menutextTerrainImpassableIndoors
		menutextTerrainImpassableCrack
			.text "{-}{-}\n"
		
		menutextTerrainPeak
			.text "Peak\n"
		
		menutextTerrainThicket
			.text "Thicket \n"
		
		menutextTerrainCliff
			.text "Cliff \n"
		
		menutextTerrainPlain
			.text "Plain \n"
		
		menutextTerrainForest
			.text "Forest\n"
		
		menutextTerrainSea
			.text "Sea \n"
		
		menutextTerrainRiver
			.text "River \n"
		
		menutextTerrainMountain
			.text "(Mountain \n"
		
		menutextTerrainSand
			.text "Sand\n"
		
		menutextTerrainCastle
			.text "Castle\n"
		
		menutextTerrainFort
			.text "Fort\n"
		
		menutextTerrainHouseOpen
			.text "House \n"
		
		menutextTerrainGate
			.text "Gate\n"
		
		menutextTerrainDesert
		menutextTerrainSandySoil
			.text ")Wasteland\n"
		
		menutextTerrainBridge
			.text "Bridge\n"
		
		menutextTerrainLake
			.text "Lake\n"
		
		menutextTerrainVillage
			.text "Village \n"
		
		menutextTerrainRuins
			.text "Ruins \n"
		
		menutextTerrainSupply
			.text "Supply\n"
		
		menutextTerrainChurchOpen
			.text "Church\n"
		
		menutextTerrainHouseClosed
		menutextTerrainChurchClosed
			.text "Closed\n"
		
		menutextTerrainRoad
			.text "Road\n"
		
		menutextTerrainArmory
			.text "Ar[mory \n"
		
		menutextTerrainVendor
			.text "Vendor\n"
		
		menutextTerrainArena
			.text "Arena \n"
		
		menutextTerrainFloor
			.text "Floor \n"
		
		menutextTerrainThrone
			.text "Throne\n"
		
		menutextTerrainDoor
			.text "Door\n"
		
		menutextTerrainChestIndoors
		menutextTerrainChestOutdoors
			.text "Chest \n"
		
		menutextTerrainExit
			.text "Exit\n"
		
		menutextTerrainPillar
			.text "Pillar\n"
		
		menutextTerrainDrawbridge
			.text "Dra]wbridge \n"
		
		menutextTerrainSecret
			.text "Secret\n"
		
		menutextTerrainAltar
			.text "Altar \n"
		
		menutextTerrainSeal
			.text "Seal\n"

	.endsection TerrainTextDataSection