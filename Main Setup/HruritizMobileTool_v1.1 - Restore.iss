#define MyAppName "HruritizMobileTool Restore"
#define MyAppVersion "1.1"
#define MyAppPublisher "Hruritiz Team"
#define MyAppURL "https://hruritiz.netlify.app"

[Setup]
AppId={{962EE59D-9BDC-4B85-A55D-75ED92C0787A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\HruritizMobileTool
DisableDirPage=yes
DefaultGroupName=HruritizMobileTool
DisableProgramGroupPage=yes
OutputBaseFilename=Restore_v1.1
SetupIconFile=C:\MobileTool 1.1\HruritizMobileTool\Image\icon.ico
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
Uninstallable=no
SolidCompression=yes
WizardStyle=classic

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\MobileTool 1.1\HruritizMobileTool\*"; DestDir: "{src}"; Flags: ignoreversion recursesubdirs createallsubdirs

