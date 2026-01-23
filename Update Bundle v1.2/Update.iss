#define MyAppName "HruritizMobileTool Update Bundle"
#define MyAppVersion "1.1"
#define MyAppPublisher "Hruritiz Team"
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
Source: "C:\MobileTool 1.1\Update Bundle v1.2\final\*"; DestDir: "{src}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\MobileTool 1.1\Update Bundle v1.2\extras\cleaningcmd.bat"; DestDir: "{src}"; 

[Run]                                                              
    Filename: {src}\cleaningcmd.bat; \
    StatusMsg: "Cleaning..."
