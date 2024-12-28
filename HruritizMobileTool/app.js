// Logic of Launch App and Execute Apps
function launchApp(command) {var oShell = new ActiveXObject("Shell.Application");
oShell.ShellExecute(command, "", "", "open", "1");}
function MiFlash() { launchApp("Apps\\MiFlash\\XiaoMiFlash.exe");}
function Odin3() { launchApp("Apps\\Odin3\\Odin3.exe");}
function QFIL() { launchApp("Apps\\QFIL\\QFIL.exe");}
function PlatformTools() { launchApp("Apps\\Platform Tools\\Platform Tools.bat");}
function MiUnlock() { launchApp("Apps\\MiUnlock\\miflash_unlock.exe");}
function SPFlashTool() { launchApp("Apps\\SP Flash Tool\\flash_tool.exe");}
function Scrcpy() { launchApp("Apps\\Scrcpy\\scrcpy.exe");}
function Amlogic() { launchApp("Apps\\Amlogic\\Aml_Burn_Tool.exe");}
function BoardDiag() { launchApp("Apps\\BoardDiag\\BoardDiag3.99c.exe");}
function SelfClose() { var shell = new ActiveXObject("WScript.Shell");shell.Run("cmd.exe /c SelfClose.exe /S && done_dialog.exe", 0, true);}
function Default() { var shell = new ActiveXObject("WScript.Shell");shell.Run("cmd.exe /c Default.exe /S && done_dialog.exe", 0, true);}
function Set_Custom_Style() { launchApp("Custom.css");}
function Setting() { window.location.replace("Setting.html");}
function About() { window.location.replace("About.html");}
function HomePage() { window.location.replace("HomePage.html");}
function Help() { var shell = new ActiveXObject("WScript.Shell");shell.Run("cmd /c start https://help-hruritizmobiletool.netlify.app/", 0, true);}
function Magisk() { var shell = new ActiveXObject("WScript.Shell");shell.Run("cmd /c start https://github.com/topjohnwu/Magisk/releases/", 0, true);}