unit IWStrat_definequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWStrat_frTopBar, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion, IWHTML40Container;

type
  TISFDefineQuery = class(TIWAppForm)
    TopBar: TISFTopBarStrat;
    iwrLeft: TIWRegion;
    iwrRight: TIWRegion;
    iwrButtonTop: TIWRegion;
    iwbNextStageOfQuery: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbCancel: TIWButton;
    iwrRegions: TIWRegion;
    iwcbContinents: TIWCheckBox;
    IWText1: TIWText;
    iwlContinents: TIWListbox;
    iwlblError: TIWLabel;
    iwrCheckboxes: TIWRegion;
    iwrRulers: TIWRegion;
    iwrRulersLeft: TIWRegion;
    iwrRulersMiddle: TIWRegion;
    iwrRulersRight: TIWRegion;
    iwrReferencesLIPs: TIWRegion;
    iwrReferences: TIWRegion;
    iwrReferencesLIPsMiddle: TIWRegion;
    iwrLIPs: TIWRegion;
    IWHRule2: TIWHRule;
    IWHRule1: TIWHRule;
    iwrUnitsDeposits: TIWRegion;
    iwrUnits: TIWRegion;
    iwcbUnits: TIWCheckBox;
    iwcbInc4Cht: TIWCheckBox;
    iwcbAgeConstraints: TIWCheckBox;
    iwcbPeriods: TIWCheckBox;
    iwcbUnitRanks: TIWCheckBox;
    iwrUnitsDepositsMiddle: TIWRegion;
    iwrDeposits: TIWRegion;
    iwcbDeposits: TIWCheckBox;
    iwcbDepositClans: TIWCheckBox;
    iwcbCommodities: TIWCheckBox;
    iwcbDepositStatus: TIWCheckBox;
    iwcbReferences: TIWCheckBox;
    iwcbDomains: TIWCheckBox;
    iwcbWhoFor: TIWCheckBox;
    iwcbValidation: TIWCheckBox;
    iwcbLIPs: TIWCheckBox;
    iwcbLIPContOceans: TIWCheckBox;
    iwcbLIPSizes: TIWCheckBox;
    iwcbLIPRatings: TIWCheckBox;
    iwrAllowSelectionsFrom: TIWRegion;
    IWText2: TIWText;
    iwcbOrogenies: TIWCheckBox;
    iwcbDomainTypes: TIWCheckBox;
    iwcbLIPMorphologies: TIWCheckBox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
    procedure iwbClearCheckboxesClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWStrat_dm, ServerController, IWStrat_definequery1, DB_List_Combo,
  IWStrat_uMain, IWStrat_constants, IWStrat_definedomainquery2,
  IWStrat_defineLIPquery, usrIW_dm;

{$R *.dfm}


procedure TISFDefineQuery.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.cdsContinents.Close;
  dmStrat.qContinents.Close;
  dmStrat.qContinents.SQL.Clear;
  dmStrat.qContinents.SQL.Add('SELECT * FROM CONTINENTS');
  dmStrat.qContinents.SQL.Add('WHERE CONTINENTS.HASDATA='+''''+'Y'+'''');
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if (UserSession.UnitSender = usCharts) then
  begin
    UserSession.IncludeUnitValues := false;
    UserSession.IncludeUnitRankValues := false;
    UserSession.IncludeReferenceValues := false;
    UserSession.IncludeValidationValues := false;
    UserSession.IncludeDateFromValue := false;
    UserSession.IncludeDateToValue := false;
    UserSession.IncludeSeams := false;
    UserSession.IncludeAllParentIDs := false;
    UserSession.IncludeSortFromValue := false;
    UserSession.IncludeSortToValue := false;
    UserSession.IncludeDomainValues := false;
    UserSession.IncludeDomainTypeValues := false;
    UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    UserSession.IncludeLIPValues := false;
    UserSession.IncludeSizeValues := false;
    UserSession.IncludeRatingValues := false;
    UserSession.IncludeMorphologyValues := false;
    UserSession.IncludeContOceanValues := false;
    //UserSession.IncludeUsersWhoForValues := false;
    UserSession.IncludeDepositValues := false;
    UserSession.IncludeClanValues := false;
    UserSession.IncludeCommodityValues := false;
    UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    UserSession.IncludeDepositStatusValues := false;
  end;
  if (UserSession.UnitSender = usDeposits) then
  begin
    UserSession.IncludeUnitValues := false;
    UserSession.IncludeUnitRankValues := false;
    UserSession.IncludeReferenceValues := false;
    UserSession.IncludeValidationValues := false;
    UserSession.IncludeDateFromValue := false;
    UserSession.IncludeDateToValue := false;
    UserSession.IncludeSeams := false;
    UserSession.IncludeAllParentIDs := false;
    UserSession.IncludeSortFromValue := false;
    UserSession.IncludeSortToValue := false;
    UserSession.IncludeDomainValues := false;
    UserSession.IncludeDomainTypeValues := false;
    UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    UserSession.IncludeLIPValues := false;
    UserSession.IncludeSizeValues := false;
    UserSession.IncludeRatingValues := false;
    UserSession.IncludeMorphologyValues := false;
    UserSession.IncludeContOceanValues := false;
    //UserSession.IncludeUsersWhoForValues := false;
    //UserSession.IncludeDepositValues := false;
    //UserSession.IncludeClanValues := false;
    //UserSession.IncludeCommodityValues := false;
    //UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    //UserSession.IncludeDepositStatusValues := false;
  end;
  if (UserSession.UnitSender = usDomains) then
  begin
    UserSession.IncludeUnitValues := false;
    UserSession.IncludeUnitRankValues := false;
    UserSession.IncludeReferenceValues := false;
    UserSession.IncludeValidationValues := false;
    UserSession.IncludeDateFromValue := false;
    UserSession.IncludeDateToValue := false;
    UserSession.IncludeSeams := false;
    UserSession.IncludeAllParentIDs := false;
    UserSession.IncludeSortFromValue := false;
    UserSession.IncludeSortToValue := false;
    //UserSession.IncludeDomainValues := false;
    //UserSession.IncludeDomainTypeValues := false;
    //UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    UserSession.IncludeLIPValues := false;
    UserSession.IncludeSizeValues := false;
    UserSession.IncludeRatingValues := false;
    UserSession.IncludeMorphologyValues := false;
    UserSession.IncludeContOceanValues := false;
    //UserSession.IncludeUsersWhoForValues := false;
    UserSession.IncludeDepositValues := false;
    UserSession.IncludeClanValues := false;
    UserSession.IncludeCommodityValues := false;
    UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    UserSession.IncludeDepositStatusValues := false;
  end;
  if (UserSession.UnitSender = usGraph) then
  begin
  end;
  if (UserSession.UnitSender = usLIPs) then
  begin
    UserSession.IncludeUnitValues := false;
    UserSession.IncludeUnitRankValues := false;
    UserSession.IncludeReferenceValues := false;
    UserSession.IncludeValidationValues := false;
    //UserSession.IncludeDateFromValue := false;
    //UserSession.IncludeDateToValue := false;
    UserSession.IncludeSeams := false;
    UserSession.IncludeAllParentIDs := false;
    UserSession.IncludeSortFromValue := false;
    UserSession.IncludeSortToValue := false;
    UserSession.IncludeDomainValues := false;
    UserSession.IncludeDomainTypeValues := false;
    UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    //UserSession.IncludeLIPValues := false;
    //UserSession.IncludeSizeValues := false;
    //UserSession.IncludeRatingValues := false;
    //UserSession.IncludeMorphologyValues := false;
    //UserSession.IncludeContOceanValues := false;
    //UserSession.IncludeUsersWhoForValues := false;
    UserSession.IncludeDepositValues := false;
    UserSession.IncludeClanValues := false;
    UserSession.IncludeCommodityValues := false;
    UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    UserSession.IncludeDepositStatusValues := false;
  end;
  if ((UserSession.UnitSender = usDetailsEdit) or (UserSession.UnitSender = usDetailsEdit)) then
  begin
    //UserSession.IncludeUnitValues := false;
    //UserSession.IncludeUnitRankValues := false;
    //UserSession.IncludeReferenceValues := false;
    //UserSession.IncludeValidationValues := false;
    //UserSession.IncludeDateFromValue := false;
    //UserSession.IncludeDateToValue := false;
    //UserSession.IncludeSeams := false;
    //UserSession.IncludeAllParentIDs := false;
    //UserSession.IncludeSortFromValue := false;
    //UserSession.IncludeSortToValue := false;
    UserSession.IncludeDomainValues := false;
    UserSession.IncludeDomainTypeValues := false;
    UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    UserSession.IncludeLIPValues := false;
    UserSession.IncludeSizeValues := false;
    UserSession.IncludeRatingValues := false;
    UserSession.IncludeMorphologyValues := false;
    UserSession.IncludeContOceanValues := false;
    //UserSession.IncludeUsersWhoForValues := false;
    UserSession.IncludeDepositValues := false;
    UserSession.IncludeClanValues := false;
    UserSession.IncludeCommodityValues := false;
    UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    UserSession.IncludeDepositStatusValues := false;
  end;
  if (UserSession.UnitSender = usGrainProbabilitiesDetritalUPb) then
  begin
    UserSession.IncludeUnitValues := true;
    UserSession.IncludeUnitRankValues := false;
    UserSession.IncludeReferenceValues := false;
    UserSession.IncludeValidationValues := false;
    UserSession.IncludeDateFromValue := false;
    UserSession.IncludeDateToValue := false;
    UserSession.IncludeSeams := false;
    UserSession.IncludeAllParentIDs := true;
    UserSession.IncludeSortFromValue := false;
    UserSession.IncludeSortToValue := false;
    UserSession.IncludeDomainValues := false;
    UserSession.IncludeDomainTypeValues := false;
    UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    UserSession.IncludeLIPValues := false;
    UserSession.IncludeSizeValues := false;
    UserSession.IncludeRatingValues := false;
    UserSession.IncludeMorphologyValues := false;
    UserSession.IncludeContOceanValues := false;
    UserSession.IncludeUsersWhoForValues := false;
    UserSession.IncludeDepositValues := false;
    UserSession.IncludeClanValues := false;
    UserSession.IncludeCommodityValues := false;
    UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    UserSession.IncludeDepositStatusValues := false;
  end;
  if (UserSession.UnitSender = usGrainSourcesDetritalUPb) then
  begin
    UserSession.IncludeUnitValues := true;
    UserSession.IncludeUnitRankValues := false;
    UserSession.IncludeReferenceValues := false;
    UserSession.IncludeValidationValues := false;
    UserSession.IncludeDateFromValue := false;
    UserSession.IncludeDateToValue := false;
    UserSession.IncludeSeams := false;
    UserSession.IncludeAllParentIDs := false;
    UserSession.IncludeSortFromValue := false;
    UserSession.IncludeSortToValue := false;
    UserSession.IncludeDomainValues := false;
    UserSession.IncludeDomainTypeValues := false;
    UserSession.IncludeDomainValidationValues := false;
    UserSession.IncludeOrogenyValues := false;
    UserSession.IncludePeriodValues := false;
    UserSession.IncludeLIPValues := false;
    UserSession.IncludeSizeValues := false;
    UserSession.IncludeRatingValues := false;
    UserSession.IncludeMorphologyValues := false;
    UserSession.IncludeContOceanValues := false;
    UserSession.IncludeUsersWhoForValues := false;
    UserSession.IncludeDepositValues := false;
    UserSession.IncludeClanValues := false;
    UserSession.IncludeCommodityValues := false;
    UserSession.IncludeAgeConstraintValues := false;
    UserSession.IncludeInc4ChtValues := false;
    UserSession.IncludeDepositStatusValues := false;
  end;
  iwcbUnits.Checked := UserSession.IncludeUnitValues;
  iwcbUnitRanks.Checked := UserSession.IncludeUnitRankValues;
  iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  iwcbWhoFor.Checked := UserSession.IncludeUsersWhoForValues;
  iwcbValidation.Checked := UserSession.IncludeValidationValues;
  iwcbDomains.Checked := UserSession.IncludeDomainValues;
  iwcbPeriods.Checked := UserSession.IncludePeriodValues;
  iwcbAgeConstraints.Checked := UserSession.IncludeAgeConstraintValues;
  iwcbInc4Cht.Checked := UserSession.IncludeInc4ChtValues;
  iwcbDepositClans.Checked := UserSession.IncludeClanValues;
  iwcbCommodities.Checked := UserSession.IncludeCommodityValues;
  iwcbDeposits.Checked := UserSession.IncludeDepositValues;
  iwcbDepositStatus.Checked := UserSession.IncludeDepositStatusValues;
  iwcbDomainTypes.Checked := UserSession.IncludeDomainTypeValues;
  iwcbOrogenies.Checked := UserSession.IncludeOrogenyValues;
  iwcbContinents.Checked := true;
  iwcbContinents.Visible := false;
  //dmUser.SetDeveloperData('DefineQuery before UpdateListBoxValues');
  UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  //dmUser.SetDeveloperData('DefineQuery after UpdateListBoxValues');
  iwcbLIPs.Checked := UserSession.IncludeLIPValues;
  iwcbLIPSizes.Checked := UserSession.IncludeSizeValues;
  iwcbLIPRatings.Checked := UserSession.IncludeRatingValues;
  iwcbLIPMorphologies.Checked := UserSession.IncludeMorphologyValues;
  iwcbLIPContOceans.Checked := UserSession.IncludeContOceanValues;
end;

procedure TISFDefineQuery.iwbNextStageOfQueryClick(Sender: TObject);
begin
  UserSession.IncludeContinentValues := iwcbContinents.Checked;
  UserSession.IncludeUnitValues := iwcbUnits.Checked;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  UserSession.IncludeUsersWhoForValues := iwcbWhoFor.Checked;
  UserSession.IncludeValidationValues := iwcbValidation.Checked;
  UserSession.IncludePeriodValues := iwcbPeriods.Checked;
  UserSession.IncludeAgeConstraintValues := iwcbAgeConstraints.Checked;
  UserSession.IncludeInc4ChtValues := iwcbInc4Cht.Checked;
  UserSession.IncludeDomainValues := iwcbDomains.Checked;
  UserSession.IncludeDepositValues := iwcbDeposits.Checked;
  UserSession.IncludeClanValues := iwcbDepositClans.Checked;
  UserSession.IncludeCommodityValues := iwcbCommodities.Checked;
  UserSession.IncludeDepositStatusValues := iwcbDepositStatus.Checked;
  UserSession.IncludeLIPValues := iwcbLIPs.Checked;
  UserSession.IncludeSizeValues := iwcbLIPSizes.Checked;
  UserSession.IncludeRatingValues := iwcbLIPRatings.Checked;
  UserSession.IncludeMorphologyValues := iwcbLIPMorphologies.Checked;
  UserSession.IncludeContOceanValues := iwcbLIPContOceans.Checked;
  UserSession.IncludeDomainTypeValues := iwcbDomainTypes.Checked;
  UserSession.IncludeOrogenyValues := iwcbOrogenies.Checked;
  //dmUser.SetDeveloperData('DefineQuery before GetListBoxValues');
  GetListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  //dmUser.SetDeveloperData('DefineQuery after GetListBoxValues');
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender=usDetailsEdit)
      or (UserSession.UnitSender=usDetails)
      or (UserSession.UnitSender=usGrainSourcesDetritalUPb)
      or (UserSession.UnitSender=usGrainProbabilitiesDetritalUPb))
    then TISFDefineQuery1.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usDomains))
    then TISFDefineDomainQuery2.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usLIPs))
    then TISFDefineLIPQuery.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usDeposits))
    then TISFDefineQuery1.Create(WebApplication).Show;
  end;
  //dmUser.SetDeveloperData('set definequery');
  //dmUser.InsertDeveloperData('insert definequery');
end;

procedure TISFDefineQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    //iwcbContinents.Checked := UserSession.IncludeContinentValues;
    //UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  end;
end;

function TISFDefineQuery.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.ContinentValues.Count = 0) and UserSession.IncludeContinentValues) then
  begin
    UserSession.IncludeContinentValues := true;
    Result := false;
    iwlblError.Visible := true;
  end;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFDefineQuery.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

procedure TISFDefineQuery.iwbClearCheckboxesClick(Sender: TObject);
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
  iwcbDepositClans.Checked := false;
  iwcbCommodities.Checked := false;
  iwcbDeposits.Checked := false;
  iwcbDepositStatus.Checked := false;
  iwcbLIPs.Checked := false;
  iwcbLIPSizes.Checked := false;
  iwcbLIPRatings.Checked := false;
  iwcbLIPMorphologies.Checked := false;
  iwcbLIPContOceans.Checked := false;
end;

end.
