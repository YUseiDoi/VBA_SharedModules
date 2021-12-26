Attribute VB_Name = "SharedKensakuZyouken"
Option Explicit

Private KensakuZyoukenWS As Worksheet
Private tblKensakuZyouken As ListObject
Private CKensakuZyouken As CKensakuZyouken
Private GooKensakuZyoukenWS As Worksheet
Private tblGooKensakuZyouken As ListObject
Private CGooKensakuZyouken As CGooKensakuZyouken
Private KensakuZyoukenFormWS As Worksheet

'�F�X�ȕϐ���������
Public Function InitializationObjects()
    Set KensakuZyoukenWS = Worksheets("��������")
    Set tblKensakuZyouken = KensakuZyoukenWS.ListObjects("���������e�[�u��")
    Set CKensakuZyouken = New CKensakuZyouken
    Set GooKensakuZyoukenWS = Worksheets("�s�ꉿ�i����")
    Set tblGooKensakuZyouken = GooKensakuZyoukenWS.ListObjects("Goo���������e�[�u��")
    Set CGooKensakuZyouken = New CGooKensakuZyouken
    Set KensakuZyoukenFormWS = Worksheets("ASNET���������t�H�[��")
End Function

Public Property Get SharedTblData() As ListObject
    If tblKensakuZyouken Is Nothing Then
        InitializationObjects
    End If
    Set SharedTblData = tblKensakuZyouken
End Property

Public Property Get KensakuZyouken() As CKensakuZyouken
    If CKensakuZyouken Is Nothing Then
        InitializationObjects
    End If
    Set KensakuZyouken = CKensakuZyouken
End Property

Public Property Get SharedGooTblData() As ListObject
    If tblGooKensakuZyouken Is Nothing Then
        InitializationObjects
    End If
    Set SharedGooTblData = tblGooKensakuZyouken
End Property

Public Property Get GooKensakuZyouken() As CGooKensakuZyouken
    If CGooKensakuZyouken Is Nothing Then
        InitializationObjects
    End If
    Set GooKensakuZyouken = CGooKensakuZyouken
End Property

Public Property Get KensakuZyoukenForm() As Worksheet
    If KensakuZyoukenFormWS Is Nothing Then
        InitializationObjects
    End If
    Set KensakuZyoukenForm = KensakuZyoukenFormWS
End Property
