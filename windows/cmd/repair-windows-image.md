# 修复 Windows 损坏的系统组件

```sh
# a quick check of an online image
sfc /scannow

# Scan the image to check for corruption
Dism /Online /Cleanup-Image /ScanHealth

# Check the image to see whether any corruption has been detected
Dism /Online /Cleanup-Image /CheckHealth

Dism /Online /Cleanup-Image /RestoreHealth

# repair an offline image using a mounted image as a repair source
Dism /Image:C:\offline /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows

# repair an online image using some of your own sources instead of Windows Update
Dism /Online /Cleanup-Image /RestoreHealth /Source:c:\test\mount\windows /LimitAccess
```

## DISM RestoreHealth stuck at 62.3%

[https://learn.microsoft.com/en-us/answers/questions/3897970/dism-restorehealth-stuck-at-62-3-(info-resolved)](https://learn.microsoft.com/en-us/answers/questions/3897970/dism-restorehealth-stuck-at-62-3-(info-resolved))

This issue has been asked a lot; Why? The reason for it; people look at the
value and it seems to be stuck at 62,3% for quite some time. (Many minutes. Hour
or hours even.) The question is understandable because everyone is asking; What
is my system doing?

I self ran against this problem for the first time after an 24H2 26100.3037
update to 24H2 26100.3194. I had never ever had this problem and after cleaning
the Component Store a /CheckHealth DISM command; It found problems. So I started
to fix it with the DISM /RestoreHealth command and till my amazement it got
stuck at 62,3% !!

 (I found: there was an issue build in the update 26100.3194. (Could be repeated
 at a separate VM) After an /AnalyzeComponentStore it found a number of
 reclaimable packages, so I ran the /StartComponentCleanup command. Check it's
 health again and suddenly it found problems. In my case a "photon" package
 (some internal Windows stuff) inside the C:\Windows\WinSxS directory that got
 damaged and needed repair.... It's called:

amd64_userexperience-photon_31bf3856ad364e35_10.0.26100.1591_none_faf85d9f2170dfcf )

"What is my system doing??...." Hanging? In the contrary; Your system is quite
busy with checking, downloading (Only with the /Online switch), applying.
checking etc. How can you see that? There is one useful command that tails the
log file of the DISM command. Start PowerShell as an admin and enter the
following command.

```sh
Get-Content C:\Windows\Logs\CBS\CBS.log -tail 10 -wait
```

Watch your Powershell screen; It's adding lines at the bottom each time the
CBS.log got updated by the DISM command. You can see it's progress here. It
should add new lines on a regular basis. The DISM command is really finished
when you see: "Ending TrustedInstaller finalization." Terminating the proces
premature won't help. At the next /RestoreHealth command it will start the whole
proces again, checking, checking, downloading, applying, checking.

You have to let it run as long as it takes it to finish. I my case I have a fast
system, disks & internet and for me this Restoring fase took me 20 minutes to
complete. (for me? Strangely very slow.) On slower machines it can take hours of
even longer. Be patient!! It speed is depending upon how fast your system is. If
you see NO lines added to your Powershell window; then there is something else
wrong! You should see progress!!

When DISM is finished you can see that the service; Windows Modules Installer
(aka TrustedInstaller) will shut itself down after a while. Reason? Nothing to
do..

For people that have 24H2: I must conclude that 2 reclaimable packages will be
there to stay forever. (until 25H2) They belong to the base version 26100.1742
and are extremely superseded. Can't be fixed or removed. Did it once (together
with other 1742 packages) inside my VM and it messed up Windows 24H2 really
good!! Only a new reinstall of putting a backup back will fix the damaged
Windows 11 24H2.

The 2 unreclaimable packages are;

- Microsoft-Windows-FodMetadataServicing-Desktop-Metadata-Package~31bf3856ad364e35~amd64~~10.0.26100.1742
- Package_for_RollupFix~31bf3856ad364e35~amd64~~26100.1742.1.10

Both packages has the status; "is a top-level package and is deeply superseded"

They are only visible inside the C:\Windows\Logs\CBS\CBS.log file!! Proof?
Rename the CBS.log file. Start a DISM /AnalyzeComponentStore command and after
completing search the file for that status. Only those 2 will have that status.
Those are the 2 unreclaimable packages.
