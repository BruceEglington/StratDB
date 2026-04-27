unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm,
  //HTTPApp,
  // For OnNewSession Event
  IWApplication, IWAppForm, IW.Browser.Browser,
  IWUserSessionBase,
  IW.HTTP.Request, IW.HTTP.Reply,
  IWStrat_constvalues, IWStrat_constants,
  IWStrat_dm, IWStrat_dmC, IWStrat_dmD,
  IWStrat_dmDV, IWStrat_dmLIP, IWStrat_dmopt, usrIW_dm;

type
  TIWUserSession = class(TIWUserSessionBase)
    procedure IWUserSessionBaseDestroy(Sender: TObject);
    procedure IWUserSessionBaseCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserID, UserPassword, UserDisplayName : string;
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only
    ThisProgram : string;
    ThisProgramName : string;
    ProgressDate : string;
    IsFirstShow : boolean;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;
    CanExport : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    WhereAmI :  string;  // string used to identify where one is in program process
    NumRecordsFound : integer;
    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    Parameter2Chosen : string;
    NumRecordsPerPage : integer;
    PageNum, PageNumTotal : integer;
    ShowDebugButtons : boolean;
    NumUses : integer;
    DelayConnections : boolean;

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

    dmUser : TdmUser;
    dmOpt : TdmOpt;
    dmDV  : TdmDV;
    dmStratC : TdmStratC;
    dmStratD : TdmStratD;
    dmLIP : TdmLIP;
    dmStrat : TdmStrat;

    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    procedure SetCookies;
    procedure GetCookies;
    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
  end;


implementation

{$R *.dfm}

uses usr_uDBInterface, usr_uLogin,
  IWStrat_uMain, usr_uRegister;

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin
  //inherited Create(AOwner);
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
end;

procedure TIWUserSession.IWUserSessionBaseDestroy(Sender: TObject);
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
  dmStrat.sqlcStrat.Connected := false;
  dmOpt.sqlcStrat.Connected := false;
  dmDV.sqlcDateView.Connected := false;
  dmStratC.sqlcStrat.Connected := false;
  dmLIP.sqlcLIP.Connected := false;
  dmStratD.sqlcStrat.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  //dmStrat.Free;
  //inherited Destroy;
end;

procedure TIWUserSession.GetStringsValues(AStrings: TStrings;
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
    if Pos(AKey, FieldValue) = 1 then //exact match
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;

procedure TIWUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  //dmUser.SetDeveloperData('StratDB - NeedLogin');
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TIWUserSession.AfterLogin;
begin
  WhereAmI := 'AfterLogin';
  ThisProgram := 'StratDB';
  LoggedIn := TRUE;
  CanModify := false;
  CanInsert := false;
  CanDelete := false;
  IsDeveloper := true;        //bme  - should be false here
  CanValidate := false;
  CanExport := false;
  CanViewPlus := false;
  CanModifyPlus := false;
  //dmUser.SetDeveloperData(ThisProgram+'  '+WhereAmI);
  IncrementNumUses(ThisProgram);    //bme
  NumRecordsPerPage := 50;
  CheckRights(ThisProgram,UserID,UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  dmStrat.qUsers.Close;
  dmStrat.qUsers.ParamByName('USERID').AsString := UserID;
  dmStrat.cdsUsers.Close;
  dmStrat.cdsUsers.Open;
  if (dmStrat.cdsUsers.RecordCount < 1) then
  begin
    try
      dmStrat.cdsUsers.Close;
      dmStrat.cdsUsers.Open;
      dmStrat.cdsUsers.Append;
      dmStrat.cdsUsersUSERID.AsString := UserID;
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
  dmStrat.qUsersWhoFor.ParamByName('USERID').AsString := UserID;
  dmStrat.cdsUsersWhoFor.Close;
  dmStrat.cdsUsersWhoFor.Open;
  if (dmStrat.cdsUsersWhoFor.RecordCount < 1) then
  begin
    try
      dmStrat.cdsUsersWhoFor.Close;
      dmStrat.cdsUsersWhoFor.Open;
      dmStrat.cdsUsersWhoFor.Append;
      dmStrat.cdsUsersWhoForUSERID.AsString := UserID;
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

  DataHaveChanged := true;
  dmOpt.GetUserOptions;

  MapFileName := DefaultMapfolder+DefaultMapFileName;
  MapDBFName := DefaultMapfolder+DefaultMapDBFName;
  MapFieldName := 'WB_CNTRY';
  MapValueFieldName := 'CONTINENT';
  UseDBF := false;
  HORZSIZE := 1024; // horizontal screen size in pixels
  VERTSIZE := 768;  // vertical screen size in pixels

  NewContinentID := 'UND';
  NewAreaID := 'UND';
  NewUnit := 'UNDEFINED';
  NewReferenceID := 'not defined';

  ReferenceStartFrom := 'A';
  ReferenceEndWith := 'zz';
  UnitStartFrom := 'A';
  UnitEndWith := 'zz';

  Parameter2Chosen := 'SmNd';
  OrderByValue := '0';

  UsersWhoForValues.Clear;
  UsersWhoForValues.Add('PUBL');

  GetCookies;

  TIWAppForm(WebApplication.ActiveForm).Release;
    TISFMain.Create(WebApplication).Show;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;

procedure TIWUserSession.SetCookies;
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
    if IncludeContinentValues then
    begin
      AStringList.Add('IncludeContinentValues='+IntToStr(ContinentValues.Count));
      for i := 1 to ContinentValues.Count do
      begin
        AStringList.Add('ContinentValues='+ContinentValues.Strings[i-1]);
      end;
    end;
    if IncludeAreaValues then
    begin
      AStringList.Add('IncludeAreaValues='+IntToStr(AreaValues.Count));
      for i := 1 to AreaValues.Count do
      begin
        AStringList.Add('AreaValues='+AreaValues.Strings[i-1]);
      end;
    end;
    if IncludeUnitValues then
    begin
      AStringList.Add('IncludeUnitValues='+IntToStr(UnitValues.Count));
      for i := 1 to UnitValues.Count do
      begin
        AStringList.Add('UnitValues='+UnitValues.Strings[i-1]);
      end;
    end;
    if IncludeReferenceValues then
    begin
      AStringList.Add('IncludeReferenceValues='+IntToStr(ReferenceValues.Count));
      for i := 1 to ReferenceValues.Count do
      begin
        AStringList.Add('ReferenceValues='+ReferenceValues.Strings[i-1]);
      end;
    end;
    if IncludeValidationValues then
    begin
      AStringList.Add('IncludeValidationValues='+IntToStr(ValidationValues.Count));
      for i := 1 to ValidationValues.Count do
      begin
        AStringList.Add('ValidationValues='+ValidationValues.Strings[i-1]);
      end;
    end;
    if IncludeDateFromValue then
    begin
      AStringList.Add('IncludeDateFromValue='+IntToStr(1));
      AStringList.Add('DateFromField='+DateFromField);
    end;
    if IncludeDateToValue then
    begin
      AStringList.Add('IncludeDateToValue='+IntToStr(1));
      AStringList.Add('DateToField='+DateToField);
    end;
    if IncludeAllParentIDs then
    begin
      AStringList.Add('IncludeAllParentIDs='+IntToStr(1));
    end else
    begin
      AStringList.Add('IncludeAllParentIDs='+IntToStr(0));
    end;
    AStringList.Add('OrderByValue='+OrderByValue);
    if CanInsert then
    begin
      AStringList.Add('NewContinentID='+NewContinentID);
      AStringList.Add('NewAreaID='+NewAreaID);
      AStringList.Add('NewUnit='+NewUnit);
      AStringList.Add('NewReferenceID='+NewReferenceID);
    end;
    if IncludeSortFromValue then
    begin
      AStringList.Add('IncludeSortFromValue='+IntToStr(1));
      AStringList.Add('SortFromField='+SortFromField);
    end;
    if IncludeSortToValue then
    begin
      AStringList.Add('IncludeSortToValue='+IntToStr(1));
      AStringList.Add('SortToField='+SortToField);
    end;
    if IncludeDomainValues then
    begin
      AStringList.Add('IncludeDomainValues='+IntToStr(DomainValues.Count));
      for i := 1 to DomainValues.Count do
      begin
        AStringList.Add('DomainValues='+DomainValues.Strings[i-1]);
      end;
    end;
    if IncludeDomainTypeValues then
    begin
      AStringList.Add('IncludeDomainTypeValues='+IntToStr(DomainTypeValues.Count));
      for i := 1 to DomainTypeValues.Count do
      begin
        AStringList.Add('DomainTypeValues='+DomainTypeValues.Strings[i-1]);
      end;
    end;
    if IncludeDomainValidationValues then
    begin
      AStringList.Add('IncludeDomainValidationValues='+IntToStr(DomainValidationValues.Count));
      for i := 1 to DomainValidationValues.Count do
      begin
        AStringList.Add('DomainValidationValues='+DomainValidationValues.Strings[i-1]);
      end;
    end;
    if IncludeOrogenyValues then
    begin
      AStringList.Add('IncludeOrogenyValues='+IntToStr(OrogenyValues.Count));
      for i := 1 to OrogenyValues.Count do
      begin
        AStringList.Add('OrogenyValues='+OrogenyValues.Strings[i-1]);
      end;
    end;
    if IncludePeriodValues then
    begin
      AStringList.Add('IncludePeriodValues='+IntToStr(PeriodValues.Count));
      for i := 1 to PeriodValues.Count do
      begin
        AStringList.Add('PeriodValues='+PeriodValues.Strings[i-1]);
      end;
    end;
    if IncludeLIPValues then
    begin
      AStringList.Add('IncludeLIPValues='+IntToStr(LIPValues.Count));
      for i := 1 to LIPValues.Count do
      begin
        AStringList.Add('LIPValues='+LIPValues.Strings[i-1]);
      end;
    end;
    if IncludeSizeValues then
    begin
      AStringList.Add('IncludeSizeValues='+IntToStr(SizeValues.Count));
      for i := 1 to SizeValues.Count do
      begin
        AStringList.Add('SizeValues='+SizeValues.Strings[i-1]);
      end;
    end;
    if IncludeRatingValues then
    begin
      AStringList.Add('IncludeRatingValues='+IntToStr(RatingValues.Count));
      for i := 1 to RatingValues.Count do
      begin
        AStringList.Add('RatingValues='+RatingValues.Strings[i-1]);
      end;
    end;
    if IncludeMorphologyValues then
    begin
      AStringList.Add('IncludeMorphologyValues='+IntToStr(MorphologyValues.Count));
      for i := 1 to MorphologyValues.Count do
      begin
        AStringList.Add('MorphologyValues='+MorphologyValues.Strings[i-1]);
      end;
    end;
    if IncludeContOceanValues then
    begin
      AStringList.Add('IncludeContOceanValues='+IntToStr(ContOceanValues.Count));
      for i := 1 to ContOceanValues.Count do
      begin
        AStringList.Add('ContOceanValues='+ContOceanValues.Strings[i-1]);
      end;
    end;
    if IncludeUsersWhoForValues then
    begin
      AStringList.Add('IncludeUsersWhoForValues='+IntToStr(UsersWhoForValues.Count));
      for i := 1 to UsersWhoForValues.Count do
      begin
        AStringList.Add('UsersWhoForValues='+UsersWhoForValues.Strings[i-1]);
      end;
    end;
    if IncludeDepositValues then
    begin
      AStringList.Add('IncludeDepositValues='+IntToStr(DepositValues.Count));
      for i := 1 to DepositValues.Count do
      begin
        AStringList.Add('DepositValues='+DepositValues.Strings[i-1]);
      end;
    end;
    if IncludeClanValues then
    begin
      AStringList.Add('IncludeClanValues='+IntToStr(ClanValues.Count));
      for i := 1 to ClanValues.Count do
      begin
        AStringList.Add('ClanValues='+ClanValues.Strings[i-1]);
      end;
    end;
    if IncludeCommodityValues then
    begin
      AStringList.Add('IncludeCommodityValues='+IntToStr(CommodityValues.Count));
      for i := 1 to CommodityValues.Count do
      begin
        AStringList.Add('CommodityValues='+CommodityValues.Strings[i-1]);
      end;
    end;
    if IncludeAgeConstraintValues then
    begin
      AStringList.Add('IncludeAgeConstraintValues='+IntToStr(AgeConstraintValues.Count));
      for i := 1 to AgeConstraintValues.Count do
      begin
        AStringList.Add('AgeConstraintValues='+AgeConstraintValues.Strings[i-1]);
      end;
    end;
    if IncludeInc4ChtValues then
    begin
      AStringList.Add('IncludeInc4ChtValues='+IntToStr(Inc4ChtValues.Count));
      for i := 1 to Inc4ChtValues.Count do
      begin
        AStringList.Add('Inc4ChtValues='+Inc4ChtValues.Strings[i-1]);
      end;
    end;
    if IncludeDepositStatusValues then
    begin
      AStringList.Add('IncludeDepositStatusValues='+IntToStr(DepositStatusValues.Count));
      for i := 1 to DepositStatusValues.Count do
      begin
        AStringList.Add('DepositStatusValues='+DepositStatusValues.Strings[i-1]);
      end;
    end;
    tNow := Now;
    WebApplication.ShowMessage('before LoggedIn');
    if (LoggedIn) then
    begin
      tmpstring := AStringList.Text;
      tmpANSIstring := tmpstring;
      //WebApplication.ShowMessage(tmpstring);
      //WebApplication.ShowMessage(tmpANSIstring);
      dmUser.qCookieInfo.Close;
      dmUser.qCookieInfo.ParamByName('USERID').AsString := UserID;
      dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := ThisProgram;
      dmUser.cdsCookieInfo.Close;
      dmUser.cdsCookieInfo.Open;
      if (dmUser.cdsCookieInfo.RecordCount > 0) then
      begin
        //WebApplication.ShowMessage('cdsCookieInfo RecordCount > 0');
        //WebApplication.ShowMessage(UserID);
        //WebApplication.ShowMessage(ThisProgram);
        //WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Edit;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpANSIstring;
        dmUser.cdsCookieInfo.Post;
      end else
      begin
        //WebApplication.ShowMessage('cdsCookieInfo RecordCount = 0');
        //WebApplication.ShowMessage(UserID);
        //WebApplication.ShowMessage(ThisProgram);
        //WebApplication.ShowMessage(DateTimeToStr(tNow));
        dmUser.cdsCookieInfo.Append;
        dmUser.cdsCookieInfoUSERID.AsString := UserID;
        dmUser.cdsCookieInfoSOFTWAREID.AsString := ThisProgram;
        dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
        dmUser.cdsCookieInfoCOOKIEINFO.AsString := tmpANSIstring;
        dmUser.cdsCookieInfo.Post;
      end;
      WebApplication.ShowMessage(dmUser.cdsCookieInfoCOOKIEINFO.AsString);
      try
        dmUser.cdsCookieInfo.ApplyUpdates(0);
        //WebApplication.ShowMessage('Updates applied to cdsCookieInfo');
        dmUser.SetDeveloperData(tmpANSIstring);
      except
        WebApplication.ShowMessage('Not able to apply updates to cdsCookieInfo');
      end;
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TIWUserSession.GetCookies;
var
  tmpString : string;
  i, tmpi, iCode : integer;
  tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := ThisProgram;
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
      IncludeContinentValues := true;
      GetStringsValues(AStringList,'ContinentValues',ContinentValues);
    end;
    Val(AStringList.Values['IncludeAreaValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeAreaValues := true;
      GetStringsValues(AStringList,'AreaValues',AreaValues);
    end;
    Val(AStringList.Values['IncludeUnitValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeUnitValues := true;
      GetStringsValues(AStringList,'UnitValues',UnitValues);
    end;
    Val(AStringList.Values['IncludeReferenceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeReferenceValues := true;
      GetStringsValues(AStringList,'ReferenceValues',ReferenceValues);
    end;
    Val(AStringList.Values['IncludeValidationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeValidationValues := true;
      GetStringsValues(AStringList,'ValidationValues',ValidationValues);
    end;
    Val(AStringList.Values['IncludeDateFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDateFromValue := true;
      DateFromField := AStringList.Values['DateFromField'];
    end;
    Val(AStringList.Values['IncludeDateToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDateToValue := true;
      DateToField := AStringList.Values['DateToField'];
    end;
    Val(AStringList.Values['IncludeAllParentIDs'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeAllParentIDs := true;
    end else
    begin
      IncludeAllParentIDs := false;
    end;
    OrderByValue := AStringList.Values['OrderByValue'];
    if CanInsert then
    begin
      NewContinentID := AStringList.Values['NewContinentID'];
      NewAreaID := AStringList.Values['NewAreaID'];
      NewUnit := AStringList.Values['NewUnit'];
      NewReferenceID := AStringList.Values['NewReferenceID'];
    end;
    Val(AStringList.Values['IncludeSortFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeSortFromValue := true;
      SortFromField := AStringList.Values['SortFromField'];
    end;
    Val(AStringList.Values['IncludeSortToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeSortToValue := true;
      SortToField := AStringList.Values['SortToField'];
    end;
    Val(AStringList.Values['IncludeDomainValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDomainValues := true;
      GetStringsValues(AStringList,'DomainValues',DomainValues);
    end;
    Val(AStringList.Values['IncludeDomainTypeValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDomainTypeValues := true;
      GetStringsValues(AStringList,'DomainTypeValues',DomainTypeValues);
    end;
    Val(AStringList.Values['IncludeDomainValidationValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDomainValidationValues := true;
      GetStringsValues(AStringList,'DomainValidationValues',DomainValidationValues);
    end;
    Val(AStringList.Values['IncludeOrogenyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeOrogenyValues := true;
      GetStringsValues(AStringList,'OrogenyValues',OrogenyValues);
    end;
    Val(AStringList.Values['IncludePeriodValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludePeriodValues := true;
      GetStringsValues(AStringList,'PeriodValues',PeriodValues);
    end;
    Val(AStringList.Values['IncludeLIPValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeLIPValues := true;
      GetStringsValues(AStringList,'LIPValues',LIPValues);
    end;
    Val(AStringList.Values['IncludeSizeValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeSizeValues := true;
      GetStringsValues(AStringList,'SizeValues',SizeValues);
    end;
    Val(AStringList.Values['IncludeRatingValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeRatingValues := true;
      GetStringsValues(AStringList,'RatingValues',RatingValues);
    end;
    Val(AStringList.Values['IncludeMorphologyValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeMorphologyValues := true;
      GetStringsValues(AStringList,'MorphologyValues',MorphologyValues);
    end;
    Val(AStringList.Values['IncludeContOceanValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeContOceanValues := true;
      GetStringsValues(AStringList,'ContOceanValues',ContOceanValues);
    end;
    Val(AStringList.Values['IncludeUsersWhoForValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeUsersWhoForValues := true;
      GetStringsValues(AStringList,'UsersWhoForValues',UsersWhoForValues);
    end;
    Val(AStringList.Values['IncludeDepositValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDepositValues := true;
      GetStringsValues(AStringList,'DepositValues',DepositValues);
    end;
    Val(AStringList.Values['IncludeClanValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeClanValues := true;
      GetStringsValues(AStringList,'ClanValues',ClanValues);
    end;
    Val(AStringList.Values['IncludeCommodityValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeCommodityValues := true;
      GetStringsValues(AStringList,'CommodityValues',CommodityValues);
    end;
    Val(AStringList.Values['IncludeAgeConstraintValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeAgeConstraintValues := true;
      GetStringsValues(AStringList,'AgeConstraintValues',AgeConstraintValues);
    end;
    Val(AStringList.Values['IncludeInc4ChtValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeInc4ChtValues := true;
      GetStringsValues(AStringList,'Inc4ChtValues',Inc4ChtValues);
    end;
    Val(AStringList.Values['IncludeDepositStatusValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      IncludeDepositStatusValues := true;
      GetStringsValues(AStringList,'DepositStatusValues',DepositStatusValues);
    end;
  finally
    AStringList.Free;
  end;
end;


end.
