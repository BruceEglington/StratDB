unit IWStrat_definequery1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWStrat_frTopBar, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion, IWHTML40Container;

type
  TISFDefineQuery1 = class(TIWAppForm)
    TopBar: TISFTopBarStrat;
    iwrLeft: TIWRegion;
    iwrRight: TIWRegion;
    iwrButtonTop: TIWRegion;
    iwbNextStageOfQuery: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbCancel: TIWButton;
    iwrAreas: TIWRegion;
    iwcbAreas: TIWCheckBox;
    iwlAreas: TIWListbox;
    iwlblError: TIWLabel;
    IWText1: TIWText;
    iwrCheckboxes: TIWRegion;
    IWText2: TIWText;
    iwcbUnits: TIWCheckBox;
    iwcbReferences: TIWCheckBox;
    iwcbValidation: TIWCheckBox;
    iwcbDomains: TIWCheckBox;
    iwcbInc4Cht: TIWCheckBox;
    iwcbAgeConstraints: TIWCheckBox;
    iwcbPeriods: TIWCheckBox;
    iwcbWhoFor: TIWCheckBox;
    iwrUnitRanks: TIWRegion;
    iwlUnitRanks: TIWListbox;
    iwcbUnitRanks: TIWCheckBox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
    procedure iwbClearCheckboxesClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWStrat_dm, ServerController, IWStrat_definequery2, DB_List_Combo,
  IWStrat_uMain, IWStrat_constants, IWStrat_definedepositquery, usrIW_dm;

{$R *.dfm}


procedure TISFDefineQuery1.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwcbAreas.Checked := UserSession.IncludeAreaValues;
  iwcbUnits.Checked := UserSession.IncludeUnitValues;
  iwcbUnitRanks.Checked := UserSession.IncludeUnitRankValues;
  iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  iwcbWhoFor.Checked := UserSession.IncludeUsersWhoForValues;
  iwcbValidation.Checked := UserSession.IncludeValidationValues;
  iwcbDomains.Checked := UserSession.IncludeDomainValues;
  iwcbPeriods.Checked := UserSession.IncludePeriodValues;
  iwcbAgeConstraints.Checked := UserSession.IncludeAgeConstraintValues;
  iwcbInc4Cht.Checked := UserSession.IncludeInc4ChtValues;
  iwrUnitRanks.Visible := UserSession.IncludeUnitRankValues;
  dmStrat.qCountries.Close;
  dmStrat.qCountries.SQL.Clear;
  dmStrat.qCountries.SQL.Add('SELECT COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY, ');
  dmStrat.qCountries.SQL.Add('  COUNTRIES.CONTINENTID,');
  dmStrat.qCountries.SQL.Add('  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,');
  dmStrat.qCountries.SQL.Add('  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID');
  dmStrat.qCountries.SQL.Add('from COUNTRIES, CONTINENTS');
  dmStrat.qCountries.SQL.Add('where COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID');
  dmStrat.qCountries.SQL.Add('and COUNTRIES.COUNTRYHASRECORDS = '+''''+'Y'+'''');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qCountries.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qCountries.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qCountries.SQL.Add(' ) ');
  end;
  dmStrat.qCountries.SQL.Add('order by COUNTRIES.COUNTRY');
  dmStrat.cdsCountries.Close;
  //dmStrat.cdsCountries.Open;
  //dmUser.SetDeveloperData('DefineQuery1 before UpdateListBoxValues');
  UpdateListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
  if (Usersession.IncludeUnitRankValues) then UpdateListBoxValues(iwlUnitRanks,dmStrat.cdsUnitRanks,'UnitRank','RankID',UserSession.UnitRankValues);
  //dmUser.SetDeveloperData('DefineQuery1 after UpdateListBoxValues');
end;

procedure TISFDefineQuery1.iwbNextStageOfQueryClick(Sender: TObject);
begin
  UserSession.IncludeAreaValues := iwcbAreas.Checked;
  UserSession.IncludeUnitValues := iwcbUnits.Checked;
  UserSession.IncludeUnitRankValues := iwcbUnitRanks.Checked;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  UserSession.IncludeUsersWhoForValues := iwcbWhoFor.Checked;
  UserSession.IncludeValidationValues := iwcbValidation.Checked;
  UserSession.IncludePeriodValues := iwcbPeriods.Checked;
  UserSession.IncludeAgeConstraintValues := iwcbAgeConstraints.Checked;
  UserSession.IncludeInc4ChtValues := iwcbInc4Cht.Checked;
  UserSession.IncludeDomainValues := iwcbDomains.Checked;
  //dmUser.SetDeveloperData('DefineQuery1 before GetListBoxValues');
  if (UserSession.IncludeAreaValues) then
    GetListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
  if (UserSession.IncludeUnitRankValues) then
    GetListBoxValues(iwlUnitRanks,dmStrat.cdsUnitRanks,'UnitRank','RankID',UserSession.UnitRankValues);
  //dmUser.SetDeveloperData('DefineQuery1 after GetListBoxValues');
  if Validate then
  begin
    dmStrat.SubmitContAreaQuery;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender=usDetailsEdit)
      or (UserSession.UnitSender=usDetails)
      or (UserSession.UnitSender=usGrainSourcesDetritalUPb)
      or (UserSession.UnitSender=usGrainProbabilitiesDetritalUPb))
    then TISFDefineQuery2.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usDeposits))
    then TISFDefineDepositQuery.Create(WebApplication).Show;
  end;
end;

function TISFDefineQuery1.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.UnitSender=usDetailsEdit) or (UserSession.UnitSender=usDetails)) then
  begin
    if ((UserSession.AreaValues.Count = 0) and UserSession.IncludeAreaValues) then
    begin
      UserSession.IncludeAreaValues := false;
      //Result := false;
      //iwlblError.Visible := true;
    end;
    if ((UserSession.UnitRankValues.Count = 0) and UserSession.IncludeUnitRankValues) then
    begin
      UserSession.IncludeUnitRankValues := false;
      //Result := false;
      //iwlblError.Visible := true;
    end;
    if (not(UserSession.IncludeAreaValues) and not (UserSession.IncludeUnitRankValues)) then
    begin
      Result := false;
      iwlblError.Visible := true;
    end;
  end;
  if (UserSession.UnitSender=usDeposits) then
  begin
    if ((UserSession.AreaValues.Count = 0) and UserSession.IncludeAreaValues) then
    begin
      UserSession.IncludeAreaValues := false;
      Result := false;
      iwlblError.Visible := true;
    end;
  end;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFDefineQuery1.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

procedure TISFDefineQuery1.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbUnits.Checked := false;
  iwcbUnitRanks.Checked := false;
  iwcbReferences.Checked := false;
  iwcbWhoFor.Checked := false;
  iwcbValidation.Checked := false;
  iwcbDomains.Checked := false;
  iwcbPeriods.Checked := false;
  iwcbAgeConstraints.Checked := false;
  iwcbInc4Cht.Checked := false;
end;

end.
