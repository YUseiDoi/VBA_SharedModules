Attribute VB_Name = "SharedGetPersonalInfo"
Option Explicit

'�_�E�����[�h�t�H���_�̃p�X
Public sGblDownloadPath As String
'PDF�ۑ���t�H���_�̃p�X
Public sGblPDFPath As String
'�v�����^��
Public sGblPrinterName As String


'�g�p���̃v�����^�����擾����
Public Function GetPrinterName()
    '�ʏ�g���v�����^�[���擾
    Dim activePrinter As String
    activePrinter = Application.activePrinter
    If activePrinter = "" Then
        MsgBox "�v�����^�[��񂪎擾�ł��܂���ł���" & Chr(13) & "�v�����^�[���ڑ�����Ă��邱�Ƃ��m�F���Ă�������"
        Call CleanExit
    End If
    
    '�v�����^����؂�o���ׂ̕�����
    Dim usePrinter As String '�|�[�g���������v�����^��
    usePrinter = Left(activePrinter, InStr(activePrinter, " on ") - 1)
    Debug.Print usePrinter
    
    '�O���[�o���ϐ��ɑ��
    sGblPrinterName = usePrinter
    Debug.Print sGblPrinterName
End Function

'�_�E�����[�h�t�H���_�̃p�X���擾����
Public Function GetDownloadFolderPath()
    'Dim wsh As Object
    'Set wsh = CreateObject("WScript.Shell") ' �C���X�^���X��
    'Dim sPath As String
    'sPath = wsh.SpecialFolders("Desktop")
    'sPath = Left(sPath, InStr(sPath, "Desktop") - 1) & "Downloads"
    'sGblDownloadPath = sPath
    sGblDownloadPath = CreateObject("Shell.Application").Namespace("shell:Downloads").Self.Path
    Debug.Print sGblDownloadPath
End Function

'PDF�ۑ���̃t�H���_�p�X���擾
Public Function GetASNETPDFFolderPath()
    sGblPDFPath = Application.ActiveWorkbook.Path & "\�_�E�����[�hPDF\"
    Debug.Print sGblPDFPath
End Function
