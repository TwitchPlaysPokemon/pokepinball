HandleBallLossGengarBonus: ; 0xdf1a
	ld a, [wd4ad]
	ld hl, wCurrentStage
	cp [hl]
	ret z
	ld a, [wd6a8]
	and a
	jr nz, .asm_df57
	ld a, [wd6a2]
	cp $5
	jr c, .asm_df50
	xor a
	ld [wd4ae], a
	ld a, [wd6a7]
	and a
	ret nz
	ld [wd548], a
	ld [wd549], a
	ld [wBallSpin], a
	ld [wBallRotation], a
	ld hl, wBallXVelocity
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $1
	ld [wd6a7], a
.asm_df50
	lb de, $00, $02
	call PlaySoundEffect
	ret

.asm_df57
	xor a
	ld [wd495], a
	ld a, $1
	ld [wd496], a
	ld a, $2
	ld [wd4c8], a
	xor a
	ld [wd7ac], a
	ld a, [wCompletedBonusStage]
	and a
	ret nz
	call FillBottomMessageBufferWithBlackTile
	call Func_30db
	ld hl, wd5dc
	ld de, EndGengarStageText
	call LoadTextHeader
	ret
