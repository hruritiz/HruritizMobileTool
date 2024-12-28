#define MyAppName "HruritizMobileTool Update Bundle"
#define MyAppVersion "1.0"
#define MyAppPublisher "Hruritiz"
#define MyAppExeName "Update.exe"

[Setup]
AppId={{03E42441-5FEB-447B-9145-BDFF0CAD7FB1}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
CreateAppDir=no
OutputBaseFilename=Update
SetupIconFile=C:\Program Files (x86)\Inno Setup 6\SetupClassicIcon.ico
SolidCompression=yes
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
WizardStyle=classic
Uninstallable=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\ASUS\Desktop\MobileTool\Update Bundle v1.1\Update Final\*"; DestDir: "{src}"; Flags: ignoreversion recursesubdirs createallsubdirs
