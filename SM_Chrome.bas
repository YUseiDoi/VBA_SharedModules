Attribute VB_Name = "SM_Chrome"
Option Explicit

Private Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As LongPtr)

Public Enum EGetType
    EGT_Unknown = -1
    EGT_ID
    EGT_Class
    EGT_LinkText
    EGT_Tag
    EGT_Name
    EGT_PartialLinkText
    EGT_XPath
End Enum

Public Enum EWebElementType
    EWT_Unknown = -1
    EWT_WebElement
    EWT_WebElements
End Enum

'Chrome
Public Driver As New ChromeDriver

'Chrome�̋N��
Public Function StartChrome()
InitRow:
    On Error GoTo SkipRow
        Driver.Start "chrome"
        Exit Function
    On Error GoTo 0
SkipRow:
    MsgBox "ChromeDriver�̎����o�[�W�����A�b�v�����s���܂�"
    Dim myCChromeDriverUpdate As CChromeDriverUpdate
    Set myCChromeDriverUpdate = New CChromeDriverUpdate
    Call KillProcess("chromedriver.exe")        ' Kill all chrome processes
    On Error GoTo Finish
        myCChromeDriverUpdate.UpdateDriver Chrome
    On Error GoTo 0
    MsgBox "ChromeDriver�̎����o�[�W�����A�b�v���������܂���"
    GoTo InitRow
Finish:
    MsgBox "ChromeDriver�̎����A�b�v�f�[�g�Ɏ��s���܂���" & Chr(10) & "�G���[��S���҂ɕ񍐂��Ă�������"
    Call CleanExit
End Function

'URL�̃T�C�g�ɃA�N�Z�X
Public Function ChromeVisitSite(ByVal sURL As String)
    Driver.Get sURL
End Function

'Chrome�̏I��
Public Function CloseChrome()
    Driver.Close
End Function

'Chrome�̈ꎞ��~
Public Function WaitChrome(ByVal lTime As Long)
    Driver.Wait lTime
End Function

'Chrome��WebElement�擾�܂őҋ@���郁�\�b�h
Public Function Chrome_getElement(ByRef Driver As Selenium.ChromeDriver, ByVal sElementName As String, ByVal sType As EGetType, Optional ByVal lWaitTime As Long = 20, Optional ByVal bParent As Boolean = False) As WebElement
    '�ҋ@����
    Dim dWaitTime As Date
    '�擾����WebElement
    Dim oCurrElement As WebElement
    Dim myBy As New By
    
    dWaitTime = DateAdd("s", lWaitTime, Now)
    Do
        Set oCurrElement = Nothing
        On Error Resume Next
        If sType = EGT_Class Then
            Set oCurrElement = Driver.FindElementByClass(sElementName)
        ElseIf sType = EGT_ID Then
            Set oCurrElement = Driver.FindElementById(sElementName)
        ElseIf sType = EGT_LinkText Then
            Set oCurrElement = Driver.FindElementByLinkText(sElementName)
        ElseIf sType = EGT_Tag Then
            Set oCurrElement = Driver.FindElementByTag(sElementName)
        ElseIf sType = EGT_Name Then
            Set oCurrElement = Driver.FindElementByName(sElementName)
        ElseIf sType = EGT_PartialLinkText Then
            Set oCurrElement = Driver.FindElementByPartialLinkText(sElementName)
        ElseIf sType = EGT_XPath Then
            Set oCurrElement = Driver.FindElementByXPath(sElementName)
        Else
            Set oCurrElement = Nothing
        End If
    Loop While dWaitTime > Now And oCurrElement Is Nothing
    
    If bParent Then
        Set oCurrElement = oCurrElement.FindElement(myBy.XPath(".."))
    End If
    
    Set Chrome_getElement = oCurrElement
    
End Function

'Chrome��WebElement�擾�܂őҋ@���郁�\�b�h
Public Function Chrome_getElements(ByRef Driver As Selenium.ChromeDriver, ByVal sElementName As String, ByVal sType As EGetType, Optional ByVal lWaitTime As Long = 20) As WebElements
    '�ҋ@����
    Dim dWaitTime As Date
    '�擾����WebElement
    Dim oCurrElements As WebElements
    
    dWaitTime = DateAdd("s", lWaitTime, Now)
    
    Do
        Set oCurrElements = Nothing
        On Error Resume Next
        If sType = EGT_Class Then
            Set oCurrElements = Driver.FindElementsByClass(sElementName)
        ElseIf sType = EGT_ID Then
            Set oCurrElements = Driver.FindElementsById(sElementName)
        ElseIf sType = EGT_LinkText Then
            Set oCurrElements = Driver.FindElementsByLinkText(sElementName)
        ElseIf sType = EGT_Tag Then
            Set oCurrElements = Driver.FindElementsByTag(sElementName)
        ElseIf sType = EGT_Name Then
            Set oCurrElements = Driver.FindElementsByName(sElementName)
        ElseIf sType = EGT_PartialLinkText Then
            Set oCurrElements = Driver.FindElementsByPartialLinkText(sElementName)
        ElseIf sType = EGT_XPath Then
            Set oCurrElements = Driver.FindElementsByXPath(sElementName)
        Else
            Set oCurrElements = Nothing
        End If
    Loop While dWaitTime > Now And oCurrElements Is Nothing
    
    Set Chrome_getElements = oCurrElements
    
End Function

' �v�f�����S�ɃN���b�N����
Public Function Chrome_ClickElement(ByRef oWebElement As WebElement, Optional ByVal lTimeOut As Long = 20)
    '�ҋ@����
    Dim dWaitTime As Date
    '�擾����WebElement
    Dim oCurrElements As WebElements
    
    dWaitTime = DateAdd("s", lTimeOut, Now)
    
    Do
        On Error Resume Next
            oWebElement.ScrollIntoView
            oWebElement.Click
            Exit Do
        On Error GoTo 0
    Loop While dWaitTime > Now
    
End Function

' Delay
Public Function Delay(ByVal lTimeOut As Long)
        '�ҋ@����
    Dim dWaitTime As Date
    dWaitTime = DateAdd("s", lTimeOut, Now)
    Do
        DoEvents
    Loop While dWaitTime > Now
End Function
