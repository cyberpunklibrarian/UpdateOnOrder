;Let's get started. Launch Polaris toolbar and get URLs
clipboard = ;clear clipboard
Run "C:\Program Files (x86)\Polaris\4.1\Bin\Polaris.exe"
Sleep, 10000 ;allow for load time
;submit ##PASSWORD## below
SendInput ;##INSERT YOUR POLARIS USER PASSWORD BEFORE THE SEMICOLON##
Sleep, 2000
SendInput {Enter}{Enter}
Sleep, 10000 ;allow time to authenticate
SendInput !m
SendInput xs
Sleep, 8000 ;allow time for window to load
SendInput {Right}
Sleep, 500
SendInput {Down}{Down}{Tab}{Right}{Right}{Right}{Right}
Loop, 10
	{
		SendInput {Down}
	}
Sleep, 500
SendInput, {Enter}
Sleep, 1000
SendInput {ShiftDown}{Tab}
Sleep, 500
SendInput {ShiftUp}
SendInput {Right}
SendInput {Tab}
SendInput {Down}{Down}{Down}{Down}
SendInput {Tab}{Tab}{Tab}{Tab}

;Select & change DVD & Blu-Ray
SendInput {Down}{Down}{Tab}{Tab}{Enter}
Sleep, 1000
SendInput {Tab}
Sleep, 2000
SendInput ^c
Sleep, 2000
OldDVD = %clipboard%
TempDVD := SubStr(OldDVD, 39, 3)
ChangeDVD := TempDVD + 1
NewDVD = http://www.wowbrary.org/nu.aspx?p=306-%ChangeDVD%-DVD
clipboard =
clipboard = %NewDVD%
SendInput ^v
Sleep, 1000
SendInput {Enter}
Sleep, 1000

;Select & change Book on CD
SendInput {Shift Down}{Tab}{Tab}
SendInput {Shift Up}
SendInput {Down}
SendInput {Tab}{Tab}{Enter}
Sleep, 1000
SendInput {Tab}
Sleep, 2000
SendInput ^c
Sleep, 2000
OldAUD = %clipboard%
TempAUD := SubStr(OldAUD, 39, 3)
ChangeAUD := TempAUD + 1
NewAUD = http://www.wowbrary.org/nu.aspx?p=306-%ChangeAUD%-AUD
clipboard =
clipboard = %NewAUD%
SendInput ^v
Sleep, 1000
SendInput {Enter}
Sleep, 1000

;Select & change CDs
SendInput {Shift Down}{Tab}{Tab}
SendInput {Shift Up}
SendInput {Down}
SendInput {Tab}{Tab}{Enter}
Sleep, 1000
SendInput {Tab}
Sleep, 2000
SendInput ^c
Sleep, 2000
OldCDS = %clipboard%
TempCDS := SubStr(OldCDS, 39, 3)
ChangeCDS := TempCDS + 1
NewCDS = http://www.wowbrary.org/nu.aspx?p=306-%ChangeCDS%-CDS
clipboard =
clipboard = %NewCDS%
SendInput ^v
Sleep, 1000
SendInput {Enter}
Sleep, 1000

;changes made, get out and save
SendInput, {Tab}{Tab}{Tab}{Enter}
Sleep, 2000
SendInput ^s
Sleep, 2000
SendInput !{F4}

;closing Polaris
WinActivate, Polaris ILS 4.1.640 - messerd [Administration] ;Change this to match *exactly* what your Polaris Staff Client window title says
Sleep, 1000
SendInput !{F4}
Sleep, 2000
SendInput {Enter}

;Write to log that process was completed.
; Change location in line 109 as needed.
FormatTime, Time,, MM/dd/yyyy h:mm tt

FileAppend, On-order update complete. New URL variable %ChangeCDS% here. Completed at %Time%.`n, C:\AHK Logs\Update On Order.txt
Sleep, 2000

Exit