Attribute VB_Name = "SM_Shell"
Option Explicit

'�v���Z�X�폜
Public Function KillProcess(ByVal sProcessName As String)
    Dim oServ As Object
    Dim cProc As Variant
    Dim oProc As Object
    
    Set oServ = GetObject("winmgmts:")
    Set cProc = oServ.ExecQuery("Select * from Win32_Process")
    
    For Each oProc In cProc
        If oProc.Name = sProcessName Then
            On Error Resume Next
                oProc.Terminate
            On Error GoTo 0
        End If
    Next
End Function
