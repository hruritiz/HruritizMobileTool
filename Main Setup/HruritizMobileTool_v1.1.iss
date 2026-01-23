#define MyAppName "HruritizMobileTool"
#define MyAppVersion "1.1"
#define MyAppPublisher "Hruritiz Team"
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
LicenseFile=C:\MobileTool 1.1\licence.txt
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=HruritizMobileTool_v1.1
SetupIconFile=C:\MobileTool 1.1\HruritizMobileTool\Image\icon.ico
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
Source: "C:\MobileTool 1.1\HruritizMobileTool\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\MobileTool 1.1\Components\Libraries\vcredist_x86.exe"; DestDir: {tmp}; Flags: deleteafterinstall

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent
Filename: {tmp}\vcredist_x86.exe; \
    Parameters: "/q vcredist.msi"""; \
    StatusMsg: "Installing Microsoft Visual C++ 2010 x32..."

[Code]
const
  UninstSiteURL = 'https://hruritizmobiletool.netlify.app/uninstall.html';

procedure DeleteAllFiles(const Dir: string);
var
  FindRec: TFindRec;
begin
  if FindFirst(Dir + '\*', FindRec) then
  begin
    try
      repeat
        if (FindRec.Name <> '.') and (FindRec.Name <> '..') then
        begin
          if (FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY) <> 0 then
          begin
            DeleteAllFiles(Dir + '\' + FindRec.Name);
            RemoveDir(Dir + '\' + FindRec.Name);
          end
          else
          begin
            DeleteFile(Dir + '\' + FindRec.Name);
          end;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  ErrorCode: Integer;
begin
  if CurUninstallStep = usUninstall then
  begin
    DeleteAllFiles(ExpandConstant('{app}'));
  end
  else if CurUninstallStep = usDone then
  begin
    ShellExec('', UninstSiteURL, '', '', SW_SHOW, ewNoWait, ErrorCode);
  end;
end;
