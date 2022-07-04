
.cpu "65816"

.weak
  WARNINGS :?= "None"
.endweak

GUARD_ZQOL_INSTALLER :?= false
.if (GUARD_ZQOL_INSTALLER && (WARNINGS == "Strict"))

  .warn "File included more than once."

.elsif (!GUARD_ZQOL_INSTALLER)

  ; Fixed location inclusions

	.include "CombatLvlUp.asm"
	.include "ShopExpansion.asm"
	.include "GrowthDisplay.asm"
	.include "ExtendedItemBoxes.asm"
    .include "GuardAI.asm"
    .include "MovementSpeedup.asm"
    .include "SwapAnimationMode.asm"
    .include "TalkDisplay.asm"
    .include "EquippedItemPreview.asm"
    .include "HPBars.asm"

    .include "PrepsReordering.asm"

    .include "GlobalRangeDisplay.asm"

  ; Freespace inclusions

    * := $0C6C70
    .logical $98EC70



        .dsection GetEffectiveMoveSection

        .dsection GetMovingMapSpriteMovementSpeedSection

        .dsection GetPossibleAnimationModeSection

        .dsection TalkDisplaySection
        .dsection GetChapterTalkTargetTablePointerSection
		    .dsection VanillaChapterTalkTableSection
        .dsection ProcTalkDisplaySection

        .dsection KillEquippedItemPreviewProcSection
        .dsection DrawEquippedItemPreviewSection
        .dsection ProcEquippedItemPreviewSection
        .dsection DMAEquippedItemIconSection
        .dsection BurstWindowTilemapSection
        .dsection ClearBurstWindowTilemapLayerSection
        .dsection BurstWindowTilesSection

        .dsection TryRegisterHPBarSection
        .dsection RenderTallMapSpriteAndStatusLoopSection
        .dsection MissSpriteFrameSection
        .dsection ObjectiveMarkerHPBarEditsSection
        
    .here

.endif ; GUARD_ZQOL_INSTALLER
