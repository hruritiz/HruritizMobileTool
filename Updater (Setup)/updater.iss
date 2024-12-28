#define MyAppName "Update HruritizMobileTool"
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
OutputBaseFilename=HruritizMobileTool_Updater_v1.0
SetupIconFile=1.ico
SolidCompression=yes
Compression=lzma2/ultra64
LZMAUseSeparateProcess=yes
LZMADictionarySize=1048576
LZMANumFastBytes=273
WizardStyle=modern
Uninstallable=no

[Messages]
SetupWindowTitle=HruritizMobileTool Updater
ReadyLabel1=This program will install new update for HruritizMobileTool
ButtonStopDownload=&Cancel
StopDownload=Are you sure?
ReadyLabel2a=
ReadyLabel2b=
WizardInstalling=Updating.
InstallingLabel=Please wait...
WizardReady=Ready for Updating
FinishedHeadingLabel=Successful of Updating
FinishedLabelNoIcons=
FinishedLabel=
ClickFinish=
ErrorDownloadFailed=There are no updates
WizardPreparing=Downloading Files...
PreparingDesc=The program will download files, but for now, relax...
DownloadingLabel=Downloading HruritizMobileTool Update Pack...

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{tmp}\Update.exe"; DestDir: "{src}"; Flags: external  
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Updater (Setup)\Output\clear_update.cmd"; DestDir: "{src}";
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Updater (Setup)\Output\start_update.cmd"; DestDir: "{src}";
Source: "C:\Users\ASUS\Desktop\Projects\MobileTool\Updater (Setup)\Output\clear_final.cmd"; DestDir: "{src}";

[Run]                                                              
    Filename: {src}\start_update.cmd; \
    StatusMsg: "Updating HruritizMobileTool..."
    Filename: {src}\clear_update.cmd; \
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
    DownloadPage.Add('https://update-hruritizmobiletool.netlify.app/1.0-1.1/Update.exe', 'Update.exe', '');
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
