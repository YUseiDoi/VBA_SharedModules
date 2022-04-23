Attribute VB_Name = "SM_StringOperation"
Option Explicit

'���p�J�i����S�p�J�i�ɕϊ�
Public Function HankakuToZenkaku(ByVal sInput As String) As String
    Dim sOutput As String: sOutput = ""
    Dim sPhrase As String: sPhrase = ""
    
    Dim i As Long
    For i = 1 To Len(sInput)
        Dim sChar As String: sChar = Mid(sInput, i, 1)
        If (AscW("�") <= AscW(sChar)) And (AscW(sChar) <= AscW("�")) Then
            sPhrase = sPhrase & sChar
        Else
            If sPhrase <> "" Then
                sOutput = sOutput & StrConv(sPhrase, vbWide)
                sPhrase = ""
            End If
            sOutput = sOutput & sChar
        End If
    Next i
    
    If sPhrase <> "" Then
        sOutput = sOutput & StrConv(sPhrase, vbWide)
    End If
    
    HankakuToZenkaku = sOutput
End Function

'�p�����̂ݔ��p�ɕϊ�
Public Function AscEx(strOrg As String) As String

  Dim strRet As String
  Dim intLoop As Integer
  Dim strChar As String

  strRet = ""

  For intLoop = 1 To Len(strOrg)
 
    strChar = Mid(strOrg, intLoop, 1)
   
    If (strChar >= "�O" And strChar <= "�X") _
    Or (strChar >= "�`" And strChar <= "�y") _
    Or (strChar >= "��" And strChar <= "��") Then
      strRet = strRet & StrConv(strChar, vbNarrow)
    Else
      strRet = strRet & strChar
    End If

  Next intLoop
 
  AscEx = strRet

End Function

'�S�p�J�i���甼�p�J�i�ɕϊ�
Public Function CnvZenKanaToHan(a_sZen)
    Dim reg         As New RegExp       '// ���K�\���N���X�I�u�W�F�N�g
    Dim oMatches    As MatchCollection  '// RegExp.Execute����
    Dim oMatch      As Match            '// �������ʃI�u�W�F�N�g
    Dim i                               '// ���[�v�J�E���^
    Dim iCount                          '// ������v����
    Dim sConv                           '// ���p�J�^�J�i�ϊ��㕶����
    Dim sInput As String
    
    '// �����������A������S�p�J�^�J�i
    reg.Pattern = "[�@-�[]+"
    '// �����͈́�������̍Ō�܂Ō���
    reg.Global = True
    '// ���������񂩂�S�p�J�^�J�i������
    Set oMatches = reg.Execute(a_sZen)
    
    '// ������v�������擾
    iCount = oMatches.Count
    
    '// �ϊ��㕶����ɕϊ��O�������ݒ�
    sInput = a_sZen
    
    '// �A������S�p�J�^�J�i�̐��������[�v
    For i = 0 To iCount - 1
        '// �����Ɉ�v�����S�p�J�^�J�i�������擾
        Set oMatch = oMatches.Item(i)
        
        '// �����Ɉ�v�����S�p�J�^�J�i�𔼊p�ɕϊ�
        sConv = StrConv(oMatch.Value, vbNarrow)
        
        '// ���p�ɕϊ�
        sInput = Replace(sInput, oMatch.Value, sConv)
    Next
    CnvZenKanaToHan = sInput
End Function

'�󔒕������폜����
Public Function RemoveWhiteSpace(ByVal sInput As String) As String
    If InStr(sInput, " ") > 0 Then
        sInput = Replace(sInput, " ", "")
    End If
    If InStr(sInput, "�@") > 0 Then
        sInput = Replace(sInput, "�@", "")
    End If
    If InStr(sInput, "  ") > 0 Then
        sInput = Replace(sInput, "  ", "")
    End If
    If InStr(sInput, "/") > 0 Then
        sInput = Replace(sInput, "/", "")
    End If
    If InStr(sInput, ":") > 0 Then
        sInput = Replace(sInput, ":", "")
    End If
    RemoveWhiteSpace = sInput
End Function

' ���{��݂̂𒊏o����
Public Function FindJapaneseRegExp(ByVal sInput As String) As String
    Dim oRegEx As RegExp
    Dim vResult As Variant
    Dim vEachResult As Variant
    Dim sResult As String
    Dim i As Long: i = 1
    Set oRegEx = New RegExp
    oRegEx.Pattern = "[��-��@-����-ꞁV�X�Y�Z�-�]{1,}"        ' �������������{��ȊO�𒊏o
    oRegEx.Global = True        ' ������̍Ō�܂Ō�������
    If oRegEx.test(sInput) Then
        Set vResult = oRegEx.Execute(sInput)        '  �w��Z���̓��{��ȊO���󕶎��ɒu��������
    End If
    For Each vEachResult In vResult
        If i > 1 Then sResult = sResult & ";"
        sResult = sResult & vEachResult
        i = i + 1
    Next
    FindJapaneseRegExp = sResult
End Function
