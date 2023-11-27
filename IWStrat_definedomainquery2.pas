unit IWStrat_definedomainquery2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  IWStrat_frTopBar, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWRegion, IWHTML40Container;

type
  TISFDefineDomainQuery2 = class(TIWAppForm)
    IWRegion2: TIWRegion;
    rectLeft: TIWRectangle;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwlblErrorTop: TIWLabel;
    IWText1: TIWText;
    iwcbRestrictParentID: TIWCheckBox;
    iwbCancel: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbSubmitQuery: TIWButton;
    iwrDomains: TIWRegion;
    IWButton8: TIWButton;
    iwlDomains: TIWListbox;
    iwcbDomains: TIWCheckBox;
    iwrDomainTypes: TIWRegion;
    IWButton2: TIWButton;
    iwlDomainTypes: TIWListbox;
    iwcbDomainTypes: TIWCheckBox;
    iwrOrogenies: TIWRegion;
    IWButton4: TIWButton;
    iwlOrogenies: TIWListbox;
    iwcbOrogenies: TIWCheckBox;
    iwrValidation: TIWRegion;
    IWButton1: TIWButton;
    iwlValidation: TIWListbox;
    iwcbValidation: TIWCheckBox;
    iwrOrderBy: TIWRegion;
    iwlblErrorBottom: TIWLabel;
    iwbSubmitQuery2: TIWButton;
    iwrgOrderBy: TIWRadioGroup;
    IWLabel4: TIWLabel;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbClearCheckboxesClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWStrat_dm, ServerController, DB_List_Combo,
  IWStrat_frDomainGrid, IWStrat_uMain, IWStrat_dmC, usrIW_dm;

{$R *.dfm}


procedure TISFDefineDomainQuery2.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  UserSession.IncludeAreaValues := false;
  //dmStrat.ConstructUnitAreaQuery;
  //dmUser.SetDeveloperData('TISFDefineDomainQuery2.IWAppFormCreate');
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwcbDomains.Checked := UserSession.IncludeDomainValues;
  iwcbDomaintypes.Checked := UserSession.IncludeDomainTypeValues;
  iwcbOrogenies.Checked := UserSession.IncludeOrogenyValues;
  iwcbValidation.Checked := UserSession.IncludeDomainValidationValues;
  iwcbRestrictParentID.Checked := not UserSession.IncludeAllParentIDs;
  {Orogenies}
  dmStratC.qOrogeniesCont.Close;
  dmStratC.qOrogeniesCont.SQL.Clear;
  dmStratC.qOrogeniesCont.SQL.Add('SELECT * FROM OROGENIES');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStratC.qOrogeniesCont.SQL.Add('WHERE ( OROGENIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStratC.qOrogeniesCont.SQL.Add('OR OROGENIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStratC.qOrogeniesCont.SQL.Add(' ) ');
  end;
  //dmUser.SetDeveloperData(dmStratC.qOrogeniesCont.SQL.Text);
  {Domains}
  dmStrat.qDomains.Close;
  dmStrat.qDomains.SQL.Clear;
  dmStrat.qDomains.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.CONTINENTID, DOMAINS.DOMAINPARENTID,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.DOMAINTYPEID, DOMAINS.MAXAGE,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.SPOTLATITUDE,DOMAINS.SPOTLONGITUDE');
  dmStrat.qDomains.SQL.Add('FROM DOMAINS,DOMAINFOR,USERSWHOFOR');
  dmStrat.qDomains.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID');
  dmStrat.qDomains.SQL.Add('AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qDomains.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qDomains.SQL.Add('OR DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qDomains.SQL.Add(' ) ');
  end;
  dmStrat.qDomains.SQL.Add('ORDER BY DOMAINS.DOMAINNAME');
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
  dmStrat.qDomains.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsDomains.Close;
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '2')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  iwrDomains.Visible := UserSession.IncludeDomainValues;
  iwrDomainTypes.Visible := UserSession.IncludeDomainTypeValues;
  iwrOrogenies.Visible := UserSession.IncludeOrogenyValues;
  iwrValidation.Visible := UserSession.IncludeDomainValidationValues;
  if (Usersession.IncludeDomainValues) then UpdateListBoxValues(iwlDomains,dmStrat.cdsDomains,'DomainName','DomainID',UserSession.DomainValues);
  if (Usersession.IncludeOrogenyValues) then UpdateListBoxValues(iwlOrogenies,dmStratC.cdsOrogeniesCont,'Orogeny','OrogenyID',UserSession.OrogenyValues);
  if (Usersession.IncludeDomainValidationValues) then UpdateListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.DomainValidationValues);
  if (Usersession.IncludeDomainTypeValues) then UpdateListBoxValues(iwlDomainTypes,dmStratC.cdsDomainTypes,'DomainType','DomainTypeID',UserSession.DomainTypeValues);
end;

procedure TISFDefineDomainQuery2.iwbSubmitQueryClick(Sender: TObject);
var
  i : integer;
  tmpString : string;
begin
  UserSession.DataHaveChanged := true;
    tmpString := '';
    for i := 0 to iwlDomains.Items.Count-1 do
    begin
      if iwlDomains.Selected[i] then
      begin
        tmpString := tmpString + '__'+iwlDomains.Items.Strings[i];
      end;
    end;
    //dmUser.SetDeveloperData(tmpString);
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeDomainValues := iwcbDomains.Checked;
  //if (UserSession.IncludeDomainValues) then dmUser.SetDeveloperData('Domain domains checked')
  //                                     else dmUser.SetDeveloperData('Domain domains not checked');
  UserSession.IncludeDomainTypeValues := iwcbDomainTypes.Checked;
  UserSession.IncludeOrogenyValues := iwcbOrogenies.Checked;
  UserSession.IncludeDomainValidationValues := iwcbValidation.Checked;
  UserSession.IncludeAllParentIDs := not iwcbRestrictParentID.Checked;
  //dmUser.SetDeveloperData('2 check');
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
  //if (UserSession.IncludeDomainValues) then dmUser.SetDeveloperData('2 Domain domains checked')
  //                                     else dmUser.SetDeveloperData('2 Domain domains not checked');

  if UserSession.IncludeDomainValues then
    GetListBoxValues(iwlDomains,dmStrat.cdsDomains,'DomainName','DomainID',UserSession.DomainValues);
    tmpString := '';
    for i := 0 to UserSession.DomainValues.Count-1 do
    begin
      tmpString := tmpString + '__'+UserSession.DomainValues[i];
    end;
    //dmUser.SetDeveloperData(tmpString);
  if UserSession.IncludeDomainTypeValues then
    GetListBoxValues(iwlDomainTypes,dmStratC.cdsDomainTypes,'DomainType','DomainTypeID',UserSession.DomainTypeValues);
  if UserSession.IncludeOrogenyValues then
    GetListBoxValues(iwlOrogenies,dmStratC.cdsOrogeniesCont,'Orogeny','OrogenyID',UserSession.OrogenyValues);
  if UserSession.IncludeDomainValidationValues then
    GetListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.DomainValidationValues);
  //dmUser.SetDeveloperData('4 check ' + IntToStr(UserSession.DomainValues.Count));
  //if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
  if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
  if ((UserSession.IncludeDomainTypeValues) and (UserSession.DomainTypeValues.Count=0)) then UserSession.IncludeDomainTypeValues := false;
  if ((UserSession.IncludeOrogenyValues) and (UserSession.OrogenyValues.Count=0)) then UserSession.IncludeOrogenyValues := false;
  if ((UserSession.IncludeDomainValidationValues) and (UserSession.DomainValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
  //if (UserSession.IncludeDomainValues) then dmUser.SetDeveloperData('4 Domain domains checked')
  //                                     else dmUser.SetDeveloperData('4 Domain domains not checked');
  if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
  //dmUser.SetDeveloperData('5 check ' + IntToStr(UserSession.DomainValues.Count));
  //if (UserSession.IncludeDomainValues) then dmUser.SetDeveloperData('5 Domain domains checked')
  //                                     else dmUser.SetDeveloperData('5 Domain domains not checked');

  if Validate then
  begin
    dmStratC.cdsOrogeniesCont.Close;
    dmStrat.cdsDomains.Close;
    dmStrat.SubmitDomainQuery;
    //dmUser.SetDeveloperData(dmStrat.DomainQuery.SQL.Text);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDomainGrid.Create(WebApplication).Show
  end;
end;

procedure TISFDefineDomainQuery2.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineDomainQuery2.Validate: Boolean;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  if (not UserSession.IncludeDomainValues
    and not UserSession.IncludeOrogenyValues
    and not UserSession.IncludeDomainValidationValues
    and not UserSession.IncludeDomainTypeValues) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineDomainQuery2.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbDomainTypes.Checked := false;
  iwcbOrogenies.Checked := false;
  iwcbValidation.Checked := false;
  iwcbRestrictParentID.Checked := false;
  iwcbDomains.Checked := false;
end;

procedure TISFDefineDomainQuery2.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

end.
