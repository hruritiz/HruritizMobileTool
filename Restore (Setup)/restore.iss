#define MyAppName "Restore HruritizMobileTool"
#define MyAppVersion "1.0"
#define MyAppPublisher "Hruritiz Corporation"
#define MyAppURL "https://hruritiz.netlify.app"

[Setup]
AppId={{AA444E70-5A82-4602-BD16-89F8078C5EDE}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
OutputBaseFilename=HruritizMobileTool_Restore_v1.0
SetupIconFile=1.ico
SolidCompression=yes
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
LZMADictionarySize=1048576
LZMANumFastBytes=273
WizardStyle=modern
Uninstallable=no

[Messages]
SetupWindowTitle=Restore HruritizMobileTool
ReadyLabel1=This program will reinstall HruritizMobileTool Thus eliminating errors
ButtonStopDownload=&Cancel
StopDownload=Are you sure?
ReadyLabel2a=
ReadyLabel2b=
WizardInstalling=Restoring.
InstallingLabel=Please wait...
WizardReady=Ready for Restoring
FinishedHeadingLabel=Successful of Restoring
FinishedLabelNoIcons=
FinishedLabel=
ClickFinish=
ErrorDownloadFailed=You have a very old version of the program or the server is simply not available at the moment
WizardPreparing=Downloading Files...
PreparingDesc=The program will download files, but for now, relax...
DownloadingLabel=Downloading HruritizMobileTool...

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{tmp}\HruritizMobileTool_v1.0.exe"; DestDir: "{src}"; Flags: external  
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Restore (Setup)\Output\ss\clear_setup.bat"; DestDir: "{src}"; 
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Restore (Setup)\Output\ss\start_setup.bat"; DestDir: "{src}";

[Run]                                                              
    Filename: {src}\start_setup.bat; \
    StatusMsg: "Restoring HruritizMobileTool..."
    Filename: {src}\clear_setup.bat; \
    StatusMsg: "Clearing Temporary Files..."

[Code]
var
  DownloadPage: TDownloadWizardPage;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  if Progress = ProgressMax then
    Log(Format('Successfully downloaded file to {tmp}: %s', [FileName]));
  Result := True;
end;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(SetupMessage(msgWizardPreparing), SetupMessage(msgPreparingDesc), @OnDownloadProgress);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
  DownloadPage.Msg2Label.Top := ScaleY(-100);
    DownloadPage.Clear;
    DownloadPage.Add('https://dl.dropboxusercontent.com/scl/fi/hxglm64hrounv93fuxjjp/HruritizMobileTool_v1.0.exe?rlkey=aqihck0i39kwd3ozf5h4kbljt&st=ipce468c', 'HruritizMobileTool_v1.0.exe', '');
    DownloadPage.Show;
    try
      try
        DownloadPage.Download;
        Result := True;
        
        
      except
        if DownloadPage.AbortedByUser then
          Log('Aborted by user.')
        else
          SuppressibleMsgBox(AddPeriod(GetExceptionMessage), mbCriticalError, MB_OK, IDOK);
        Result := False;
      end;
    finally
      DownloadPage.Hide;
    end;
  end else
    Result := True;
end;





