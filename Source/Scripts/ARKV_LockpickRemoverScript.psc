Scriptname ARKV_LockpickRemoverScript extends Quest  

Actor Property PlayerRef Auto
MiscObject Property Lockpick Auto

ObjectReference lock
int lockLevel

Event OnInit()
    RegisterForMenu("Lockpicking Menu")
    lockLevel = -1
EndEvent

Event OnMenuOpen(String menuName)
    lock = (RogueUI.GetAssociatedMenuForm(menuName))[0] as ObjectReference
    lockLevel = lock.GetLockLevel()
EndEvent

Event OnMenuClose(String menuName)
    If (lockLevel > -1 && lock && !lock.IsLocked())
        ; Debug.MessageBox("dog")
        PlayerRef.RemoveItem(Lockpick, 1, false)
    EndIf
    lockLevel = -1
    lock = None
EndEvent