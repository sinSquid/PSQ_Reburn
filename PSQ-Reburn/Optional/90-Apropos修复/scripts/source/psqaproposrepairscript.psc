; Recovered complete source from paired upstream v0.29 PEX by Champollion 1.3.2.
; Origin commit: 54575f64f9047bfe113cd34a27e73bdfb161c38f. This is not an original author source.
;/ Decompiled by Champollion v1.3.2
PEX format v3.2 GameID: 1
Source   : C:\Users\rockl\Documents\Codex\2026-10-03\skyrim-psq-d-nskv-jiziyu-mods\work\psq-apropos-repair-20261017\src\psqaproposrepairscript.psc
Compiled : 2026-10-17 00:45:38
User     : rockl
Computer : PRIMEMARK
/;
ScriptName PSQAproposRepairScript Extends ActiveMagicEffect

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Event OnEffectStart(Actor akTarget, Actor akCaster)
  playersuccubusquestscript PSQ = Game.GetFormFromFile(3426, "PSQ PlayerSuccubusQuest.esm") as playersuccubusquestscript ; #DEBUG_LINE_NO:3
  If !PSQ || akCaster != PSQ.PlayerRef || akTarget != akCaster ; #DEBUG_LINE_NO:4
    Return  ; #DEBUG_LINE_NO:5
  EndIf
  If !PSQ.HasAproposRepairIntegration() ; #DEBUG_LINE_NO:7
    Debug.Notification("未检测到可用的Apropos 2，无法修复损伤。") ; #DEBUG_LINE_NO:8
    Return  ; #DEBUG_LINE_NO:9
  EndIf
  If PSQ.SexLab.IsActorActive(akCaster) ; #DEBUG_LINE_NO:11
    Debug.Notification("请在互动结束后使用损伤修复。") ; #DEBUG_LINE_NO:12
    Return  ; #DEBUG_LINE_NO:13
  EndIf
  apropos2Actors Registry = Game.GetFormFromFile(167980, "Apropos2.esp") as apropos2Actors ; #DEBUG_LINE_NO:15
  If !Registry || !Registry.ShouldApplyWearAndTear(akCaster) ; #DEBUG_LINE_NO:16
    Debug.Notification("Apropos 2损伤功能未启用。") ; #DEBUG_LINE_NO:17
    Return  ; #DEBUG_LINE_NO:18
  EndIf
  apropos2ActorAlias Patient = Registry.GetAproposActor(akCaster) ; #DEBUG_LINE_NO:20
  If !Patient ; #DEBUG_LINE_NO:21
    Debug.Notification("没有可修复的撕裂损伤。") ; #DEBUG_LINE_NO:22
    Return  ; #DEBUG_LINE_NO:23
  EndIf
  If Patient.GetState() != "Tracking" ; #DEBUG_LINE_NO:25
    Debug.Notification("Apropos 2尚未就绪，请稍后重试。") ; #DEBUG_LINE_NO:26
    Return  ; #DEBUG_LINE_NO:27
  EndIf
  Int Damage = Patient.VaginalWearTearState + Patient.AnalWearTearState + Patient.OralWearTearState + Patient.AverageAbuseState + Patient.AverageCreatureAbuseState + Patient.AverageDaedricAbuseState ; #DEBUG_LINE_NO:29
  If Damage <= 0 ; #DEBUG_LINE_NO:30
    Debug.Notification("没有可修复的等级损伤，不消耗魅魔能量。") ; #DEBUG_LINE_NO:31
    Return  ; #DEBUG_LINE_NO:32
  EndIf
  If !PSQ.BeginAproposRepair() ; #DEBUG_LINE_NO:34
    Return  ; #DEBUG_LINE_NO:35
  EndIf
  Int Ticket = PSQ.AproposRepairTicket ; #DEBUG_LINE_NO:37
  Patient.OverrideVaginalWearTearState(0, True, True, True) ; #DEBUG_LINE_NO:38
  Patient.OverrideAnalWearTearState(0, True, True, True) ; #DEBUG_LINE_NO:39
  Patient.OverrideOralWearTearState(0, True, True, True) ; #DEBUG_LINE_NO:40
  Bool Success = Patient.VaginalWearTearState == 0 && Patient.AnalWearTearState == 0 && Patient.OralWearTearState == 0 && Patient.AverageAbuseState == 0 && Patient.AverageCreatureAbuseState == 0 && Patient.AverageDaedricAbuseState == 0 ; #DEBUG_LINE_NO:41
  PSQ.FinishAproposRepair(Ticket, Success) ; #DEBUG_LINE_NO:42
  If Success ; #DEBUG_LINE_NO:43
    Patient.UpdateWearTearEffects() ; #DEBUG_LINE_NO:44
    Patient.UpdateAbuseTextures(False) ; #DEBUG_LINE_NO:45
    Debug.Notification("魅魔之术：损伤修复完成。") ; #DEBUG_LINE_NO:46
  Else
    Debug.Notification("损伤修复未完成，已退还魅魔能量。") ; #DEBUG_LINE_NO:48
  EndIf
EndEvent
