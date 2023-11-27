{
  ISFMain main user window

  This is the first page the user sees when accessing this application.
}

unit IWStrat_uMain;

interface

uses
  IniFiles,
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompButton, Forms,
  IWCompRectangle, IWCompLabel, IWDBStdCtrls,
  IWCompText, IWCompExtCtrls,
  IWCompMemo, IWCompCheckbox, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion,
  IWStrat_frTopBar,  IWStrat_framemenu,
  IWHTMLControls, jpeg, Menus, IWHTML40Container, WideStrings,
  FMTBcd, DB, DBClient, Provider, SqlExpr, IWCompGrids, IWDBGrids;

type
  TISFMain = class(TIWAppForm)
    lblWelcome: TIWLabel;
    iwlDeveloperName: TIWLabel;
    iwlDeveloperEmail: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    iwlNumUses: TIWLabel;
    IWRegion1: TIWRegion;
    iwRHeader: TIWRegion;
    iwRFooter: TIWRegion;
    iwRMemo: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    iwbPermissions: TIWButton;
    IWRegion4: TIWRegion;
    iwbCheckIniFile: TIWButton;
    IWButton1: TIWButton;
    iwdbgDevInfo: TIWDBGrid;
    IWButton2: TIWButton;
    iwlProgressDate: TIWLabel;
    IWRegion5: TIWRegion;
    FrameMenu: TISFFrameMenu;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbPermissionsClick(Sender: TObject);
    procedure TopBariwlSignOutClick(Sender: TObject);
    procedure FrameMenuSelectGrainProbabilities1Click(Sender: TObject);
    procedure FrameMenuSelectUnit1Click(Sender: TObject);
    procedure iwbCheckIniFileClick(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
    procedure IWButton2Click(Sender: TObject);
  public
  protected
    procedure LoadWelcomeMessage;
  end;

type
  TISFMainStratClass = class of TISFMain;

implementation
{$R *.dfm}

uses
  System.IOUtils,
  ServerController, IWColor, Graphics,
  IWBaseForm, IWStrat_constants, IWStrat_dmC, usrIW_dm, IWStrat_dm,
  IWStrat_dmDV, usr_constants;



procedure TISFMain.FrameMenuSelectGrainProbabilities1Click(Sender: TObject);
begin
  FrameMenu.SelectGrainProbabilities1Click(Sender);
end;

procedure TISFMain.FrameMenuSelectUnit1Click(Sender: TObject);
begin
  FrameMenu.SelectUnit1Click(Sender);

end;

procedure TISFMain.IWAppFormCreate(Sender: TObject);
var
  progstr : string;
  ShowUsagePermissions : boolean;
begin
  progstr := WebApplication.RunParams.Values[ 'progname' ];
  UserSession.ThisProgram := 'StratDB';
  TopBar.lblProgTitle.Text := 'StratDB Database';
  TopBar.lblWelcome.Text := 'Hello';
  FrameMenu.IWImageIGCP509.Visible := false;
  FrameMenu.IWImageStratDB.Visible := true;
  if (not UserSession.LoggedIn) then
  begin
    FrameMenu.Visible := false;
  end else
  begin
    FrameMenu.Visible := true;
  end;
  if (progstr = 'IGCP509') then
  begin
    UserSession.ThisProgram := 'IGCP509';
    TopBar.lblProgTitle.Text := 'IGCP509 Database';
    FrameMenu.IWImageIGCP509.Visible := true;
    FrameMenu.IWImageStratDB.Visible := false;
  end;
  iwlNumUses.Visible := false;
  //TopBar.iwlDonate.Visible := UserSession.LoggedIn;
  //if (UserSession.LoggedIn) then LoadWelcomeMessage;       //bme
  FrameMenu.MainPage1.Visible := false;
  FrameMenu.New1.Visible := false;
  FrameMenu.NewDeposit1.Enabled := false;
  FrameMenu.SelectGrainProbabilities1.Enabled := false;
  FrameMenu.SelectGrainSources1.Enabled := false;
  FrameMenu.LookupsUserProj1.Enabled := false;
  if UserSession.CanInsert then
  begin
    FrameMenu.New1.Visible := true;
    FrameMenu.New1.Enabled := true;
    FrameMenu.NewUnit1.Enabled := true;
    FrameMenu.NewDomain1.Enabled := true;
    FrameMenu.NewLargeIgneousProvince1.Enabled := true;
    FrameMenu.NewDeposit1.Enabled := false;
  end
  else begin
    FrameMenu.New1.Visible := false;
    FrameMenu.New1.Enabled := false;
    FrameMenu.NewUnit1.Enabled := false;
    FrameMenu.NewDomain1.Enabled := false;
    FrameMenu.NewLargeIgneousProvince1.Enabled := false;
    FrameMenu.NewDeposit1.Enabled := false;
  end;
  if UserSession.CanViewPlus then
  begin
    FrameMenu.SelectGrainProbabilities1.Enabled := true;
    FrameMenu.SelectGrainSources1.Enabled := true;
    FrameMenu.LookupsUserProj1.Enabled := true;
  end else
  begin
    FrameMenu.SelectGrainProbabilities1.Enabled := false;
    FrameMenu.SelectGrainSources1.Enabled := false;
    FrameMenu.LookupsUserProj1.Enabled := false;
  end;
  if UserSession.CanViewPlus then
  begin
    FrameMenu.SelectGraph1.Visible := true;
  end else
  begin
    FrameMenu.SelectGraph1.Visible := false;
  end;
end;

procedure TISFMain.LoadWelcomeMessage;
begin
  if  (UserSession.IsFirstShow) then
  begin
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
    UserSession.ProgressDate := dmUser.cdsProgressPROGRESSDATE.AsString;
    dmUser.cdsProgress.Close;
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    UserSession.ThisProgramName := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    dmUser.cdsThisProgram.Close;
  end;
  //if UserSession.LoggedIn then
  //begin
    TopBar.lblWelcome.Text := 'User is ' + UserSession.UserDisplayName;
    TopBar.lblProgTitle.Text := UserSession.ThisProgramName;
    //TopBar.lblProgTitle.Text := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    iwlProgressDate.Caption := UserSession.ProgressDate;
  //end;
  UserSession.IsFirstShow := false;
end;

procedure TISFMain.TopBariwlSignOutClick(Sender: TObject);
begin
  TopBar.iwlSignOutClick(Sender);
end;

procedure TISFMain.IWAppFormRender(Sender: TObject);
var
  ShowUsagePermissions : boolean;
begin
  FrameMenu.IWMenu1.Visible := UserSession.LoggedIn;
  //FrameMenu.SelectChart1.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //dmUser.SetDeveloperData('StratDB Form Render');
  if (UserSession.LoggedIn) then LoadWelcomeMessage;       //bme
  if (not UserSession.LoggedIn) then
  begin
    FrameMenu.Visible := false;
  end else
  begin
    FrameMenu.Visible := true;
  end;
  iwbPermissions.Visible := true;
  iwbCheckIniFile.Visible := true;
  if ((UserSession.ShowDebugButtons) and (UserSession.IsDeveloper) and (UserSession.LoggedIn)) then
  begin
    iwbPermissions.Visible := true;
    iwbCheckIniFile.Visible := true;
  end else
  begin
    iwbPermissions.Visible := false;
    iwbCheckIniFile.Visible := false;
  end;
  if ((UserSession.IsDeveloper) and (UserSession.LoggedIn)) then
  begin
    //dmUser.qNumTimesUsed.Close;
    //dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    //dmUser.cdsNumTimesUsed.Close;
    //dmUser.cdsNumTimesUsed.Open;
    iwlNumUses.Caption := 'This program has been used '+IntToStr(UserSession.NumUses)+' times';
    iwlNumUses.Visible := true;
    //dmUser.cdsNumTimesUsed.Close;
  end else
  begin
    iwlNumUses.Caption := '';
  end;
end;

procedure TISFMain.iwbPermissionsClick(Sender: TObject);
begin
  if not UserSession.IsDeveloper then WebApplication.ShowMessage('IsDeveloper is FALSE')
                                 else WebApplication.ShowMessage('IsDeveloper is TRUE');
  if not UserSession.CanModify then WebApplication.ShowMessage('CanModify is FALSE')
                                 else WebApplication.ShowMessage('CanModify is TRUE');
  if not UserSession.CanInsert then WebApplication.ShowMessage('CanInsert is FALSE')
                                 else WebApplication.ShowMessage('CanInsert is TRUE');
  if not UserSession.CanDelete then WebApplication.ShowMessage('CanDelete is FALSE')
                                 else WebApplication.ShowMessage('CanDelete is TRUE');
  if not UserSession.CanValidate then WebApplication.ShowMessage('CanValidate is FALSE')
                                 else WebApplication.ShowMessage('CanValidate is TRUE');
  if not UserSession.CanExport then WebApplication.ShowMessage('CanExport is FALSE')
                                 else WebApplication.ShowMessage('CanExport is TRUE');
  if not UserSession.CanViewPlus then WebApplication.ShowMessage('CanViewPlus is FALSE')
                                 else WebApplication.ShowMessage('CanViewPlus is TRUE');
  if not UserSession.CanModifyPlus then WebApplication.ShowMessage('CanModifyPlus is FALSE')
                                 else WebApplication.ShowMessage('CanModifyPlus is TRUE');
end;


procedure TISFMain.IWButton1Click(Sender: TObject);
begin
  dmUser.cdsDevInfo.Close;
  dmUser.cdsDevInfo.Open;
  //dmUser.qTest.ExecSQL(false);
  dmUser.InsertDeveloperData('main page InsertDeveloperData');
  dmUser.SetDeveloperData('main page SetDeveloperData');
end;

procedure TISFMain.IWButton2Click(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmDV.InsertReference(200000,1900,'test here','NAM','PUBL',WasSuccessful);
  if WasSuccessful then dmUser.SetDeveloperData('WasSuccessful')
                   else dmUser.SetDeveloperData('not WasSuccessful');
  dmUser.cdsDevInfo.Close;
  dmUser.cdsDevInfo.Open;
end;

procedure TISFMain.iwbCheckIniFileClick(Sender: TObject);
var
  AppIni   : TIniFile;
  tmpStr   : string;
  iCode    : integer;
  //LStr: array[0 .. MAX_PATH] of Char;
  //zpath: array [0..MAX_PATH] of char;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DriverName,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath,
  LibraryName, VendorLib, GetDriverFunc,
  DBUserName, DBPassword,DBSpecific,DBSQLDialectStr,DBCharSet,
  DataPath   : string;
  PublicPath : string;
begin
  //uses ShlObj
  // this gives access to all the systemed defined folders, no direct dependency on env. variables.
  //SHGetFolderPath(0, CSIDL_COMMON_APPDATA or CSIDL_FLAG_CREATE, 0, SHGFP_TYPE_CURRENT, @zpath); //Common App Data, on Windows 7 this is C:\ProgramData
  //try
  //  SHGetKnownFolderPath(0, FOLDERID_LOCALAPPDATA or CSIDL_FLAG_CREATE, 0, SHGFP_TYPE_CURRENT, @zpath);
  //except
  //  SHGetSpecialFolderPath(0, CSIDL_LOCAL_APPDATA or CSIDL_FLAG_CREATE, 0, SHGFP_TYPE_CURRENT, @zpath);
  //end;
  //eOleCheck (SHGetFolderPath (Handle, CSIDL_MYDOCUMENTS, 0, 0, PChar(szBuffer)));
  //-------------------------------------------  need to fix bme
  //SHGetFolderPath(0, CSIDL_COMMON_APPDATA  or CSIDL_FLAG_CREATE, 0, SHGFP_TYPE_CURRENT, @zpath);
    //SHGetFolderPath(0, CSIDL_COMMON_APPDATA, 0, 0, @LStr)
    //PublicPath := LStr;
  //-------------------------------------------
  //C:\Documents and Settings\Administrator\Local Settings\Application Data
  //CommonFilePath := IncludeTrailingPathDelimiter(string(zpath)) + 'EggSoft\';
  PublicPath := TPath.GetPublicPath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'stratdb.ini';
  WebApplication.ShowMessage(IniFilename);
  AppIni := TIniFile.Create(IniFilename);
  try
    //URLBase := AppIni.ReadString('URLBase','URLBase','/stratdb');
    URLBase := AppIni.ReadString('URLBase','URLBase','/');
    if (URLBase = '/') then URLBase := '';
    WebApplication.ShowMessage('URLBase is ***'+URLBase+'***');
    UserControlPath := AppIni.ReadString('Paths','UserControl path','C:\Data\Firebird\UserControl2015v25.fdb');
    WebApplication.ShowMessage(UserControlPath);
    StratDBPath := AppIni.ReadString('Paths','StratDB path','C:\Data\Firebird\StratDB2012v25.fdb');
    WebApplication.ShowMessage(StratDBPath);
    DateViewPath := AppIni.ReadString('Paths','DateView path','C:\Data\Firebird\DateView2015v25.fdb');
    WebApplication.ShowMessage(DateViewPath);
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartInterBase');
    WebApplication.ShowMessage(DriverName);
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    WebApplication.ShowMessage('LibraryName is ***'+LibraryName+'***');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    WebApplication.ShowMessage('VendorLib is ***'+VendorLib+'***');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    WebApplication.ShowMessage('GetDriverFunc is ***'+GetDriverFunc+'***');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','V0lcano3^');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Inactive');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','Inactive');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;
    FromEmailAddress := AppIni.ReadString('Email','FromEmailAddress','aht820@usask.ca');
    FromName := AppIni.ReadString('Email','FromName','EggSoft developer and database administrator');
    HostName := AppIni.ReadString('Email','HostName','smtp.office365.com');
    HostPort := AppIni.ReadString('Email','HostPort','587');
    EmailUserID := AppIni.ReadString('Email','EmailUserID','aht820@usask.ca');
    EmailPassword := AppIni.ReadString('Email','EmailPassword','nuC7Sy3Af4bu');
    URLonTerminate := AppIni.ReadString('URL','URLonTerminate','http://sil.usask.ca');
    FromEmailAddress := Trim(FromEmailAddress);
    FromName := Trim(FromName);
    HostName := Trim(HostName);
    HostPort := Trim(HostPort);
    EmailUserID := Trim(EmailUserID);
    EmailPassword := Trim(EmailPassword);
    URLonTerminate := Trim(URLonTerminate);
    WebApplication.ShowMessage(FromEmailAddress);
    WebApplication.ShowMessage(FromName);
    WebApplication.ShowMessage(HostName);
    WebApplication.ShowMessage(HostPort);
    WebApplication.ShowMessage(EmailUserID);
    WebApplication.ShowMessage(EmailPassword);
    WebApplication.ShowMessage(URLonTerminate);
    {
    DriverName=DevartInterBase
    DataBase=bromo:f:\data\firebird\usercontrol2011v25.fdb
    RoleName=
    User_Name=SYSDBA
    Password=masterkey
    SQLDialect=3
    BlobSize=-1
    ErrorResourceFile=
    LocaleCode=0000
    DevartInterBase TransIsolation=ReadCommitted
    WaitOnLocks=True
    Charset=ASCII
    CharLength=1
    EnableBCD=True
    OptimizedNumerics=True
    LongStrings=True
    UseQuoteChar=False
    FetchAll=False
    UseUnicode=False
    }
  //define connection parameters for UserControl connection
  {
  dmUser.sqlcWebUser.Connected := false;
  dmUser.sqlcWebUser.Params.Clear;
  dmUser.sqlcWebUser.DriverName := DriverName;
  dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);
  dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
  dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
  dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
  dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
  dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
  dmUser.sqlcWebUser.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmUser.sqlcWebUser.Params.Append('WaitOnLocks=True');
  dmUser.sqlcWebUser.Params.Append('CharLength=1');
  dmUser.sqlcWebUser.Params.Append('EnableBCD=True');
  dmUser.sqlcWebUser.Params.Append('OptimizedNumerics=True');
  dmUser.sqlcWebUser.Params.Append('LongStrings=True');
  dmUser.sqlcWebUser.Params.Append('UseQuoteChar=False');
  dmUser.sqlcWebUser.Params.Append('FetchAll=False');
  dmUser.sqlcWebUser.Params.Append('UseUnicode=False');
  }
  if (UserSession.LoggedIn) then
  begin
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
  end;
    {
  //define connection parameters for StratDB connection
  dmStrat.sqlcStrat.Connected := false;
  dmStrat.sqlcStrat.Params.Clear;
  dmStrat.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStrat.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStrat.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStrat.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStrat.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStrat.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStrat.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStrat.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmStrat.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStrat.sqlcStrat.Params.Append('CharLength=1');
  dmStrat.sqlcStrat.Params.Append('EnableBCD=True');
  dmStrat.sqlcStrat.Params.Append('OptimizedNumerics=True');
  dmStrat.sqlcStrat.Params.Append('LongStrings=True');
  dmStrat.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStrat.sqlcStrat.Params.Append('FetchAll=False');
  dmStrat.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB charts connection
  dmStratC.sqlcStrat.Connected := false;
  dmStratC.sqlcStrat.Params.Clear;
  dmStratC.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStratC.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStratC.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStratC.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStratC.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStratC.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStratC.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStratC.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmStratC.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStratC.sqlcStrat.Params.Append('CharLength=1');
  dmStratC.sqlcStrat.Params.Append('EnableBCD=True');
  dmStratC.sqlcStrat.Params.Append('OptimizedNumerics=True');
  dmStratC.sqlcStrat.Params.Append('LongStrings=True');
  dmStratC.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStratC.sqlcStrat.Params.Append('FetchAll=False');
  dmStratC.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB data connection
  dmStratD.sqlcStrat.Connected := false;
  dmStratD.sqlcStrat.Params.Clear;
  dmStratD.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStratD.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStratD.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStratD.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStratD.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStratD.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStratD.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStratD.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmStratD.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStratD.sqlcStrat.Params.Append('CharLength=1');
  dmStratD.sqlcStrat.Params.Append('EnableBCD=True');
  dmStratD.sqlcStrat.Params.Append('OptimizedNumerics=True');
  dmStratD.sqlcStrat.Params.Append('LongStrings=True');
  dmStratD.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStratD.sqlcStrat.Params.Append('FetchAll=False');
  dmStratD.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for DateView connection
  dmDV.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Params.Clear;
  dmDV.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmDV.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmDV.sqlcDateView.Params.Append('Password='+DBPassword);
  dmDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmDV.sqlcDateView.Params.Append('LocaleCode=0000');
  dmDV.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmDV.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmDV.sqlcDateView.Params.Append('CharLength=1');
  dmDV.sqlcDateView.Params.Append('EnableBCD=True');
  dmDV.sqlcDateView.Params.Append('OptimizedNumerics=True');
  dmDV.sqlcDateView.Params.Append('LongStrings=True');
  dmDV.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmDV.sqlcDateView.Params.Append('FetchAll=False');
  dmDV.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for LIP connection
  dmLIP.sqlcLIP.Connected := false;
  dmLIP.sqlcLIP.Params.Clear;
  dmLIP.sqlcLIP.Params.Append('DriverName='+DriverName);
  dmLIP.sqlcLIP.Params.Append('Database='+StratDBPath);
  dmLIP.sqlcLIP.Params.Append('User_Name='+DBUserName);
  dmLIP.sqlcLIP.Params.Append('Password='+DBPassword);
  dmLIP.sqlcLIP.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmLIP.sqlcLIP.Params.Append('Charset='+DBCharSet);
  dmLIP.sqlcLIP.Params.Append('LocaleCode=0000');
  dmLIP.sqlcLIP.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmLIP.sqlcLIP.Params.Append('WaitOnLocks=True');
  dmLIP.sqlcLIP.Params.Append('CharLength=1');
  dmLIP.sqlcLIP.Params.Append('EnableBCD=True');
  dmLIP.sqlcLIP.Params.Append('OptimizedNumerics=True');
  dmLIP.sqlcLIP.Params.Append('LongStrings=True');
  dmLIP.sqlcLIP.Params.Append('UseQuoteChar=False');
  dmLIP.sqlcLIP.Params.Append('FetchAll=False');
  dmLIP.sqlcLIP.Params.Append('UseUnicode=False');
  //define connection parameters for Options connection
  dmOpt.sqlcStrat.Connected := false;
  dmOpt.sqlcStrat.Params.Clear;
  dmOpt.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmOpt.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmOpt.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmOpt.sqlcStrat.Params.Append('Password='+DBPassword);
  dmOpt.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmOpt.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmOpt.sqlcStrat.Params.Append('LocaleCode=0000');
  dmOpt.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmOpt.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmOpt.sqlcStrat.Params.Append('CharLength=1');
  dmOpt.sqlcStrat.Params.Append('EnableBCD=True');
  dmOpt.sqlcStrat.Params.Append('OptimizedNumerics=True');
  dmOpt.sqlcStrat.Params.Append('LongStrings=True');
  dmOpt.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmOpt.sqlcStrat.Params.Append('FetchAll=False');
  dmOpt.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for Replication connection
  dmReplicate.sqlcStrat.Connected := false;
  dmReplicate.sqlcStrat.Params.Clear;
  dmReplicate.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmReplicate.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmReplicate.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmReplicate.sqlcStrat.Params.Append('Password='+DBPassword);
  dmReplicate.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmReplicate.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmReplicate.sqlcStrat.Params.Append('LocaleCode=0000');
  dmReplicate.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmReplicate.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmReplicate.sqlcStrat.Params.Append('CharLength=1');
  dmReplicate.sqlcStrat.Params.Append('EnableBCD=True');
  dmReplicate.sqlcStrat.Params.Append('OptimizedNumerics=True');
  dmReplicate.sqlcStrat.Params.Append('LongStrings=True');
  dmReplicate.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmReplicate.sqlcStrat.Params.Append('FetchAll=False');
  dmReplicate.sqlcStrat.Params.Append('UseUnicode=False');
  }
  finally
    AppIni.Free;
  end;
end;

initialization
  TISFMain.SetAsMainForm;
end.
