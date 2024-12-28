#define MyAppName "HruritizMobileTool"
#define MyAppVersion "1.0"
#define MyAppPublisher "Hruritiz Corporation"
#define MyAppURL "https://hruritiz.netlify.app"
#define MyAppExeName "HruritizMobileTool"

[Setup]
AppId={{B91425C4-F894-4E10-85DA-473C4663EFD3}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\Users\ASUS\Desktop\Projects\licence.txt
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=HruritizMobileTool_v1.0
SetupIconFile=C:\Users\ASUS\Desktop\Projects\MobileTool\HruritizMobileTool\Image\icon.ico
SolidCompression=yes
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\HruritizMobileTool\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Components\Libraries\vcredist_x86.exe"; DestDir: {tmp}; Flags: deleteafterinstall
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Components\Libraries\VC_redist.x64.exe"; DestDir: {tmp}; Flags: deleteafterinstall

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent
Filename: {tmp}\vcredist_x86.exe; \
    Parameters: "/q vcredist.msi"""; \
    StatusMsg: "Installing Microsoft Visual C++ 2010 x32..."
    Filename: {tmp}\VC_redist.x64; \
    Parameters: "/quiet /norestart"""; \
    StatusMsg: "Installing Microsoft Visual C++ 2015-2022 x64..."

[Code]
const
UninstSiteURL = 'https://hruritizmobiletool.netlify.app/uninstall.html';
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
ErrorCode: Integer;
begin
if CurUninstallStep = usDone then
ShellExec('', UninstSiteURL, '', '', SW_SHOW, ewNoWait, ErrorCode);
end;

