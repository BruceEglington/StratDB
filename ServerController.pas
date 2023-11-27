unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  //UserSessionUnit,
  IWApplication, IWAppForm, IW.Browser.Browser,
  IW.HTTP.Request, IW.HTTP.Reply,
  IWGlobal,
  IniFiles,
  IW.Common.AppInfo,
  midaslib,
  usrIW_dm,
  IWStrat_dmC, IWStrat_dm, IWStrat_dmD, IWStrat_dmDV, IWStrat_dmLIP,
  IWStrat_dmopt, IWStrat_constants;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseGetMainForm(var vMainForm: TIWBaseForm);
    procedure IWServerControllerBaseNewSession(aSession: TIWApplication);

  private
    { Private declarations }
    procedure GetIniFile;

  public
    { Public declarations }
  end;

type
  TExportType = (
    et_Xls,
    et_Xlsx,
    et_Csv,
    et_Pdf,
    et_Html
  );

  // This is a class which you can add variables to that are specific to the user. Add variables
  // to this class instead of creating global variables. This object can references by using:
  //   UserSession
  // So if a variable named UserName of type string is added, it can be referenced by using:
  //   UserSession.UserName
  // Such variables are similar to globals in a normal application, however these variables are
  // specific to each user.
  //
  // See the IntraWeb Manual for more details.
  TUserSession = class(TComponent)
  public
    //UserSessionID : integer;
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    UserID, UserPassword, UserDisplayName : string;

    ThisProgram : string;
    ThisProgramName : string;
    ProgTitle : string;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;
    CanExport : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    ThisLoginTime : TDateTime;
    DoMemCheck : boolean;

    NumRecordsFound : integer;

    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    Parameter2Chosen : string;

    NumRecordsPerPage : integer;
    PageNum, PageNumTotal : integer;

    IncludeContinentValues : boolean;
    ContinentValues : TStringList;
    IncludeAreaValues : boolean;
    AreaValues : TStringList;
    IncludeUnitValues: Boolean;
    UnitValues: TStringList;
    IncludeUnitRankValues: Boolean;
    UnitRankValues: TStringList;
    IncludeReferenceValues: Boolean;
    ReferenceValues: TStringList;
    IncludeValidationValues: Boolean;
    ValidationValues: TStringList;
    IncludeDateFromValue: Boolean;
    DateFromField: string;
    IncludeDateToValue: Boolean;
    DateToField: string;
    OrderByValue: string;
    LinkToDateView : Boolean;
    ReferenceStartFrom: string;
    ReferenceEndWith: string;
    UnitStartFrom, UnitEndWith : string;
    IncludeSeams : Boolean;
    IncludeAllParentIDs : boolean;
    IncludeSortFromValue: Boolean;
    SortFromField: string;
    IncludeSortToValue: Boolean;
    SortToField: string;
    IncludeDomainValues : boolean;
    DomainValues : TStringList;
    IncludeDomainTypeValues : boolean;
    DomainTypeValues : TStringList;
    IncludeDomainValidationValues : boolean;
    DomainValidationValues : TStringList;
    IncludeOrogenyValues : boolean;
    OrogenyValues : TStringList;
    IncludePeriodValues: Boolean;
    PeriodValues: TStringList;
    IncludeLIPValues: Boolean;
    LIPValues: TStringList;
    IncludeSizeValues: Boolean;
    SizeValues: TStringList;
    IncludeRatingValues: Boolean;
    RatingValues: TStringList;
    IncludeMorphologyValues: Boolean;
    MorphologyValues: TStringList;
    IncludeContOceanValues: Boolean;
    ContOceanValues: TStringList;
    IncludeUsersWhoForValues : Boolean;
    UsersWhoForValues : TStringList;
    IncludeDepositValues : boolean;
    DepositValues : TStringList;
    IncludeClanValues : boolean;
    ClanValues : TStringList;
    IncludeCommodityValues : boolean;
    CommodityValues : TStringList;
    IncludeAgeConstraintValues : boolean;
    AgeConstraintValues : TStringList;
    IncludeInc4ChtValues : boolean;
    Inc4ChtValues : TStringList;
    IncludeDepositStatusValues : boolean;
    DepositStatusValues : TStringList;
    IncludeSampleZoneValues : boolean;
    SampleZoneValues : TStringList;
    UserProjectValues : TStringList;


    NewContinentID, NewAreaID,
    NewUnit,
    NewReferenceID : string;
    ChartValue : string;

    GraphType : string;
    FromAge, ToAge : double;
    MinimumDateUncertainty: string;
    NormalisationType: string;
    PDFType : string;
    AxisChoiceX, AxisChoiceY : string;
    DataHaveChanged : boolean;
    PDFHasChanged : boolean;
    NumberOfPoints    :  integer;
    StartAtX, EndAtX,
    StartAtY, EndAtY,
    StartAtZ, EndAtZ  : double;
    LongitudeMin, LongitudeMax,
    LatitudeMin, LatitudeMax : double;
    TMultiplier : double;

    NumUses : integer;
    IsFirstShow : boolean;
    ProgressDate : string;

    MapFileName : string;
    MapDBFName : string;
    MapFieldName : string;
    MapValueFieldName : string;
    UseDBF : boolean;
    HORZSIZE, VERTSIZE : integer;
    ShowDebugButtons : boolean;
    DelayConnections : boolean;

    WhereAmI :  string;  // string used to identify where one is in program process
    LC : integer;    // counter to identify unneeded iterations through data when graphing
    dmUser : TdmUser;
    dmStrat : TdmStrat;
    dmOpt : TdmOpt;
    dmDV  : TdmDV;
    dmStratC : TdmStratC;
    dmStratD : TdmStratD;
    dmLIP : TdmLIP;
    //dmReplicate : TdmReplicate;

    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetCookies;
    procedure GetCookies;
    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    //procedure GetStringValues(AString: String; AKey: String; AValueList: TStringList);
  end;

// Procs
  function UserSession: TUserSession;
  //function UserSession: TIWUserSession;
  function IWServerController: TIWServerController;

implementation
{$R *.dfm}

uses
  //IWInit, usr_uLogin, usr_uregister, XMLDoc, XMLIntf, IWStrat_umain,
  //usr_uDBInterface, usr_uDonate, IWStrat_constvalues, NumRecipes_varb;
  System.IOUtils,
  IWInit,
  usr_uLogin, usr_uregister, XMLDoc, XMLIntf, IWStrat_umain,
  usr_uDBInterface, usr_uDonate, IWStrat_constvalues, NumRecipes_varb,
  usr_constants;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

procedure TIWServerController.IWServerControllerBaseGetMainForm(
  var vMainForm: TIWBaseForm);
begin
  vMainForm := TISFMain.Create(WebApplication);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  aSession: TIWApplication);
begin
  ASession.Data := TUserSession.Create(nil);  //note this is a TUserSession
                                              //NOT to be confused with TIWUserSession
  GetIniFile;
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
  iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  LibraryName, VendorLib, GetDriverFunc,
  IniFileName,
  IniFileNameAppInfo,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath,
  DBUserName, DBPassword,DBSpecific,DBSQLDialectStr,DBCharSet,
  EnableBCD,
  DataPath   : string;
  PublicPath : string;
begin
  URLBase := '/';
  DBMonitor := 'active';
  UserSession.ShowDebugButtons := false;
  UserSession.DelayConnections := false;
  UserControlPath := 'bromo2.usask.ca:s:\Data\Firebird\UserControl2021v30.fdb';
  StratDBPath := 'bromo2.usask.ca:s:\Data\Firebird\StratDB2021v30.fdb';
  DateViewPath := 'bromo2.usask.ca:s:\Data\Firebird\DateView2021v30.fdb';
  DriverName := 'DevartFirebird';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';
  PublicPath := TPath.GetPublicPath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'stratdb.ini';
  IniFileNameAppInfo := ChangeFileExt(TIWAppInfo.GetAppFullFileName, '.ini');
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/stratdb');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','C:\Data\Firebird\UserControl2021v30.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','C:\Data\Firebird\StratDB2021v30.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','C:\Data\Firebird\DateView2021v30.fdb');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','V0lcano3^');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Inactive');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    EnableBCD := AppIni.ReadString('Parameters','EnableBCD','false');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;
    {
    FromEmailAddress : string = 'bre255@usask.ca';
    FromName :string = 'EggSoft developer and database administrator';
    HostName :string = 'smtp.office365.com';
    EmailUserID :string = 'bre255@usask.ca';
    EmailPassword :string = 'Zbxc456~';
    URLonTerminate : string = Http://sil.usask.ca';
  }
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

    {
    DriverName=DevartInterBase
    DataBase=bromo:f:/data/firebird/usercontrol2011v25.fdb
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
  dmUser.sqlcWebUser.Connected := false;
  dmUser.sqlcWebUser.Params.Clear;
  //dmUser.sqlcWebUser.LibraryName := LibraryName;
  //dmUser.sqlcWebUser.VendorLib := VendorLib;
  //dmUser.sqlcWebUser.GetDriverFunc := GetDriverFunc;
  //dmUser.sqlcWebUser.DriverName := DriverName;
  dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);
  dmUser.sqlcWebUser.Params.Append('LibraryName='+LibraryName);
  dmUser.sqlcWebUser.Params.Append('VendorLib='+VendorLib);
  dmUser.sqlcWebUser.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
  dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
  dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
  dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
  dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
  dmUser.sqlcWebUser.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmUser.sqlcWebUser.Params.Append('WaitOnLocks=True');
  dmUser.sqlcWebUser.Params.Append('CharLength=1');
  dmUser.sqlcWebUser.Params.Append('EnableBCD=false'); //previously always true
  dmUser.sqlcWebUser.Params.Append('OptimizedNumerics=False');
  dmUser.sqlcWebUser.Params.Append('LongStrings=True');
  dmUser.sqlcWebUser.Params.Append('UseQuoteChar=False');
  dmUser.sqlcWebUser.Params.Append('FetchAll=False');
  dmUser.sqlcWebUser.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB connection
  dmStrat.sqlcStrat.Connected := false;
  dmStrat.sqlcStrat.Params.Clear;
  //dmStrat.sqlcStrat.LibraryName := LibraryName;
  //dmStrat.sqlcStrat.VendorLib := VendorLib;
  //dmStrat.sqlcStrat.GetDriverFunc := GetDriverFunc;
  dmStrat.sqlcStrat.Params.Append('LibraryName='+LibraryName);
  dmStrat.sqlcStrat.Params.Append('VendorLib='+VendorLib);
  dmStrat.sqlcStrat.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmStrat.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStrat.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStrat.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStrat.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStrat.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStrat.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStrat.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStrat.sqlcStrat.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmStrat.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStrat.sqlcStrat.Params.Append('CharLength=1');
  dmStrat.sqlcStrat.Params.Append('EnableBCD=false');
  dmStrat.sqlcStrat.Params.Append('OptimizedNumerics=False');
  dmStrat.sqlcStrat.Params.Append('LongStrings=True');
  dmStrat.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStrat.sqlcStrat.Params.Append('FetchAll=False');
  dmStrat.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB charts connection
  dmStratC.sqlcStrat.Connected := false;
  dmStratC.sqlcStrat.Params.Clear;
  //dmStratC.sqlcStrat.LibraryName := LibraryName;
  //dmStratC.sqlcStrat.VendorLib := VendorLib;
  //dmStratC.sqlcStrat.GetDriverFunc := GetDriverFunc;
  dmStratC.sqlcStrat.Params.Append('LibraryName='+LibraryName);
  dmStratC.sqlcStrat.Params.Append('VendorLib='+VendorLib);
  dmStratC.sqlcStrat.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmStratC.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStratC.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStratC.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStratC.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStratC.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStratC.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStratC.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStratC.sqlcStrat.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmStratC.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStratC.sqlcStrat.Params.Append('CharLength=1');
  dmStratC.sqlcStrat.Params.Append('EnableBCD=false');
  dmStratC.sqlcStrat.Params.Append('OptimizedNumerics=False');
  dmStratC.sqlcStrat.Params.Append('LongStrings=True');
  dmStratC.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStratC.sqlcStrat.Params.Append('FetchAll=False');
  dmStratC.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB data connection
  dmStratD.sqlcStrat.Connected := false;
  dmStratD.sqlcStrat.Params.Clear;
  //dmStratD.sqlcStrat.LibraryName := LibraryName;
  //dmStratD.sqlcStrat.VendorLib := VendorLib;
  //dmStratD.sqlcStrat.GetDriverFunc := GetDriverFunc;
  dmStratD.sqlcStrat.Params.Append('LibraryName='+LibraryName);
  dmStratD.sqlcStrat.Params.Append('VendorLib='+VendorLib);
  dmStratD.sqlcStrat.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmStratD.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStratD.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStratD.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStratD.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStratD.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStratD.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStratD.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStratD.sqlcStrat.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmStratD.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStratD.sqlcStrat.Params.Append('CharLength=1');
  dmStratD.sqlcStrat.Params.Append('EnableBCD=false');
  dmStratD.sqlcStrat.Params.Append('OptimizedNumerics=False');
  dmStratD.sqlcStrat.Params.Append('LongStrings=True');
  dmStratD.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStratD.sqlcStrat.Params.Append('FetchAll=False');
  dmStratD.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for DateView connection
  dmDV.sqlcDateView.Connected := false;
  dmDV.sqlcDateView.Params.Clear;
  //dmDV.sqlcDateView.LibraryName := LibraryName;
  //dmDV.sqlcDateView.VendorLib := VendorLib;
  //dmDV.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmDV.sqlcDateView.Params.Append('LibraryName='+LibraryName);
  dmDV.sqlcDateView.Params.Append('VendorLib='+VendorLib);
  dmDV.sqlcDateView.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmDV.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmDV.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmDV.sqlcDateView.Params.Append('Password='+DBPassword);
  dmDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmDV.sqlcDateView.Params.Append('LocaleCode=0000');
  dmDV.sqlcDateView.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmDV.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmDV.sqlcDateView.Params.Append('CharLength=1');
  dmDV.sqlcDateView.Params.Append('EnableBCD=false');
  dmDV.sqlcDateView.Params.Append('OptimizedNumerics=False');
  dmDV.sqlcDateView.Params.Append('LongStrings=True');
  dmDV.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmDV.sqlcDateView.Params.Append('FetchAll=False');
  dmDV.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for LIP connection
  dmLIP.sqlcLIP.Connected := false;
  dmLIP.sqlcLIP.Params.Clear;
  //dmLIP.sqlcLIP.LibraryName := LibraryName;
  //dmLIP.sqlcLIP.VendorLib := VendorLib;
  //dmLIP.sqlcLIP.GetDriverFunc := GetDriverFunc;
  dmLIP.sqlcLIP.Params.Append('LibraryName='+LibraryName);
  dmLIP.sqlcLIP.Params.Append('VendorLib='+VendorLib);
  dmLIP.sqlcLIP.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmLIP.sqlcLIP.Params.Append('DriverName='+DriverName);
  dmLIP.sqlcLIP.Params.Append('Database='+StratDBPath);
  dmLIP.sqlcLIP.Params.Append('User_Name='+DBUserName);
  dmLIP.sqlcLIP.Params.Append('Password='+DBPassword);
  dmLIP.sqlcLIP.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmLIP.sqlcLIP.Params.Append('Charset='+DBCharSet);
  dmLIP.sqlcLIP.Params.Append('LocaleCode=0000');
  dmLIP.sqlcLIP.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmLIP.sqlcLIP.Params.Append('WaitOnLocks=True');
  dmLIP.sqlcLIP.Params.Append('CharLength=1');
  dmLIP.sqlcLIP.Params.Append('EnableBCD=false');
  dmLIP.sqlcLIP.Params.Append('OptimizedNumerics=False');
  dmLIP.sqlcLIP.Params.Append('LongStrings=True');
  dmLIP.sqlcLIP.Params.Append('UseQuoteChar=False');
  dmLIP.sqlcLIP.Params.Append('FetchAll=False');
  dmLIP.sqlcLIP.Params.Append('UseUnicode=False');
  //define connection parameters for Options connection
  dmOpt.sqlcStrat.Connected := false;
  dmOpt.sqlcStrat.Params.Clear;
  //dmOpt.sqlcStrat.LibraryName := LibraryName;
  //dmOpt.sqlcStrat.VendorLib := VendorLib;
  //dmOpt.sqlcStrat.GetDriverFunc := GetDriverFunc;
  dmOpt.sqlcStrat.Params.Append('LibraryName='+LibraryName);
  dmOpt.sqlcStrat.Params.Append('VendorLib='+VendorLib);
  dmOpt.sqlcStrat.Params.Append('GetDriverFunc='+GetDriverFunc);
  dmOpt.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmOpt.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmOpt.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmOpt.sqlcStrat.Params.Append('Password='+DBPassword);
  dmOpt.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmOpt.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmOpt.sqlcStrat.Params.Append('LocaleCode=0000');
  dmOpt.sqlcStrat.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmOpt.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmOpt.sqlcStrat.Params.Append('CharLength=1');
  dmOpt.sqlcStrat.Params.Append('EnableBCD=false');
  dmOpt.sqlcStrat.Params.Append('OptimizedNumerics=False');
  dmOpt.sqlcStrat.Params.Append('LongStrings=True');
  dmOpt.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmOpt.sqlcStrat.Params.Append('FetchAll=False');
  dmOpt.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for Replication connection
  {
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
  if (DBMonitor = 'Active') then
  begin
    dmUser.SQLMonitor1.Active := true;
    dmStrat.SQLMonitor1.Active := true;
    dmStratC.SQLMonitor1.Active := true;
    dmStratD.SQLMonitor1.Active := true;
    dmDV.SQLMonitor1.Active := true;
    dmLIP.SQLMonitor1.Active := true;
    dmOpt.SQLMonitor1.Active := true;
    //dmReplicate.SQLMonitor1.Active := true;
  end else
  begin
    dmUser.SQLMonitor1.Active := false;
    dmStrat.SQLMonitor1.Active := false;
    dmStratC.SQLMonitor1.Active := false;
    dmStratD.SQLMonitor1.Active := false;
    dmDV.SQLMonitor1.Active := false;
    dmLIP.SQLMonitor1.Active := false;
    dmOpt.SQLMonitor1.Active := false;
    //dmReplicate.SQLMonitor1.Active := false;
  end;
  finally
    AppIni.Free;
  end;
end;


constructor TUserSession.Create(AOwner: TComponent);
begin
//next 2 line belong in BaseNewSession
  //aSession.Data := TUserSession.Create(nil,aSession);
  //GetIniFile;
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  //UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmStrat := TdmStrat.Create(Self);
  dmDV := TdmDV.Create(Self);
  dmOpt := TdmOpt.Create(Self);
  dmStratC := TdmStratC.Create(Self);
  dmLIP := TdmLIP.Create(Self);
  dmStratD := TdmStratD.Create(Self);
  //dmReplicate := TdmReplicate.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmOpt.sqlcStrat.Connected := false;
  dmLIP.sqlcLIP.Connected := false;
  dmStratC.sqlcStrat.Connected := false;
  dmStratD.sqlcStrat.Connected := false;
  //dmReplicate.sqlcStrat.Connected := false;
  //dmReplicate.sqlcLIP.Connected := false;

  ContinentValues := TStringList.Create;
  AreaValues := TStringList.Create;
  UnitValues := TStringList.Create;
  UnitRankValues := TStringList.Create;
  ReferenceValues := TStringList.Create;
  ValidationValues := TStringList.Create;
  DomainValues := TStringList.Create;
  DomainTypeValues := TStringList.Create;
  DomainValidationValues := TStringList.Create;
  OrogenyValues := TStringList.Create;
  PeriodValues := TStringList.Create;
  LIPValues := TStringList.Create;
  SizeValues := TStringList.Create;
  RatingValues := TStringList.Create;
  MorphologyValues := TStringList.Create;
  ContOceanValues := TStringList.Create;
  UsersWhoForValues := TStringList.Create;
  DepositValues := TStringList.Create;
  ClanValues := TStringList.Create;
  CommodityValues := TStringList.Create;
  AgeConstraintValues := TStringList.Create;
  Inc4ChtValues := TStringList.Create;
  DepositStatusValues := TStringList.Create;
  SampleZoneValues := TStringList.Create;
  UserProjectValues := TStringList.Create;
end;

destructor TUserSession.Destroy;
begin
  FreeAndNil(ContinentValues);
  FreeAndNil(AreaValues);
  FreeAndNil(UnitValues);
  FreeAndNil(UnitRankValues);
  FreeAndNil(ReferenceValues);
  FreeAndNil(ValidationValues);
  FreeAndNil(DomainValues);
  FreeAndNil(DomainTypeValues);
  FreeAndNil(DomainValidationValues);
  FreeAndNil(OrogenyValues);
  FreeAndNil(PeriodValues);
  FreeAndNil(LIPValues);
  FreeAndNil(SizeValues);
  FreeAndNil(RatingValues);
  FreeAndNil(MorphologyValues);
  FreeAndNil(ContOceanValues);
  FreeAndNil(UsersWhoForValues);
  FreeAndNil(DepositValues);
  FreeAndNil(ClanValues);
  FreeAndNil(CommodityValues);
  FreeAndNil(AgeConstraintValues);
  FreeAndNil(Inc4ChtValues);
  FreeAndNil(DepositStatusValues);
  FreeAndNil(SampleZoneValues);
  FreeAndNil(UserProjectValues);
  //dmReplicate.sqlcStrat.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmOpt.sqlcStrat.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmStratC.sqlcStrat.Connected := false;
  dmLIP.sqlcLIP.Connected := false;
  dmStratD.sqlcStrat.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  inherited Destroy;
end;

procedure TUserSession.AfterLogin;
begin
  //UserSession.DoMemCheck := false;  //bme
  //if UserSession.DoMemCheck then MemChk;
  UserSession.IsFirstShow := true;
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.ThisProgram := 'StratDB';
  UserSession.ThisProgramName := 'StratDB';
  IncrementNumUses(UserSession.ThisProgram);    //bme
  UserSession.NumRecordsPerPage := 50;
  LoggedIn := TRUE;
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := false;        //bme  - should be false here
  UserSession.CanValidate := false;
  UserSession.CanExport := false;
  UserSession.CanViewPlus := false;
  UserSession.CanModifyPlus := false;
  //dmUser.SetDeveloperData(UserSession.ThisProgram+'  '+UserSession.WhereAmI);
  //dmUser.SetDeveloperData('before IncrementNumUses');
  CheckRights(UserSession.ThisProgram,UserSession.UserID,UserSession.UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  //dmUser.SetDeveloperData('after CheckRights');
  //dmUser.SetDeveloperData('UserSession.UserID = '+UserSession.UserID);
  //try
  //  dmStrat.cdsUsers.Close;
  //except
  //end;
  dmStrat.qUsers.Close;
  dmStrat.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsUsers.Close;
  //dmUser.SetDeveloperData('before cdsUsers.Open 1');
  dmStrat.cdsUsers.Open;
  //dmUser.SetDeveloperData('after cdsUsers.Open 1  RecordCount = '+IntToStr(dmStrat.cdsUsers.RecordCount));
  if (dmStrat.cdsUsers.RecordCount < 1) then
  begin
    try
      dmStrat.cdsUsers.Append;
      dmStrat.cdsUsersUSERID.AsString := UserSession.UserID;
      dmStrat.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsUsers.Post;
      dmStrat.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
        WebApplication.ShowMessage('Problem with User account');
      end;
    end;
    //dmStrat.cdsUsers.Close;
  end;
  if (dmStrat.cdsUsers.RecordCount > 0) then
  begin
    try
      //dmStrat.cdsUsers.First;
      dmStrat.cdsUsers.Edit;
      dmStrat.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsUsers.Post;
      dmStrat.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
      end;
    end;
  end;
  dmStrat.cdsUsers.Close;

  dmStrat.qUsersWhoFor.Close;
  dmStrat.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsUsersWhoFor.Close;
  dmStrat.cdsUsersWhoFor.Open;
  if (dmStrat.cdsUsersWhoFor.RecordCount < 1) then
  begin
    try
      //dmStrat.cdsUsersWhoFor.Close;
      //dmStrat.cdsUsersWhoFor.Open;
      dmStrat.cdsUsersWhoFor.Append;
      dmStrat.cdsUsersWhoForUSERID.AsString := UserSession.UserID;
      dmStrat.cdsUsersWhoForWHOFORID.AsString := ValueForPublished;
      dmStrat.cdsUsersWhoFor.Post;
      dmStrat.cdsUsersWhoFor.ApplyUpdates(0);
    except
      on E: Exception do
      begin
        WebApplication.ShowMessage('Not able to add UserWhoFor');
      end;
    end;
    dmStrat.cdsUsersWhoFor.Close;
  end;

  UserSession.DataHaveChanged := true;
  dmOpt.GetUserOptions;

  UserSession.MapFileName := DefaultMapfolder+DefaultMapFileName;
  UserSession.MapDBFName := DefaultMapfolder+DefaultMapDBFName;
  UserSession.MapFieldName := 'WB_CNTRY';
  UserSession.MapValueFieldName := 'CONTINENT';
  UserSession.UseDBF := false;
  UserSession.HORZSIZE := 1024; // horizontal screen size in pixels
  UserSession.VERTSIZE := 768;  // vertical screen size in pixels

  UserSession.NewContinentID := 'UND';
  UserSession.NewAreaID := 'UND';
  UserSession.NewUnit := 'UNDEFINED';
  UserSession.NewReferenceID := 'not defined';

  UserSession.ReferenceStartFrom := 'A';
  UserSession.ReferenceEndWith := 'zz';
  UserSession.UnitStartFrom := 'A';
  UserSession.UnitEndWith := 'zz';

  UserSession.Parameter2Chosen := 'SmNd';
  UserSession.OrderByValue := '0';

  UserSession.UsersWhoForValues.Clear;
  UserSession.UsersWhoForValues.Add('PUBL');

  UserSession.GetCookies;

  if ((UserSession.IsDeveloper) and (UserSession.LoggedIn)) then
  begin
    dmUser.qNumTimesUsed.Close;
    dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsNumTimesUsed.Close;
    dmUser.cdsNumTimesUsed.Open;
    UserSession.NumUses := dmUser.cdsNumTimesUsedNUMTIMESUSED.AsInteger;
    dmUser.cdsNumTimesUsed.Close;
  end else
  begin
    UserSession.NumUses := -1;
  end;
  UserSession.IsFirstShow := true;

  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;

procedure TUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  //dmUser.SetDeveloperData('StratDB - NeedLogin');
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TUserSession.SetCookies;
var
  tmpString : string;
  //tmpANSIstring : ANSIstring;
  i : integer;
  AStringList : TStringList;
  tNow : TDateTime;
begin
  AStringList := TStringList.Create;
  try
    AStringList.Clear;
    if UserSession.IncludeContinentValues then
    begin
      AStringList.Add('IncludeContinentValues='+IntToStr(UserSession.ContinentValues.Count));
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        AStringList.Add('ContinentValues='+UserSession.ContinentValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeAreaValues then
    begin
      AStringList.Add('IncludeAreaValues='+IntToStr(UserSession.AreaValues.Count));
      for i := 1 to UserSession.AreaValues.Count do
      begin
        AStringList.Add('AreaValues='+UserSession.AreaValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeUnitValues then
    begin
      AStringList.Add('IncludeUnitValues='+IntToStr(UserSession.UnitValues.Count));
      for i := 1 to UserSession.UnitValues.Count do
      begin
        AStringList.Add('UnitValues='+UserSession.UnitValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeUnitRankValues then
    begin
      AStringList.Add('IncludeUnitRankValues='+IntToStr(UserSession.UnitRankValues.Count));
      for i := 1 to UserSession.UnitRankValues.Count do
      begin
        AStringList.Add('UnitRankValues='+UserSession.UnitRankValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeReferenceValues then
    begin
      AStringList.Add('IncludeReferenceValues='+IntToStr(UserSession.ReferenceValues.Count));
      for i := 1 to UserSession.ReferenceValues.Count do
      begin
        AStringList.Add('ReferenceValues='+UserSession.ReferenceValues.Strings[i-1]);
      end;
    end;
    AStringList.Add('ReferenceStartFrom='+UserSession.ReferenceStartFrom);
    AStringList.Add('ReferenceEndWith='+UserSession.ReferenceEndWith);
    if UserSession.IncludeValidationValues then
    begin
      AStringList.Add('IncludeValidationValues='+IntToStr(UserSession.ValidationValues.Count));
      for i := 1 to UserSession.ValidationValues.Count do
      begin
        AStringList.Add('ValidationValues='+UserSession.ValidationValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDateFromValue then
    begin
      AStringList.Add('IncludeDateFromValue='+IntToStr(1));
      AStringList.Add('DateFromField='+UserSession.DateFromField);
    end;
    if UserSession.IncludeDateToValue then
    begin
      AStringList.Add('IncludeDateToValue='+IntToStr(1));
      AStringList.Add('DateToField='+UserSession.DateToField);
    end;
    if UserSession.IncludeAllParentIDs then
    begin
      AStringList.Add('IncludeAllParentIDs='+IntToStr(1));
    end else
    begin
      AStringList.Add('IncludeAllParentIDs='+IntToStr(0));
    end;
    AStringList.Add('OrderByValue='+UserSession.OrderByValue);
    if UserSession.CanInsert then
    begin
      AStringList.Add('NewContinentID='+UserSession.NewContinentID);
      AStringList.Add('NewAreaID='+UserSession.NewAreaID);
      AStringList.Add('NewUnit='+UserSession.NewUnit);
      AStringList.Add('NewReferenceID='+UserSession.NewReferenceID);
    end;
    if UserSession.IncludeSortFromValue then
    begin
      AStringList.Add('IncludeSortFromValue='+IntToStr(1));
      AStringList.Add('SortFromField='+UserSession.SortFromField);
    end;
    if UserSession.IncludeSortToValue then
    begin
      AStringList.Add('IncludeSortToValue='+IntToStr(1));
      AStringList.Add('SortToField='+UserSession.SortToField);
    end;
    if UserSession.IncludeDomainValues then
    begin
      AStringList.Add('IncludeDomainValues='+IntToStr(UserSession.DomainValues.Count));
      for i := 1 to UserSession.DomainValues.Count do
      begin
        AStringList.Add('DomainValues='+UserSession.DomainValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDomainTypeValues then
    begin
      AStringList.Add('IncludeDomainTypeValues='+IntToStr(UserSession.DomainTypeValues.Count));
      for i := 1 to UserSession.DomainTypeValues.Count do
      begin
        AStringList.Add('DomainTypeValues='+UserSession.DomainTypeValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDomainValidationValues then
    begin
      AStringList.Add('IncludeDomainValidationValues='+IntToStr(UserSession.DomainValidationValues.Count));
      for i := 1 to UserSession.DomainValidationValues.Count do
      begin
        AStringList.Add('DomainValidationValues='+UserSession.DomainValidationValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeOrogenyValues then
    begin
      AStringList.Add('IncludeOrogenyValues='+IntToStr(UserSession.OrogenyValues.Count));
      for i := 1 to UserSession.OrogenyValues.Count do
      begin
        AStringList.Add('OrogenyValues='+UserSession.OrogenyValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludePeriodValues then
    begin
      AStringList.Add('IncludePeriodValues='+IntToStr(UserSession.PeriodValues.Count));
      for i := 1 to UserSession.PeriodValues.Count do
      begin
        AStringList.Add('PeriodValues='+UserSession.PeriodValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeLIPValues then
    begin
      AStringList.Add('IncludeLIPValues='+IntToStr(UserSession.LIPValues.Count));
      for i := 1 to UserSession.LIPValues.Count do
      begin
        AStringList.Add('LIPValues='+UserSession.LIPValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeSizeValues then
    begin
      AStringList.Add('IncludeSizeValues='+IntToStr(UserSession.SizeValues.Count));
      for i := 1 to UserSession.SizeValues.Count do
      begin
        AStringList.Add('SizeValues='+UserSession.SizeValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeRatingValues then
    begin
      AStringList.Add('IncludeRatingValues='+IntToStr(UserSession.RatingValues.Count));
      for i := 1 to UserSession.RatingValues.Count do
      begin
        AStringList.Add('RatingValues='+UserSession.RatingValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeMorphologyValues then
    begin
      AStringList.Add('IncludeMorphologyValues='+IntToStr(UserSession.MorphologyValues.Count));
      for i := 1 to UserSession.MorphologyValues.Count do
      begin
        AStringList.Add('MorphologyValues='+UserSession.MorphologyValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeContOceanValues then
    begin
      AStringList.Add('IncludeContOceanValues='+IntToStr(UserSession.ContOceanValues.Count));
      for i := 1 to UserSession.ContOceanValues.Count do
      begin
        AStringList.Add('ContOceanValues='+UserSession.ContOceanValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeUsersWhoForValues then
    begin
      AStringList.Add('IncludeUsersWhoForValues='+IntToStr(UserSession.UsersWhoForValues.Count));
      for i := 1 to UserSession.UsersWhoForValues.Count do
      begin
        AStringList.Add('UsersWhoForValues='+UserSession.UsersWhoForValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDepositValues then
    begin
      AStringList.Add('IncludeDepositValues='+IntToStr(UserSession.DepositValues.Count));
      for i := 1 to UserSession.DepositValues.Count do
      begin
        AStringList.Add('DepositValues='+UserSession.DepositValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeClanValues then
    begin
      AStringList.Add('IncludeClanValues='+IntToStr(UserSession.ClanValues.Count));
      for i := 1 to UserSession.ClanValues.Count do
      begin
        AStringList.Add('ClanValues='+UserSession.ClanValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeCommodityValues then
    begin
      AStringList.Add('IncludeCommodityValues='+IntToStr(UserSession.CommodityValues.Count));
      for i := 1 to UserSession.CommodityValues.Count do
      begin
        AStringList.Add('CommodityValues='+UserSession.CommodityValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeAgeConstraintValues then
    begin
      AStringList.Add('IncludeAgeConstraintValues='+IntToStr(UserSession.AgeConstraintValues.Count));
      for i := 1 to UserSession.AgeConstraintValues.Count do
      begin
        AStringList.Add('AgeConstraintValues='+UserSession.AgeConstraintValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeInc4ChtValues then
    begin
      AStringList.Add('IncludeInc4ChtValues='+IntToStr(UserSession.Inc4ChtValues.Count));
      for i := 1 to UserSession.Inc4ChtValues.Count do
      begin
        AStringList.Add('Inc4ChtValues='+UserSession.Inc4ChtValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDepositStatusValues then
    begin
      AStringList.Add('IncludeDepositStatusValues='+IntToStr(UserSession.DepositStatusValues.Count));
      for i := 1 to UserSession.DepositStatusValues.Count do
      begin
        AStringList.Add('DepositStatusValues='+UserSession.DepositStatusValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeSampleZoneValues then
    begin
      AStringList.Add('IncludeSampleZoneValues='+IntToStr(UserSession.SampleZoneValues.Count));
      for i := 1 to UserSession.SampleZoneValues.Count do
      begin
        AStringList.Add('SampleZoneValues='+UserSession.SampleZoneValues.Strings[i-1]);
      end;
    end;
    tNow := dmUser.GetUTCDateTime;
    //WebApplication.ShowMessage('before LoggedIn');
    if (UserSession.LoggedIn) then
    begin
      tmpstring := AStringList.Text;
      //tmpANSIstring := tmpstring;
      //WebApplication.ShowMessage(tmpstring);
      //WebApplication.ShowMessage(tmpstring);
      dmUser.qCookieInfo.Close;
      dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
      dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfo.Close;
      dmUser.cdsCookieInfo.Open;
      if (dmUser.cdsCookieInfo.RecordCount > 0) then
      begin
        //WebApplication.ShowMessage('cdsCookieInfo RecordCount > 0');
        //WebApplication.ShowMessage(UserSession.UserID);
        //WebApplication.ShowMessage(UserSession.ThisProgram);
        //WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Edit;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpstring;
        dmUser.cdsCookieInfo.Post;
      end else
      begin
        //WebApplication.ShowMessage('cdsCookieInfo RecordCount = 0');
        //WebApplication.ShowMessage(UserSession.UserID);
        //WebApplication.ShowMessage(UserSession.ThisProgram);
        //WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Append;
        dmUser.cdsCookieInfoUSERID.AsString := UserSession.UserID;
        dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpstring;
        dmUser.cdsCookieInfo.Post;
      end;
      //WebApplication.ShowMessage(dmUser.cdsCookieInfoCOOKIEINFO.AsString);
      try
        dmUser.cdsCookieInfo.ApplyUpdates(0);
        //WebApplication.ShowMessage('Updates applied to cdsCookieInfo');
        //dmUser.SetDeveloperData(tmpstring);
      except
        WebApplication.ShowMessage('Not able to apply updates to cdsCookieInfo');
      end;
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetCookies;
var
  tmpString : string;
  i, tmpi, iCode : integer;
  tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      AStringList.Text := dmUser.cdsCookieInfoCOOKIEINFO.AsString;
    end;
    Val(AStringList.Values['IncludeContinentValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeContinentValues := true;
      UserSession.GetStringsValues(AStringList,'ContinentValues',UserSession.ContinentValues);
    end;
    Val(AStringList.Values['IncludeAreaValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAreaValues := true;
      UserSession.GetStringsValues(AStringList,'AreaValues',UserSession.AreaValues);
    end;
    Val(AStringList.Values['IncludeUnitValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUnitValues := true;
      UserSession.GetStringsValues(AStringList,'UnitValues',UserSession.UnitValues);
    end;
    Val(AStringList.Values['IncludeUnitRankValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUnitRankValues := true;
      UserSession.GetStringsValues(AStringList,'UnitRankValues',UserSession.UnitRankValues);
    end;
    Val(AStringList.Values['IncludeReferenceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeReferenceValues := true;
      UserSession.GetStringsValues(AStringList,'ReferenceValues',UserSession.ReferenceValues);
    end;
    UserSession.ReferenceStartFrom := AStringList.Values['ReferenceStartFrom'];
    UserSession.ReferenceEndWith := AStringList.Values['ReferenceEndWith'];
    Val(AStringList.Values['IncludeValidationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeValidationValues := true;
      UserSession.GetStringsValues(AStringList,'ValidationValues',UserSession.ValidationValues);
    end;
    Val(AStringList.Values['IncludeDateFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDateFromValue := true;
      UserSession.DateFromField := AStringList.Values['DateFromField'];
    end;
    Val(AStringList.Values['IncludeDateToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDateToValue := true;
      UserSession.DateToField := AStringList.Values['DateToField'];
    end;
    Val(AStringList.Values['IncludeAllParentIDs'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAllParentIDs := true;
    end else
    begin
      UserSession.IncludeAllParentIDs := false;
    end;
    UserSession.OrderByValue := AStringList.Values['OrderByValue'];
    if UserSession.CanInsert then
    begin
      UserSession.NewContinentID := AStringList.Values['NewContinentID'];
      UserSession.NewAreaID := AStringList.Values['NewAreaID'];
      UserSession.NewUnit := AStringList.Values['NewUnit'];
      UserSession.NewReferenceID := AStringList.Values['NewReferenceID'];
    end;
    Val(AStringList.Values['IncludeSortFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSortFromValue := true;
      UserSession.SortFromField := AStringList.Values['SortFromField'];
    end;
    Val(AStringList.Values['IncludeSortToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSortToValue := true;
      UserSession.SortToField := AStringList.Values['SortToField'];
    end;
    Val(AStringList.Values['IncludeDomainValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDomainValues := true;
      UserSession.GetStringsValues(AStringList,'DomainValues',UserSession.DomainValues);
    end;
    Val(AStringList.Values['IncludeDomainTypeValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDomainTypeValues := true;
      UserSession.GetStringsValues(AStringList,'DomainTypeValues',UserSession.DomainTypeValues);
    end;
    Val(AStringList.Values['IncludeDomainValidationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDomainValidationValues := true;
      UserSession.GetStringsValues(AStringList,'DomainValidationValues',UserSession.DomainValidationValues);
    end;
    Val(AStringList.Values['IncludeOrogenyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeOrogenyValues := true;
      UserSession.GetStringsValues(AStringList,'OrogenyValues',UserSession.OrogenyValues);
    end;
    Val(AStringList.Values['IncludePeriodValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludePeriodValues := true;
      UserSession.GetStringsValues(AStringList,'PeriodValues',UserSession.PeriodValues);
    end;
    Val(AStringList.Values['IncludeLIPValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeLIPValues := true;
      UserSession.GetStringsValues(AStringList,'LIPValues',UserSession.LIPValues);
    end;
    Val(AStringList.Values['IncludeSizeValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSizeValues := true;
      UserSession.GetStringsValues(AStringList,'SizeValues',UserSession.SizeValues);
    end;
    Val(AStringList.Values['IncludeRatingValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeRatingValues := true;
      UserSession.GetStringsValues(AStringList,'RatingValues',UserSession.RatingValues);
    end;
    Val(AStringList.Values['IncludeMorphologyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeMorphologyValues := true;
      UserSession.GetStringsValues(AStringList,'MorphologyValues',UserSession.MorphologyValues);
    end;
    Val(AStringList.Values['IncludeContOceanValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeContOceanValues := true;
      UserSession.GetStringsValues(AStringList,'ContOceanValues',UserSession.ContOceanValues);
    end;
    Val(AStringList.Values['IncludeUsersWhoForValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUsersWhoForValues := true;
      UserSession.GetStringsValues(AStringList,'UsersWhoForValues',UserSession.UsersWhoForValues);
    end;
    Val(AStringList.Values['IncludeDepositValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDepositValues := true;
      UserSession.GetStringsValues(AStringList,'DepositValues',UserSession.DepositValues);
    end;
    Val(AStringList.Values['IncludeClanValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeClanValues := true;
      UserSession.GetStringsValues(AStringList,'ClanValues',UserSession.ClanValues);
    end;
    Val(AStringList.Values['IncludeCommodityValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeCommodityValues := true;
      UserSession.GetStringsValues(AStringList,'CommodityValues',UserSession.CommodityValues);
    end;
    Val(AStringList.Values['IncludeAgeConstraintValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAgeConstraintValues := true;
      UserSession.GetStringsValues(AStringList,'AgeConstraintValues',UserSession.AgeConstraintValues);
    end;
    Val(AStringList.Values['IncludeInc4ChtValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeInc4ChtValues := true;
      UserSession.GetStringsValues(AStringList,'Inc4ChtValues',UserSession.Inc4ChtValues);
    end;
    Val(AStringList.Values['IncludeDepositStatusValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDepositStatusValues := true;
      UserSession.GetStringsValues(AStringList,'DepositStatusValues',UserSession.DepositStatusValues);
    end;
    Val(AStringList.Values['IncludeSampleZoneValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeSampleZoneValues := true;
      UserSession.GetStringsValues(AStringList,'SampleZoneValues',UserSession.SampleZoneValues);
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetStringsValues(AStrings: TStrings;
                           AKey: String; AValueList: TStringList);
//from routine published by Bob Swart
var
  FieldValue: String;
  i, match: Integer;
begin
  AKey := AKey + '=';
  for i:=0 to Pred(AStrings.Count) do
  begin
    FieldValue := AStrings.Strings[i];
    if Pos(AKey, FieldValue) = 1 then { exact match }
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;


initialization
  TIWServerController.SetServerControllerClass;

end.

