
rlUnknown9A8000 ; 9A/8000

	.al
	.autsiz
	.databank ?

	lda lR18
	sta aProcSystem.wInput1,b
	lda lR18+1
	sta aProcSystem.wInput2,b

	lda #(`procUnknown9A8019)<<8
	sta lR44+1
	lda #<>procUnknown9A8019
	sta lR44
	jsl rlProcEngineCreateProc

	rtl

.include "PROCS/Unknown9A8019.asm"

rlCreateChapterTitleWindow ; 9A/8133

	.al
	.autsiz
	.databank ?

	lda lR18
	sta aProcSystem.wInput1,b
	lda lR18+1
	sta aProcSystem.wInput2,b

	lda #(`procChapterTitle)<<8
	sta lR44+1
	lda #<>procChapterTitle
	sta lR44
	jsl rlProcEngineCreateProc

	rtl

.include "PROCS/ChapterTitle.asm"

