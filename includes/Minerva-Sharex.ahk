; ShareX extension for Minerva
; ================================
; Tested on PowerToys v0.64.1
;
; Available functions:
; - Open ShareX screenshot folder

global folder_ShareX := A_MyDocuments . "\ShareX"
global settings_ShareX := folder_ShareX . "\ApplicationConfig.json"
global personal_ShareX := folder_ShareX . "\PersonalPath.cfg"
global folder_ShareXScreenshot := ""

initShareX( configured = 0){
    if !ProcessExist("ShareX.exe"){
        return 0
    }

    return configured
}

get_ShareXFolder(){
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

;--------------------------------------
; Internal functions
