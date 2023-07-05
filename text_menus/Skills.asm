; Skills

;	Messy repoint of Skill text

* = $00F98A
.byte $10

* = $00F999
.byte $10

* = $00F9AD
.byte $10

* = $00F9BC
.byte $10



;	Skill name pointers

	.section SkillNamePointersSection

		.word <>menutextWrathName
		.word <>menutextAnchorName
		.word <>menutextAdeptName
		.word <>menutextPaviseName
		.word <>menutextCharmName
		.word <>menutextNoncombatantName	; used to be Acrobat
		.word <>menutextNihilName
		.word <>menutextMiracleName
		.word <>menutextMiraclePlusName
		.word <>menutextVantageName
		.word <>menutextAccostName
		.word <>menutextAstraName
		.word <>menutextLunaSkillName
		.word <>menutextSolName
		.word <>menutextRenewalName
		.word <>menutextParagonName
		.word <>menutextStealName
		.word <>menutextDanceName
		.word <>menutextBargainName

	.endsection SkillNamePointersSection

;	Skill description pointers

	.section SkillDescriptionPointersSection

		.word <>menutextWrathDescription
		.word <>menutextAnchorDescription
		.word <>menutextAdeptDescription
		.word <>menutextPaviseDescription
		.word <>menutextCharmDescription
		.word <>menutextNoncombatantDescription		; used to be Acrobat
		.word <>menutextNihilDescription
		.word <>menutextMiracleDescription
		.word <>menutextMiraclePlusDescription
		.word <>menutextVantageDescription
		.word <>menutextAccostDescription
		.word <>menutextAstraDescription
		.word <>menutextLunaSkillDescription
		.word <>menutextSolDescription
		.word <>menutextRenewalDescription
		.word <>menutextParagonDescription
		.word <>menutextStealDescription
		.word <>menutextDanceDescription
		.word <>menutextBargainDescription

	.endsection SkillDescriptionPointersSection

;	Skill name text
;	Character limit: 16 (counting the two leading spaces)


	.section SkillNamesSection

		menutextWrathName
			.text "  )Wrath\n"
			
		menutextAnchorName
			.text "  Anchor\n"
		
		menutextAdeptName
			.text "  Adept \n"
		
		menutextPaviseName
			.text "  Pavise\n"
		
		menutextCharmName
			.text "  Char{m}\n"
		
		menutextNoncombatantName
			.text "  +Nonco[mbatant\n"
		
		menutextNihilName
			.text "  +Nihil\n"
		
		menutextMiracleName
			.text "  (Miracle\n"
		
		menutextMiraclePlusName
			.text "  (Miracle{+}\n"
		
		menutextVantageName
			.text "  Vantage \n"
		
		menutextAccostName
			.text "  Accost\n"
		
		menutextAstraName
			.text "  Astra \n"
		
		menutextLunaSkillName
			.text "  Luna\n"
		
		menutextSolName
			.text "  Sol \n"
		
		menutextRenewalName
			.text "  Rene]wal\n"
		
		menutextParagonName
			.text "  Paragon \n"
		
		menutextStealName
			.text "  Steal \n"
		
		menutextDanceName
			.text "  Dance \n"
		
		menutextBargainName
			.text "  Bargain \n"
		
	.endsection SkillNamesSection





;	Skill description text
;	Character limit: 20
;	Line limit: 4

	.section SkillDescriptionsSection

		menutextWrathDescription
			.text "If ene[my attacks \n"
			.text "first, the user's \n"
			.text "counterattack ]will \n"
			.text "be a critical hit \n"
			.text "\n"
		
		menutextAnchorDescription
			.text "Prevents unit fro[m \n"
			.text "being captured\n"
			.text "\n"
		
		menutextAdeptDescription
			.text "{A}{S}{%} chance \n"
			.text "to perfor[m a \n"
			.text "consecutive attack\n"
			.text "\n"
		
		menutextPaviseDescription
			.text "{L}{V}{%} chance \n"
			.text "to negate ene[my's\n"
			.text "attack\n"
			.text "\n"
		
		menutextCharmDescription
			.text "Gives {+}{1}{0} Hit and\n"
			.text "Avoid to allies \n"
			.text "]within {3} tiles\n"
			.text "of the user \n"
			.text "\n"
		
		menutextNoncombatantDescription
			.text "Prevents unit fro[m \n"
			.text "being attacked\n"
			.text "\n"
		
		menutextNihilDescription
			.text "+Negates all ene[my \n"
			.text "co[mbat skills\n"
			.text "except for\n"
			.text "+Nihil itself \n"
			.text "\n"
		
		menutextMiracleDescription
			.text "{(}Lck x {3}{)}{%}\n"
			.text "chance to avoid all \n"
			.text "fatal da[mage for \n"
			.text "the rest of co[mbat \n"
			.text "\n"
		
		menutextMiraclePlusDescription
			.text "+Nullifies ene[my \n"
			.text "staves and status \n"
			.text "conditions. Avoids\n"
			.text "all fatal da[mage \n"
			.text "\n"
		
		menutextVantageDescription
			.text "User attacks first\n"
			.text "]when the ene[my\n"
			.text "initiates co[mbat \n"
			.text "\n"
		
		menutextAccostDescription
			.text "If user's {H}{P} and\n"
			.text "{A}{S} are higher than\n"
			.text "the ene[my's, adds\n"
			.text "one round of co[mbat\n"
			.text "\n"
		
		menutextAstraDescription
			.text "Skl {%} chance \n"
			.text "to attack five\n"
			.text "consecutive ti[mes\n"
			.text "\n"
		
		menutextLunaSkillDescription
			.text "Skl {%} chance \n"
			.text "for attack to ignore\n"
			.text "ene[my's defense\n"
			.text "\n"
		
		menutextSolDescription
			.text "Skl {%} chance \n"
			.text "for attack to heal\n"
			.text "for da[mage dealt \n"
			.text "\n"
		
		menutextRenewalDescription
			.text "Recover {5}{~}{1}{0}{%}\n"
			.text "of [maxi[mu[m {H}{P}\n"
			.text "every turn\n"
			.text "\n"
		
		menutextParagonDescription
			.text "Doubles experience\n"
			.text "gained by the user\n"
			.text "\n"
		
		menutextStealDescription
			.text "If user outspeeds a \n"
			.text "target, can Steal an\n"
			.text "ite[m ]with less )Wt\n"
			.text "than the user's Con \n"
			.text "\n"
		
		menutextDanceDescription
			.text "Use Dance co{mm}nand\n"
			.text "to grant an ally\n"
			.text "another action\n"
			.text "\n"
		
		menutextBargainDescription
			.text "Allo]ws user to \n"
			.text "buy fro[m shops \n"
			.text "at half price \n"
			.text "\n"
		
	.endsection SkillDescriptionsSection


;	Skill label pointers

	.section SkillTypeTextPointersSection

		aSkillTypeTextPointers

			.word <>menuTextClassSkill
			.word <>menutextPersonalSkill
			.word <>menutextWeaponSkill

	.endsection SkillTypeTextPointersSection


;	Skill label text
;	Character limit: 20

	.section SkillTypeTextSection

		menuTextClassSkill
			.text "Class Skill \n"
		
		menutextPersonalSkill
			.text "Personal Skill\n"
		
		menutextWeaponSkill
			.text ")Weapon Skill \n"

	.endsection SkillTypeTextSection
