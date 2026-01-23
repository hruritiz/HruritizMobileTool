// Copyright © 2025 Hruritiz Team
function launchApp(command) {var oShell = new ActiveXObject("Shell.Application");oShell.ShellExecute(command, "", "", "open", "1");}
function MiFlash() { launchApp("Apps\\MiFlash\\XiaoMiFlash.exe");}
function Odin3() { launchApp("Apps\\Odin3\\Odin3.exe");}
function QFIL() { launchApp("Apps\\QFIL\\QFIL.exe");}
function PlatformTools() { launchApp("Apps\\Platform Tools\\Platform Tools.bat");}
function MiUnlock() { launchApp("Apps\\MiUnlock\\miflash_unlock.exe");}
function SPFlashTool() { launchApp("Apps\\SP Flash Tool\\flash_tool.exe");}
function Scrcpy() { launchApp("Apps\\Scrcpy\\scrcpy.exe");}
function Amlogic() { launchApp("Apps\\Amlogic\\Aml_Burn_Tool.exe");}
function BoardDiag() { launchApp("Apps\\BoardDiag\\BoardDiag3.99c.exe");}
function Set_Custom_Style() { launchApp("Custom.css");}
function Restore() { launchApp("Restore_v1.1.hta");self.close()}
function Settings() { window.location.replace("Settings.html");}
function About() { window.location.replace("About.html");}
function HomePage() { window.location.replace("HomePage.html");}
function Help() {var shell = new ActiveXObject("WScript.Shell");shell.Run('cmd.exe /c start "" "https://help-hruritizmobiletool.netlify.app"', 0, false);}
function Magisk() {var shell = new ActiveXObject("WScript.Shell");shell.Run('cmd.exe /c start "" "https://github.com/topjohnwu/Magisk/releases"', 0, false);}var defaultMode = '1';
function readAppMode() {try {var fso = new ActiveXObject("Scripting.FileSystemObject");var settingsFile = "app_mode.ini";if (fso.FileExists(settingsFile)) {var file = fso.OpenTextFile(settingsFile, 1);var mode = file.ReadLine();file.Close();return mode;}} catch (e) {}return defaultMode;}
function saveAppMode(mode) {try {var fso = new ActiveXObject("Scripting.FileSystemObject");var file = fso.OpenTextFile("app_mode.ini", 2, true); file.WriteLine(mode);file.Close();} catch (e) {}}var appMode = readAppMode();
function setAppMode(mode) {appMode = mode;saveAppMode(mode);}function launchApp(command) {var oShell = new ActiveXObject("Shell.Application");oShell.ShellExecute(command, "", "", "open", "1");if (appMode === '2') {self.close();}}
function getAppMode() {return appMode;}function initializeSettingsPage() {var modeSelect = document.getElementById('appMode');if (modeSelect) {modeSelect.value = getAppMode();}}if (window.location.href.toLowerCase().indexOf('settings.html') > -1) {window.attachEvent('onload', initializeSettingsPage);}