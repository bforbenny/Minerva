
; ---- Other Functions ----
; Amountfile is a .csv that the user can use to see how much info was saved. 
minerva_Statistics(FileName, WordCount)
{
	if General_CollectStatistics = 0
		return

	GetWordCount()	

	; Average Typing speed is 40 wpm pr. https://www.typingpal.com/en/typing-test
	MinutesSaved := WordCount / 40
	
	; It will look like 28-12-2021 13:23
	FormatTime, CurrentDateTime,, dd-MM-yyyy HH:mm 
	
	; Check if file already exists. All other times than the very first run, it will exist.
	; If if not, create it and append, otherwise just append
	if FileExist("AmountUsed.csv") 					
	{
		FileAppend, %CurrentDateTime%`,%FileName%`,%WordCount%`,%MinutesSaved%`n, %A_ScriptDir%\AmountUsed.csv
	}
	else 										
	{
		FileAppend, Date`,Text`,Word Count`,Minutes Saved`n, %A_ScriptDir%\AmountUsed.csv
		FileAppend, %CurrentDateTime%`,%FileName%`,%WordCount%`,%MinutesSaved%`n, %A_ScriptDir%\AmountUsed.csv
	}
}

; Gets the amount of words on the clipboard
GetWordCount()
{
	Global TotalWords := 0
	Loop, parse, clipboard, %A_Space%,
	{
		TotalWords := %A_Index%
	}
}
