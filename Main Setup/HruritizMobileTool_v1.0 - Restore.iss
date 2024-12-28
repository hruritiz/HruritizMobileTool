#define MyAppName "HruritizMobileTool Restoress"
#define MyAppVersion "1.0"
#define MyAppPublisher "Hruritiz Corporation"
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
OutputBaseFilename=HruritizMobileTool_v1.0
SetupIconFile=C:\Users\ASUS\Desktop\Projects\MobileTool\Restore\Image\icon.ico
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
Uninstallable=no
SolidCompression=yes
WizardStyle=classic

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Restore\*"; DestDir: "{src}"; Flags: ignoreversion recursesubdirs createallsubdirs

