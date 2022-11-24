; ShareX extension for Minerva
; ================================
; Tested on PowerToys v0.64.1
;
; Available functions:
; - Open ShareX screenshot folder

minerva_ShareX( configured = 0){
    if configured = 0
        return
        
    if !ProcessExist("ShareX.exe"){
        return
    }

    
    folder_ShareX := A_MyDocuments . "\ShareX"
    settings_ShareX := folder_ShareX . "\ApplicationConfig.json"
    personal_ShareX := folder_ShareX . "\PersonalPath.cfg"
    folder_ShareXScreenshot := ""


    ; Using ShareX personal folder
    FileRead, personal_ShareX, %folder_ShareX%
    
    FileRead jsonSettings, %settings_ShareX%

    settingsData := Jxon_Load(jsonSettings)

    if settingsData.DefaultTaskSettings.OverrideScreenshotsFolder

    if !folder_ShareXScreenshot
        folder_ShareXScreenshot := folder_ShareX . "\Screenshots\"

    if settingsData.UseCustomScreenshotsPath = "true"
        folder_ShareXScreenshot := settingsData.CustomScreenshotsPath

    StringReplace, folder_ShareXScreenshot, folder_ShareXScreenshot, "\\" , "\"

    return folder_ShareXScreenshot
}
