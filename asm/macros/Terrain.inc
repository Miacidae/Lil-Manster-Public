
structTerrainEntry .struct MapEdge=?, Peak=?, Thicket=?, Cliff=?, Plain=?, Forest=?, Sea=?, River=?, Mountain=?, Sand=?, Castle=?, Fort=?, HouseOpen=?, Gate=?, ImpassableOutdoors=?, Desert=?, Bridge=?, Lake=?, Village=?, Ruins=?, ImpassableUnused=?, ImpassableHidden=?, Supply=?, ChurchOpen=?, HouseClosed=?, Road=?, Armory=?, Vendor=?, Arena=?, Floor=?, ImpassableIndoors=?, Throne=?, Door=?, ChestIndoors=?, Exit=?, Pillar=?, Drawbridge=?, Secret=?, ImpassableCrack=?, SandySoil=?, Altar=?, Seal=?, ChurchClosed=?, ChestOutdoors
	MapEdge				.char \MapEdge
	Peak				.char \Peak
	Thicket				.char \Thicket
	Cliff				.char \Cliff
	Plain				.char \Plain
	Forest				.char \Forest
	Sea					.char \Sea
	River				.char \River
	Mountain			.char \Mountain
	Sand				.char \Sand
	Castle				.char \Castle
	Fort				.char \Fort
	HouseOpen			.char \HouseOpen
	Gate				.char \Gate
	ImpassableOutdoors	.char \ImpassableOutdoors
	Desert				.char \Desert
	Bridge				.char \Bridge
	Lake				.char \Lake
	Village				.char \Village
	Ruins				.char \Ruins
	ImpassableUnused	.char \ImpassableUnused
	ImpassableHidden	.char \ImpassableHidden
	Supply				.char \Supply
	ChurchOpen			.char \ChurchOpen
	HouseClosed			.char \HouseClosed
	Road				.char \Road
	Armory				.char \Armory
	Vendor				.char \Vendor
	Arena				.char \Arena
	Floor				.char \Floor
	ImpassableIndoors	.char \ImpassableIndoors
	Throne				.char \Throne
	Door				.char \Door
	ChestIndoors		.char \ChestIndoors
	Exit				.char \Exit
	Pillar				.char \Pillar
	Drawbridge			.char \Drawbridge
	Secret				.char \Secret
	ImpassableCrack		.char \ImpassableCrack
	SandySoil			.char \SandySoil
	Altar				.char \Altar
	Seal				.char \Seal
	ChurchClosed		.char \ChurchClosed
	ChestOutdoors		.char \ChestOutdoors
	.ends

structTerrainNamePointer .struct Pointer
	Pointer .addr \Pointer
	.ends
