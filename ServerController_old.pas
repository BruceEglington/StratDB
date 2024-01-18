unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  usrIW_dm, IWApplication, IWAppForm,
  IniFiles,
  IWStrat_dmOpt,
  IWStrat_dmDV, IWStrat_dmC, IWStrat_dmLIP,
  IWStrat_dmD,
  MidasLib,
  uSetupOctaGateURLBase, IWStrat_constants, IWStrat_dm;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication;
      var VMainForm: TIWBaseForm);
    procedure IWServerControllerBaseReEntry(ASession: TIWApplication);
    procedure IWServerControllerBaseCreate(Sender: TObject);
    procedure IWServerControllerBaseBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    procedure GetIniFile;
  public
  end;

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

    MapFileName : string;
    MapDBFName : string;
    MapFieldName : string;
    MapValueFieldName : string;
    UseDBF : boolean;
    HORZSIZE, VERTSIZE : integer;

    WhereAmI :  string;  // string used to identify where one is in program process
    LC : integer;    // counter to identify unneeded iterations through data when graphing
    dmUser : TdmUser;
    dmStrat : TdmStrat;
    dmOpt : TdmOpt;
    dmDV  : TdmDV;
    dmStratC : TdmStratC;
    dmStratD : TdmStratD;
    dmLIP : TdmLIP;

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

implementation
{$R *.dfm}

uses
  IWInit, usr_uLogin, usr_uregister, XMLDoc, XMLIntf, IWStrat_umain,
  usr_uDBInterface, usr_uDonate, IWStrat_constvalues, NumRecipes_varb;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
begin
  AppIni := TIniFile.Create('stratdb.ini');
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/stratdb');
    if (URLBase = '/') then URLBase := '';
  finally
    AppIni.Free;
  end;
end;

procedure TIWServerController.IWServerControllerBaseBeforeDispatch(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  //SetupOctaGateURLBase(self, Request);
  //if pos(#$26#$26, Request.Content) > 0 then Request.ContentFields.Text := '';
end;

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
begin
  GetIniFile;
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  ASession: TIWApplication; var VMainForm: TIWBaseForm);
begin
  ASession.Data := TUserSession.Create(nil);
end;

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  //UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmStrat := TdmStrat.Create(Self);
  dmStrat.sqlcStrat.Connected := false;
  dmDV := TdmDV.Create(Self);
  dmDV.sqlcDateView.Connected := false;
  dmOpt := TdmOpt.Create(Self);
  dmOpt.sqlcStrat.Connected := false;
  dmStratC := TdmStratC.Create(Self);
  dmStratC.sqlcStrat.Connected := false;
  dmLIP := TdmLIP.Create(Self);
  dmLIP.sqlcLIP.Connected := false;
  dmStratD := TdmStratD.Create(Self);
  dmStratD.sqlcStrat.Connected := false;
  ContinentValues := TStringList.Create;
  AreaValues := TStringList.Create;
  UnitValues := TStringList.Create;
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
end;

destructor TUserSession.Destroy;
begin
  FreeAndNil(ContinentValues);
  FreeAndNil(AreaValues);
  FreeAndNil(UnitValues);
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
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.ThisProgram := 'StratDB';
  LoggedIn := TRUE;
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := true;        //bme  - should be false here
  UserSession.CanValidate := false;
  UserSession.CanExport := false;
  UserSession.CanViewPlus := false;
  UserSession.CanModifyPlus := false;
  dmUser.SetDeveloperData(UserSession.ThisProgram+'  '+UserSession.WhereAmI);
  IncrementNumUses(UserSession.ThisProgram);    //bme
  UserSession.NumRecordsPerPage := 50;
  CheckRights(UserSession.ThisProgram,UserSession.UserID,UserSession.UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  dmStrat.qUsers.Close;
  dmStrat.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsUsers.Close;
  dmStrat.cdsUsers.Open;
  if (dmStrat.cdsUsers.RecordCount < 1) then
  begin
    try
      dmStrat.cdsUsers.Close;
      dmStrat.cdsUsers.Open;
      dmStrat.cdsUsers.Append;
      dmStrat.cdsUsersUSERID.AsString := UserSession.UserID;
      dmStrat.cdsUsers.Post;
      dmStrat.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
      end;
    end;
    dmStrat.cdsUsers.Close;
  end;

  dmStrat.qUsersWhoFor.Close;
  dmStrat.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsUsersWhoFor.Close;
  dmStrat.cdsUsersWhoFor.Open;
  if (dmStrat.cdsUsersWhoFor.RecordCount < 1) then
  begin
    try
      dmStrat.cdsUsersWhoFor.Close;
      dmStrat.cdsUsersWhoFor.Open;
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

  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;

procedure TUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  dmUser.SetDeveloperData('StratDB - NeedLogin');
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TIWServerController.IWServerControllerBaseReEntry(
  ASession: TIWApplication);
begin
  {
  TUserSession(ASession.Data).ContinentValues.Assign(ASession.RunParams);
  }
end;

procedure TUserSession.SetCookies;
var
  tmpString : string;
  tmpANSIstring : ANSIstring;
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
    if UserSession.IncludeReferenceValues then
    begin
      AStringList.Add('IncludeReferenceValues='+IntToStr(UserSession.ReferenceValues.Count));
      for i := 1 to UserSession.ReferenceValues.Count do
      begin
        AStringList.Add('ReferenceValues='+UserSession.ReferenceValues.Strings[i-1]);
      end;
    end;
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
    tNow := Now;
    WebApplication.ShowMessage('before LoggedIn');
    if (UserSession.LoggedIn) then
    begin
      tmpstring := AStringList.Text;
      tmpANSIstring := tmpstring;
      WebApplication.ShowMessage(tmpstring);
      WebApplication.ShowMessage(tmpANSIstring);
      dmUser.qCookieInfo.Close;
      dmUser.qCookieInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
      dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfo.Close;
      dmUser.cdsCookieInfo.Open;
      if (dmUser.cdsCookieInfo.RecordCount > 0) then
      begin
        WebApplication.ShowMessage('cdsCookieInfo RecordCount > 0');
        WebApplication.ShowMessage(UserSession.UserID);
        WebApplication.ShowMessage(UserSession.ThisProgram);
        WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Edit;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpANSIstring;
        dmUser.cdsCookieInfo.Post;
      end else
      begin
        WebApplication.ShowMessage('cdsCookieInfo RecordCount = 0');
        WebApplication.ShowMessage(UserSession.UserID);
        WebApplication.ShowMessage(UserSession.ThisProgram);
        WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Append;
        dmUser.cdsCookieInfoUSERNAMEID.AsString := UserSession.UserID;
        dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpANSIstring;
        dmUser.cdsCookieInfo.Post;
      end;
      WebApplication.ShowMessage(dmUser.cdsCookieInfoCOOKIEINFO.AsString);
      try
        dmUser.cdsCookieInfo.ApplyUpdates(0);
        WebApplication.ShowMessage('Updates applied to cdsCookieInfo');
        dmUser.SetDeveloperData(tmpANSIstring);
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
    dmUser.qCookieInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
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
    Val(AStringList.Values['IncludeReferenceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeReferenceValues := true;
      UserSession.GetStringsValues(AStringList,'ReferenceValues',UserSession.ReferenceValues);
    end;
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

{
procedure TUserSession.GetStringValues(AString: String;
                           AKey: String; AValueList: TStringList);
var
  FieldValue: String;
  i, match: Integer;
  match2 : integer;
begin
  FieldValue := AString;
  match := 0;
  match2 := Pos(',', FieldValue);
  repeat
    match2 := Pos(',', FieldValue);
    if (match2 > 0) then
    begin
      AValueList.Add(Copy(FieldValue, match+1, match2-match+1));
      FieldValue := Copy(FieldValue,match2+1, Length(FieldValue)-match+1);
    end else
    begin
      AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match+1));
      match2 := 0;
    end;
  until (match2 = 0);
end;
}

initialization
  TIWServerController.SetServerControllerClass;

end.

