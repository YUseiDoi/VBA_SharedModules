Attribute VB_Name = "SM_FileOperation"
Option Explicit

'���[�J����HTML�t�@�C����Chrome�ŊJ��
Public Function OpenLocalFile(ByVal sPath As String)
    Dim wsh As Object
    Set wsh = CreateObject("Wscript.Shell")
    wsh.Run sPath, 1
    Set wsh = Nothing
End Function

'�t�@�C���̏ꏊ���ړ�����
Public Function MoveToAnyFolder(ByVal sOriginalPath As String, ByVal sNewPath As String, ByVal sFileName As String)
    Name sOriginalPath As sNewPath & sFileName
End Function

