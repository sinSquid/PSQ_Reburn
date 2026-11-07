; Optional AWU 1.3.0 equip-armor catalog. No quest, timer or hard master.
ScriptName PSQAWUWings Hidden

Bool Function IsAvailable() Global
  Return Game.GetModByName("Animated Wings Ultimate.esp") != 255 || Game.GetLightModByName("Animated Wings Ultimate.esp") != 65535
EndFunction

Armor[] Function BuildChoices(playersuccubusquestscript PSQ, Bool FollowOutfit) Global
  Bool Available = PSQAWUWings.IsAvailable()
  Armor[] Wings
  Int Offset = 1
  If FollowOutfit
    Offset = 8
    If Available
      Wings = new Armor[91]
    Else
      Wings = new Armor[8]
    EndIf
    Int i = 0
    While i < 8
      If PSQ != None
        Wings[i] = PSQ.GetOutfitWings(i + 1)
      EndIf
      i += 1
    EndWhile
  Else
    If Available
      Wings = new Armor[84]
    Else
      Wings = new Armor[1]
    EndIf
    If PSQ != None
      Wings[0] = PSQ.SuccubusStaticWings
    EndIf
  EndIf
  If Available
    Wings[Offset + 0] = Game.GetFormFromFile(0x000AD5, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 1] = Game.GetFormFromFile(0x000AE7, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 2] = Game.GetFormFromFile(0x000A89, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 3] = Game.GetFormFromFile(0x000AFE, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 4] = Game.GetFormFromFile(0x000B04, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 5] = Game.GetFormFromFile(0x000AFF, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 6] = Game.GetFormFromFile(0x000B05, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 7] = Game.GetFormFromFile(0x000AFD, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 8] = Game.GetFormFromFile(0x000B06, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 9] = Game.GetFormFromFile(0x000B00, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 10] = Game.GetFormFromFile(0x000B07, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 11] = Game.GetFormFromFile(0x000B01, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 12] = Game.GetFormFromFile(0x000B08, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 13] = Game.GetFormFromFile(0x000B02, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 14] = Game.GetFormFromFile(0x000B09, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 15] = Game.GetFormFromFile(0x000B03, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 16] = Game.GetFormFromFile(0x000B0A, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 17] = Game.GetFormFromFile(0x000CB4, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 18] = Game.GetFormFromFile(0x000CB3, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 19] = Game.GetFormFromFile(0x000CB2, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 20] = Game.GetFormFromFile(0x000CB1, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 21] = Game.GetFormFromFile(0x000AD3, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 22] = Game.GetFormFromFile(0x000ADA, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 23] = Game.GetFormFromFile(0x000AD2, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 24] = Game.GetFormFromFile(0x000AD1, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 25] = Game.GetFormFromFile(0x000AFC, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 26] = Game.GetFormFromFile(0x000AD8, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 27] = Game.GetFormFromFile(0x000AD0, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 28] = Game.GetFormFromFile(0x000B16, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 29] = Game.GetFormFromFile(0x000B17, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 30] = Game.GetFormFromFile(0x000B18, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 31] = Game.GetFormFromFile(0x000B19, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 32] = Game.GetFormFromFile(0x000B0B, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 33] = Game.GetFormFromFile(0x000AFB, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 34] = Game.GetFormFromFile(0x000AFA, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 35] = Game.GetFormFromFile(0x000AF9, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 36] = Game.GetFormFromFile(0x000CAF, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 37] = Game.GetFormFromFile(0x000AF8, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 38] = Game.GetFormFromFile(0x000CB0, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 39] = Game.GetFormFromFile(0x000A83, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 40] = Game.GetFormFromFile(0x000ACF, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 41] = Game.GetFormFromFile(0x000ACE, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 42] = Game.GetFormFromFile(0x000AD6, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 43] = Game.GetFormFromFile(0x000ADC, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 44] = Game.GetFormFromFile(0x000AF1, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 45] = Game.GetFormFromFile(0x000AF3, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 46] = Game.GetFormFromFile(0x000AF0, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 47] = Game.GetFormFromFile(0x000AF5, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 48] = Game.GetFormFromFile(0x000A8A, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 49] = Game.GetFormFromFile(0x000A8C, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 50] = Game.GetFormFromFile(0x000AD4, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 51] = Game.GetFormFromFile(0x000ACA, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 52] = Game.GetFormFromFile(0x000A88, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 53] = Game.GetFormFromFile(0x000A87, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 54] = Game.GetFormFromFile(0x000A86, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 55] = Game.GetFormFromFile(0x000A85, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 56] = Game.GetFormFromFile(0x000A84, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 57] = Game.GetFormFromFile(0x000A91, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 58] = Game.GetFormFromFile(0x000AD9, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 59] = Game.GetFormFromFile(0x000ACD, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 60] = Game.GetFormFromFile(0x000ADD, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 61] = Game.GetFormFromFile(0x000ADE, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 62] = Game.GetFormFromFile(0x000ADB, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 63] = Game.GetFormFromFile(0x000AEC, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 64] = Game.GetFormFromFile(0x000ADF, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 65] = Game.GetFormFromFile(0x000AE9, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 66] = Game.GetFormFromFile(0x000AEB, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 67] = Game.GetFormFromFile(0x000AE1, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 68] = Game.GetFormFromFile(0x000AE3, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 69] = Game.GetFormFromFile(0x000B14, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 70] = Game.GetFormFromFile(0x000AE0, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 71] = Game.GetFormFromFile(0x000B15, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 72] = Game.GetFormFromFile(0x000AE2, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 73] = Game.GetFormFromFile(0x000AEA, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 74] = Game.GetFormFromFile(0x000AE8, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 75] = Game.GetFormFromFile(0x000AED, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 76] = Game.GetFormFromFile(0x000AF2, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 77] = Game.GetFormFromFile(0x000AF4, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 78] = Game.GetFormFromFile(0x000A90, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 79] = Game.GetFormFromFile(0x000A8B, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 80] = Game.GetFormFromFile(0x000ACC, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 81] = Game.GetFormFromFile(0x000AD7, "Animated Wings Ultimate.esp") as Armor
    Wings[Offset + 82] = Game.GetFormFromFile(0x000ACB, "Animated Wings Ultimate.esp") as Armor
  EndIf
  Return Wings
EndFunction

Bool Function IsAWUWing(Armor Item) Global
  If Item == None || !PSQAWUWings.IsAvailable()
    Return False
  EndIf
  Int ID = Item.GetFormID()
  If Math.LogicalAnd(Math.RightShift(ID, 24), 255) == 254
    ID = Math.LogicalAnd(ID, 4095)
  Else
    ID = Math.LogicalAnd(ID, 16777215)
  EndIf
  If ID == 0x000AD5 || ID == 0x000AE7 || ID == 0x000A89 || ID == 0x000AFE || ID == 0x000B04 || ID == 0x000AFF || ID == 0x000B05 || ID == 0x000AFD || ID == 0x000B06 || ID == 0x000B00 || ID == 0x000B07 || ID == 0x000B01 || ID == 0x000B08 || ID == 0x000B02 || ID == 0x000B09 || ID == 0x000B03 || ID == 0x000B0A || ID == 0x000CB4 || ID == 0x000CB3 || ID == 0x000CB2 || ID == 0x000CB1 || ID == 0x000AD3 || ID == 0x000ADA || ID == 0x000AD2 || ID == 0x000AD1 || ID == 0x000AFC || ID == 0x000AD8 || ID == 0x000AD0 || ID == 0x000B16 || ID == 0x000B17 || ID == 0x000B18 || ID == 0x000B19 || ID == 0x000B0B || ID == 0x000AFB || ID == 0x000AFA || ID == 0x000AF9 || ID == 0x000CAF || ID == 0x000AF8 || ID == 0x000CB0 || ID == 0x000A83 || ID == 0x000ACF || ID == 0x000ACE || ID == 0x000AD6 || ID == 0x000ADC || ID == 0x000AF1 || ID == 0x000AF3 || ID == 0x000AF0 || ID == 0x000AF5 || ID == 0x000A8A || ID == 0x000A8C || ID == 0x000AD4 || ID == 0x000ACA || ID == 0x000A88 || ID == 0x000A87 || ID == 0x000A86 || ID == 0x000A85 || ID == 0x000A84 || ID == 0x000A91 || ID == 0x000AD9 || ID == 0x000ACD || ID == 0x000ADD || ID == 0x000ADE || ID == 0x000ADB || ID == 0x000AEC || ID == 0x000ADF || ID == 0x000AE9 || ID == 0x000AEB || ID == 0x000AE1 || ID == 0x000AE3 || ID == 0x000B14 || ID == 0x000AE0 || ID == 0x000B15 || ID == 0x000AE2 || ID == 0x000AEA || ID == 0x000AE8 || ID == 0x000AED || ID == 0x000AF2 || ID == 0x000AF4 || ID == 0x000A90 || ID == 0x000A8B || ID == 0x000ACC || ID == 0x000AD7 || ID == 0x000ACB
    Return Game.GetFormFromFile(ID, "Animated Wings Ultimate.esp") == Item
  EndIf
  Return False
EndFunction

String Function WingLabel(Armor Wing) Global
  If Wing == None
    Return "[AWU] Missing wing record"
  EndIf
  Return "[AWU] " + Wing.GetName()
EndFunction

Armor Function GetDisplacedWing(Actor Target, Armor Selected) Global
  If Target == None || Selected == None || Selected.GetSlotMask() == 0
    Return None
  EndIf
  Return Target.GetWornForm(Selected.GetSlotMask()) as Armor
EndFunction
