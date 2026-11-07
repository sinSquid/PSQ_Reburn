ScriptName PSQDXUBE Hidden

Bool Function HasOutfits() Global
  Return Game.GetModByName("PSQ UBE Outfits.esp") != 255 || Game.GetLightModByName("PSQ UBE Outfits.esp") != 65535
EndFunction

Armor Function GetRawPart(Int Part) Global
  ; Retained public signature; the retired DX provider is never selected.
  Return None
EndFunction

Armor Function GetConvertedPart(Int Selection, Int Part) Global
  If Selection != 2 || Part < 0 || Part > 5
    Return None
  EndIf
  If !PSQDXUBE.HasOutfits()
    Return None
  EndIf
  Return Game.GetFormFromFile(2304 + Part, "PSQ UBE Outfits.esp") as Armor
EndFunction

Armor Function GetOriginalPart(Int Selection, Int Part) Global
  If Selection != 2 || Part < 0 || Part > 5
    Return None
  EndIf
  Return Game.GetFormFromFile(40847 + Part * 2, "PSQ PlayerSuccubusQuest.esm") as Armor
EndFunction

Armor Function GetOutfitPart(Actor Target, Int Selection, Int Part) Global
  If Target == None
    Return None
  EndIf
  If PSQRaceCompatibility.IsUBEActor(Target)
    Return PSQDXUBE.GetConvertedPart(Selection, Part)
  EndIf
  Return PSQDXUBE.GetOriginalPart(Selection, Part)
EndFunction

Armor Function GetPart(Actor Target, Int Part) Global
  If Target == None || !PSQRaceCompatibility.IsUBEActor(Target)
    Return None
  EndIf
  Return PSQDXUBE.GetRawPart(Part)
EndFunction

Int Function GetItemPart(Armor Item) Global
  If Item == None
    Return -1
  EndIf
  Int ID = PSQDXUBE.GetLocalFormID(Item)
  Return PSQDXUBE.GetVerifiedPartForID(Item, ID)
EndFunction

Int Function GetItemSelection(Armor Item) Global
  Int ID = PSQDXUBE.GetLocalFormID(Item)
  If PSQDXUBE.GetVerifiedPartForID(Item, ID) < 0
    Return 0
  EndIf
  Return PSQDXUBE.GetSelectionForVerifiedID(ID)
EndFunction

Int Function GetLocalFormID(Armor Item) Global
  If Item == None
    Return -1
  EndIf
  Int ID = Item.GetFormID()
  If Math.LogicalAnd(Math.RightShift(ID, 24), 255) == 254
    Return Math.LogicalAnd(ID, 4095)
  EndIf
  Return Math.LogicalAnd(ID, 16777215)
EndFunction

Armor Function ResolvePart(Actor Target, Armor Item, Int Part) Global
  If Target == None || Item == None || Part < 0 || Part > 5
    Return None
  EndIf
  Int ID = PSQDXUBE.GetLocalFormID(Item)
  Int FoundPart = PSQDXUBE.GetVerifiedPartForID(Item, ID)
  If FoundPart >= 0 && FoundPart != Part
    Return None
  EndIf
  Bool WantUBE = PSQRaceCompatibility.IsUBEActor(Target)
  If FoundPart < 0
    If WantUBE
      Return None
    EndIf
    Return Item
  EndIf
  ; Old records remain identifiable for removal and recovery, but cannot
  ; enter a new equipment plan after their outfit provider is retired.
  Int Selection = PSQDXUBE.GetSelectionForVerifiedID(ID)
  If Selection != 2
    Return None
  EndIf
  ; Of the verified records, the UBE ESP-FEs use 0x820..0x944 while
  ; PSQ's base equipment uses 0x9F83 and up. Same-family lookup is done.
  Bool AlreadyUBE = ID >= 2080 && ID <= 2372
  If WantUBE == AlreadyUBE
    Return Item
  EndIf
  If WantUBE
    Return PSQDXUBE.GetConvertedPart(Selection, Part)
  EndIf
  Return PSQDXUBE.GetOriginalPart(Selection, Part)
EndFunction

Bool Function SupportsItem(Actor Target, Armor Item) Global
  If Target == None || Item == None || !PSQRaceCompatibility.IsUBEActor(Target)
    Return False
  EndIf
  Int ID = PSQDXUBE.GetLocalFormID(Item)
  Return ID >= 2304 && ID <= 2309 && PSQDXUBE.GetVerifiedPartForID(Item, ID) >= 0
EndFunction

Int Function GetVerifiedPartForID(Armor Item, Int ID) Global
  ; Equal local IDs are common across mods. Each branch below verifies the
  ; actual record from the owning plugin before it accepts a catalogue slot.
  If Item == None
    Return -1
  EndIf
  Int Part = -1
  Int Selection = 0
  If ID >= 40835 && ID <= 40929 && (ID - 40835) % 2 == 0
    Part = ((ID - 40835) % 12) / 2
    Selection = (ID - 40835) / 12 + 1
    If Item == Game.GetFormFromFile(ID, "PSQ PlayerSuccubusQuest.esm") as Armor
      Return Part
    EndIf
  ElseIf ID >= 45056 && ID <= 45060
    Part = ID - 45056
    If Item == Game.GetFormFromFile(ID, "PSQ PlayerSuccubusQuest.esm") as Armor
      Return Part
    EndIf
  ElseIf ID >= 2080 && ID <= 2085
    Part = ID - 2080
    ; Passive old-save identity only; no DX availability probe or selection.
    If Item == Game.GetFormFromFile(ID, "PSQ UBE DX.esp") as Armor
      Return Part
    EndIf
  ElseIf ID >= 2304 && ID <= 2345
    Part = (ID - 2304) % 6
    Selection = (ID - 2304) / 6 + 2
    If Item == Game.GetFormFromFile(ID, "PSQ UBE Outfits.esp") as Armor
      Return Part
    EndIf
  ElseIf ID >= 2368 && ID <= 2372
    Part = ID - 2368
    If Item == Game.GetFormFromFile(ID, "PSQ UBE Outfits.esp") as Armor
      Return Part
    EndIf
  EndIf
  Return -1
EndFunction

Int Function GetSelectionForVerifiedID(Int ID) Global
  If ID >= 40835 && ID <= 40929
    Return (ID - 40835) / 12 + 1
  ElseIf ID >= 2304 && ID <= 2345
    Return (ID - 2304) / 6 + 2
  ElseIf ID >= 2080 && ID <= 2085
    Return 1
  EndIf
  Return 100
EndFunction
