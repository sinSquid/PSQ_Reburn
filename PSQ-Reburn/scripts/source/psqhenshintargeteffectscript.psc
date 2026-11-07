; Complete source recovered from the shipped PEX; no original PSC was available.
; The shipped PEX keeps all unrelated original bytecode; only Henshin has an early provider guard.
ScriptName PSQHenshinTargetEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
playersuccubusquestscript Property PSQ Auto

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnEffectStart(Actor akTarget, Actor akCaster)
  If akTarget == None || akTarget == PSQ.PlayerRef
    Return
  EndIf
  If !PSQ.IsHenshinchu
    If !PSQ.IsHenshined
      Self.Henshin(akTarget)
    Else
      Self.DisHenshin(akTarget)
    EndIf
  EndIf
EndEvent

Function Henshin(Actor Succu)
  If !PSQ.CanUseNPCTransformOutfit()
    Return
  EndIf
  Spell NPCTransformBonus = Game.GetFormFromFile(42480, "PSQ PlayerSuccubusQuest.esm") as Spell
  Bool PSQVisualRuntime = sKSE.GetPluginVersion("skee") >= 0 || sKSE.GetPluginVersion("NiOverride") >= 0
  Int i = 0
  PSQ.IsHenshinchu = True
  Int HenshinMoan = PSQ.SoundHenshinMoan.Play(Succu as ObjectReference)
  PSQ.SuccubusTransFXS.Play(Succu as ObjectReference, 0.5)
  Utility.Wait(0.5)
  PSQ.FireFXShader.Play(Succu as ObjectReference, 0.5)
  PSQ.ShockPlayerCloakFXShader.Play(Succu as ObjectReference, 0.5)
  PSQ.SetScaleSuccubus(-1, False)
  If PSQ.EnableBreastChangeSuccubus
    PSQ.SetBreastScaleSuccubus(-1, False)
  EndIf
  If PSQ.HenshinBuff && NPCTransformBonus != None
    NPCTransformBonus.SetNthEffectMagnitude(0, Succu.GetBaseAV("Health") * PSQ.HenshinBuffRateHealth / 100.0)
    NPCTransformBonus.SetNthEffectMagnitude(1, Succu.GetBaseAV("Magicka") * PSQ.HenshinBuffRateMagicka / 100.0)
    NPCTransformBonus.SetNthEffectMagnitude(2, Succu.GetBaseAV("Stamina") * PSQ.HenshinBuffRateStamina / 100.0)
    NPCTransformBonus.SetNthEffectMagnitude(3, Succu.GetBaseAV("CarryWeight") * PSQ.HenshinBuffRateCarry / 100.0)
    Succu.AddSpell(NPCTransformBonus, False)
  EndIf
  If PSQ.GetTransformArmorBonus() > 0.0
    PSQ.SuccubusArmorSpell.SetNthEffectMagnitude(0, PSQ.GetTransformArmorBonus())
    Succu.AddSpell(PSQ.SuccubusArmorSpell, False)
  EndIf
  If PSQ.CanWalkOnTheWater
    Succu.AddSpell(PSQ.SuccubusWaterWalking, False)
  EndIf
  If PSQ.HenshinEyes
    Int Eye = Succu.GetLeveledActorBase().GetNumHeadParts()
    i = 0
    While i < Eye
      If Succu.GetLeveledActorBase().GetNthHeadPart(i).GetType() == 2
        PSQ.OrgEyes = Succu.GetLeveledActorBase().GetNthHeadPart(i)
        i = Eye
      EndIf
      i += 1
    EndWhile
    Succu.ChangeHeadPart(PSQ.PSQSuccubusEyes)
  EndIf
  If PSQVisualRuntime
    niOverride.AddSkinOverrideInt(Succu as ObjectReference, True, False, 4, 7, -1, PSQ.PSQSkinColor, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddSkinOverrideInt(Succu as ObjectReference, True, False, 8, 7, -1, PSQ.PSQSkinColor, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddSkinOverrideInt(Succu as ObjectReference, True, False, 128, 7, -1, PSQ.PSQSkinColor, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddSkinOverrideInt(Succu as ObjectReference, True, False, 4194304, 7, -1, PSQ.PSQSkinColor, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddNodeOverrideString(Succu as ObjectReference, True, "Face [Ovl0]", 9, 0, "Textures\\PSQ\\Overlays\\FollowerSuccubusFace_0.dds", True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddNodeOverrideInt(Succu as ObjectReference, True, "Face [Ovl0]", 7, -1, 255, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddNodeOverrideFloat(Succu as ObjectReference, True, "Face [Ovl0]", 8, -1, 1.0, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddNodeOverrideInt(Succu as ObjectReference, True, "Face [Ovl0]", 0, -1, 255, True)
  EndIf
  If PSQVisualRuntime
    niOverride.AddNodeOverrideFloat(Succu as ObjectReference, True, "Face [Ovl0]", 1, -1, 0.0, True)
  EndIf
  If PSQ.HasNiOverrideRuntime()
    If PSQVisualRuntime && !niOverride.HasOverlays(Succu as ObjectReference)
      If PSQVisualRuntime
        niOverride.AddOverlays(Succu as ObjectReference)
      EndIf
    EndIf
  EndIf
  If PSQ.HenshinHair
    Int Hair = Succu.GetLeveledActorBase().GetNumHeadParts()
    i = 0
    While i < Hair
      If Succu.GetLeveledActorBase().GetNthHeadPart(i).GetType() == 3
        PSQ.OrgHair = Succu.GetLeveledActorBase().GetNthHeadPart(i)
        i = Hair
      EndIf
      i += 1
    EndWhile
    Succu.ChangeHeadPart(PSQ.PSQSuccubusHair)
  EndIf
  If PSQ.HenshinHairColor
    PSQ.OrgHairColor = Succu.GetLeveledActorBase().GetHairColor()
    PSQ.PSQSuccubusHairColor.SetColor(PSQ.PSQSuccubusHairColorInt)
    Succu.GetLeveledActorBase().SetHairColor(PSQ.PSQSuccubusHairColor)
    Succu.QueueNiNodeUpdate()
  EndIf
  If storageUtil.GetIntValue(Succu as Form, "PSQ_HasPenis", 0) == 1
    storageUtil.SetIntValue(Succu as Form, "PSQ_StillEquipPenis", 1)
  Else
    storageUtil.SetIntValue(Succu as Form, "PSQ_StillEquipPenis", 0)
  EndIf
  PSQ.HenshinPenis || storageUtil.GetIntValue(Succu as Form, "PSQ_HasPenis", 0) == 1
  PSQ.EnterTRXTargetFuta(Succu)
  If PSQ.HenshinBoots
    PSQ.OrgBoots = Succu.GetWornForm(128) as Armor
    Succu.AddItem(PSQ.PSQSuccubusBoots as Form, 1, True)
    Succu.EquipItem(PSQ.PSQSuccubusBoots as Form, True, True)
  EndIf
  If PSQ.HenshinCuirass
    PSQ.OrgArmor = Succu.GetWornForm(4) as Armor
    Succu.AddItem(PSQ.PSQSuccubusCuirass as Form, 1, True)
    Succu.EquipItem(PSQ.PSQSuccubusCuirass as Form, True, True)
  EndIf
  If PSQ.HenshinGloves
    PSQ.OrgGloves = Succu.GetWornForm(8) as Armor
    Succu.AddItem(PSQ.PSQSuccubusGauntlets as Form, 1, True)
    Succu.EquipItem(PSQ.PSQSuccubusGauntlets as Form, True, True)
  EndIf
  If PSQ.HenshinHorn
    Succu.AddItem(PSQ.PSQSuccubusHorns as Form, 1, True)
    Succu.EquipItem(PSQ.PSQSuccubusHorns as Form, True, True)
  EndIf
  If PSQ.HenshinWings
    Succu.AddItem(PSQ.PSQSuccubusWings as Form, 1, True)
    Succu.EquipItem(PSQ.PSQSuccubusWings as Form, True, True)
  EndIf
  If PSQ.HenshinTail
    Succu.AddItem(PSQ.PSQSuccubusTail as Form, 1, True)
    Succu.EquipItem(PSQ.PSQSuccubusTail as Form, True, True)
  EndIf
  If PSQ.HenshinFear
    PSQ.SuccubusFormFearSpell.Cast(Succu as ObjectReference, None)
  EndIf
  If PSQ.HenshinIsCrime
    Succu.AddToFaction(PSQ.SuccubusFoeFaction)
    Succu.SetAttackActorOnSight(True)
  EndIf
  Float BoosterRate = Math.sqrt(Math.sqrt(PSQ.SuccubusEXP.GetValue())) / 2.0
  If BoosterRate < 1.0
    BoosterRate = 1.0
  EndIf
  i = 0
  While i <= 6
    PSQ.SuccubusSpellBoostPerk.SetNthEntryValue(i, 1, BoosterRate)
    i += 1
  EndWhile
  If PSQ.EnableSuccubusSpellBooster
    PSQ.TransformBooster.SetValue(1.0)
  EndIf
  PSQ.IsHenshined = True
  PSQ.IsHenshinchu = False
EndFunction

Function DisHenshin(Actor Succu)
  If Succu == None || Succu == PSQ.PlayerRef
    Return
  EndIf
  Spell NPCTransformBonus = Game.GetFormFromFile(42480, "PSQ PlayerSuccubusQuest.esm") as Spell
  PSQ.IsHenshinchu = True
  PSQ.SuccubusTransFXS.Play(Succu as ObjectReference, 0.5)
  Utility.Wait(0.5)
  Float SavedHealth = Succu.GetActorValue("Health")
  Bool PreserveHealth = SavedHealth > 0.0 && !Succu.IsDead()
  If PreserveHealth
    Succu.RestoreActorValue("Health", Succu.GetActorValueMax("Health"))
  EndIf
  If NPCTransformBonus != None
    Succu.RemoveSpell(NPCTransformBonus)
  EndIf
  If Succu.HasSpell(PSQ.SuccubusHenshinBonusSpell as Form)
    Succu.RemoveSpell(PSQ.SuccubusHenshinBonusSpell)
  EndIf
  If PreserveHealth && !Succu.IsDead()
    PSQ.RestoreCleanupHealth(Succu, SavedHealth)
  EndIf
  Succu.RemoveSpell(PSQ.SuccubusWaterWalking)
  Succu.RemoveSpell(PSQ.SuccubusArmorSpell)
  PSQ.SetScaleHuman(-1, False)
  If PSQ.EnableBreastChangeSuccubus
    PSQ.SetBreastScaleHuman(-1, False)
  EndIf
  If PSQ.OrgEyes != None
    Succu.ChangeHeadPart(PSQ.OrgEyes)
  EndIf
  If PSQ.HenshinBody
    Succu.GetLeveledActorBase().SetSkin(PSQ.PSQHumanSkin)
    Succu.ChangeHeadPart(PSQ.PSQHumanHead)
    If PSQ.OrgHairColor == None && PSQ.OrgSkinColor == 0
      Succu.QueueNiNodeUpdate()
    EndIf
  EndIf
  If PSQ.OrgHair != None
    Succu.ChangeHeadPart(PSQ.OrgHair)
  EndIf
  If PSQ.OrgHairColor != None
    Succu.GetLeveledActorBase().SetHairColor(PSQ.OrgHairColor)
    Succu.QueueNiNodeUpdate()
  EndIf
  If storageUtil.GetIntValue(Succu as Form, "PSQ_HasPenis", 0) == 1
    PSQ.ExitTRXTargetFuta(Succu, True)
  EndIf
  Succu.RemoveItem(PSQ.PSQSuccubusBoots as Form, Succu.GetItemCount(PSQ.PSQSuccubusBoots as Form), True, None)
  Succu.RemoveItem(PSQ.PSQSuccubusCuirass as Form, Succu.GetItemCount(PSQ.PSQSuccubusCuirass as Form), True, None)
  Succu.RemoveItem(PSQ.PSQSuccubusGauntlets as Form, Succu.GetItemCount(PSQ.PSQSuccubusGauntlets as Form), True, None)
  If PSQ.OrgArmor != None
    If Succu.GetItemCount(PSQ.OrgArmor as Form) > 0
      Succu.EquipItem(PSQ.OrgArmor as Form, False, True)
    EndIf
  EndIf
  If PSQ.OrgGloves != None
    If Succu.GetItemCount(PSQ.OrgGloves as Form) > 0
      Succu.EquipItem(PSQ.OrgGloves as Form, False, True)
    EndIf
  EndIf
  If PSQ.OrgBoots != None
    If Succu.GetItemCount(PSQ.OrgBoots as Form) > 0
      Succu.EquipItem(PSQ.OrgBoots as Form, False, True)
    EndIf
  EndIf
  Succu.RemoveItem(PSQ.PSQSuccubusHorns as Form, Succu.GetItemCount(PSQ.PSQSuccubusHorns as Form), True, None)
  Succu.RemoveItem(PSQ.PSQSuccubusWings as Form, Succu.GetItemCount(PSQ.PSQSuccubusWings as Form), True, None)
  Succu.RemoveItem(PSQ.PSQSuccubusTail as Form, Succu.GetItemCount(PSQ.PSQSuccubusTail as Form), True, None)
  PSQ.TransformBooster.SetValue(0.0)
  Succu.RemoveFromFaction(PSQ.SuccubusFoeFaction)
  Succu.SetAttackActorOnSight(False)
  PSQ.OrgArmor = None
  PSQ.OrgGloves = None
  PSQ.OrgBoots = None
  PSQ.OrgEyes = None
  PSQ.IsHenshined = False
  PSQ.IsHenshinchu = False
EndFunction
