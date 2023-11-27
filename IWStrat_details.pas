unit IWStrat_details;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWStrat_frTopBar, IWHTML40Container;

type
  TISFDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    IWLabel18: TIWLabel;
    iwDBgReference: TIWDBGrid;
    iwDBgValidation: TIWDBGrid;
    IWLabel24: TIWLabel;
    iwbObjection: TIWButton;
    iwbDetailsEdit: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    iwlFooterProgramName: TIWLabel;
    iwlFooterCopyright: TIWLabel;
    rectLeft: TIWRectangle;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel7: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWDBEdit9: TIWDBEdit;
    IWLabel12: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    IWLabel13: TIWLabel;
    iwDBgResults: TIWDBGrid;
    IWLabel14: TIWLabel;
    iwDBgSucceeding: TIWDBGrid;
    IWLabel15: TIWLabel;
    iwDBgPreceeding: TIWDBGrid;
    iwbGoToParent: TIWButton;
    iwrDateView: TIWRegion;
    IWLabel22: TIWLabel;
    iwDBgDateView: TIWDBGrid;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwrUnitDetails: TIWRegion;
    IWLabel16: TIWLabel;
    iwrSubUnits: TIWRegion;
    iwrSucceededBy: TIWRegion;
    iwrApplications: TIWRegion;
    iwrReferences: TIWRegion;
    iwrValidation: TIWRegion;
    iwrSynonyms: TIWRegion;
    IWLabel17: TIWLabel;
    iwDBgSynonyms: TIWDBGrid;
    iwDBnSynonyms: TIWDBNavigator;
    iwDBmSynonym: TIWDBMemo;
    iwrCorrelatives: TIWRegion;
    IWLabel19: TIWLabel;
    iwDBgCorrelatives: TIWDBGrid;
    iwDBnCorrelatives: TIWDBNavigator;
    iwDBmCorrelative: TIWDBMemo;
    IWLabel20: TIWLabel;
    iwlSortedBy: TIWLabel;
    iwlDVSortedBy: TIWLabel;
    iwbApplyUpdates: TIWButton;
    iwbValidate: TIWButton;
    iwbClearObjection: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwDBgGIS: TIWDBGrid;
    IWDBEdit10: TIWDBEdit;
    iwlSucceedingSortedBy: TIWLabel;
    iwlPreceedingSortedBy: TIWLabel;
    iwlSynonymsSortedBy: TIWLabel;
    iwlCorrelativesSortedBy: TIWLabel;
    iwDBnReferences: TIWDBNavigator;
    iwbDeleteRefLink: TIWButton;
    iwrLinkedApplication: TIWRegion;
    IWLabel23: TIWLabel;
    iwDBgLinkToApplications: TIWDBGrid;
    iwDBnLinkToApplications: TIWDBNavigator;
    iwbDeleteLinkToApplications: TIWButton;
    iwbAddUnitToDateView: TIWButton;
    iwrDomain: TIWRegion;
    IWLabel25: TIWLabel;
    iwDBgDomain: TIWDBGrid;
    iwDBnDomains: TIWDBNavigator;
    iwlDomainsSortedBy: TIWLabel;
    iwbDeleteDomainLink: TIWButton;
    iwbAddLinkToApplications: TIWButton;
    iwDBnPreceding: TIWDBNavigator;
    iwDBnSucceeding: TIWDBNavigator;
    IWDBNavigator3: TIWDBNavigator;
    iwDBnGISlinks: TIWDBNavigator;
    IWLabel26: TIWLabel;
    iwDBlcbRockClass: TIWDBLookupComboBox;
    iwDBlcbSetting: TIWDBLookupComboBox;
    IWLabel27: TIWLabel;
    iwbCancelUpdates: TIWButton;
    IWLabel28: TIWLabel;
    iwDBlcbPeriod: TIWDBLookupComboBox;
    iwDBlcbUnitRank: TIWDBLookupComboBox;
    iwlDatesAvailable: TIWLabel;
    IWLabel29: TIWLabel;
    iwDBlcbAgeConstraints: TIWDBLookupComboBox;
    iwDBlcbApprovalStatus: TIWDBLookupComboBox;
    IWLabel30: TIWLabel;
    iwDBeMinDVAge: TIWDBEdit;
    IWLabel31: TIWLabel;
    iwDBeMaxDVAge: TIWDBEdit;
    IWLabel32: TIWLabel;
    IWLabel33: TIWLabel;
    iwDBnSpecialFeatures: TIWDBNavigator;
    IWDBGridFeature: TIWDBGrid;
    iwbAddRefLink: TIWButton;
    iwbAddSpecialFeaturesLink: TIWButton;
    iwbAddSucceededLink: TIWButton;
    iwbAddPrecededLink: TIWButton;
    iwbAddSynonymLink: TIWButton;
    iwbAddCorrelativeLink: TIWButton;
    iwbAddDomainLink: TIWButton;
    iwbDeleteCorrelativeLink: TIWButton;
    iwbDeleteSynonymLink: TIWButton;
    iwbDeletePrecededLink: TIWButton;
    iwbDeleteSucceededLink: TIWButton;
    iwbDeleteSpecialFeaturesLink: TIWButton;
    iwbAddGISLink: TIWButton;
    iwbUpdateSortOrder: TIWButton;
    IWLabel21: TIWLabel;
    IWLabel34: TIWLabel;
    IWLabel35: TIWLabel;
    iwDBlcbSedEnv: TIWDBLookupComboBox;
    IWLabel36: TIWLabel;
    iwDBlcbCurrentDirection: TIWDBLookupComboBox;
    iwrWhoFor: TIWRegion;
    IWLabel37: TIWLabel;
    iwDBgLinkToWhFor: TIWDBGrid;
    iwDBnLinkToWhoFor: TIWDBNavigator;
    iwbDeleteLinkToUnitWhoFor: TIWButton;
    iwbAddUnitWhoFor: TIWButton;
    iwbPublish: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbObjectionClick(Sender: TObject);
    procedure iwDBgResultsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbGoToParentClick(Sender: TObject);
    procedure iwDBgResultsColumns0TitleClick(Sender: TObject);
    procedure iwDBgDateViewColumns0TitleClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbValidateClick(Sender: TObject);
    procedure iwbClearObjectionClick(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure IWDBGrid2Columns0TitleClick(Sender: TObject);
    procedure IWDBGrid3Columns0TitleClick(Sender: TObject);
    procedure IWDBGrid4Columns0TitleClick(Sender: TObject);
    procedure iwDBgGISColumns0TitleClick(Sender: TObject);
    procedure iwDBgReferenceColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbDeleteRefLinkClick(Sender: TObject);
    procedure iwDBgDomainColumns0TitleClick(Sender: TObject);
    procedure iwbDeleteLinkToApplicationsClick(Sender: TObject);
    procedure iwbAddUnitToDateViewClick(Sender: TObject);
    procedure iwbAddLinkToApplicationsClick(Sender: TObject);
    procedure iwDBgLinkToApplicationsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbDeleteDomainLinkClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbDeleteCorrelativeLinkClick(Sender: TObject);
    procedure iwbDeleteSynonymLinkClick(Sender: TObject);
    procedure iwbDeletePrecededLinkClick(Sender: TObject);
    procedure iwbDeleteSucceededLinkClick(Sender: TObject);
    procedure iwbDeleteSpecialFeaturesLinkClick(Sender: TObject);
    procedure iwbAddDomainLinkClick(Sender: TObject);
    procedure iwbAddRefLinkClick(Sender: TObject);
    procedure iwbAddCorrelativeLinkClick(Sender: TObject);
    procedure iwbAddSynonymLinkClick(Sender: TObject);
    procedure iwbAddPrecededLinkClick(Sender: TObject);
    procedure iwbAddSucceededLinkClick(Sender: TObject);
    procedure iwbAddSpecialFeaturesLinkClick(Sender: TObject);
    procedure iwDBgDomainColumns0Click(ASender: TObject; const AValue: string);
    procedure iwDBgCorrelativesColumns0Click(ASender: TObject;
      const AValue: string);
    procedure IWDBGridFeatureColumns0Click(ASender: TObject;
      const AValue: string);
    procedure iwDBnCorrelativesEdit(Sender: TObject);
    procedure iwDBnSynonymsEdit(Sender: TObject);
    procedure iwDBnPrecedingEdit(Sender: TObject);
    procedure iwDBnSucceedingEdit(Sender: TObject);
    procedure iwDBnSpecialFeaturesEdit(Sender: TObject);
    procedure iwbAddGISLinkClick(Sender: TObject);
    procedure iwDBnGISlinksEdit(Sender: TObject);
    procedure iwDBnReferencesEdit(Sender: TObject);
    procedure iwDBnDomainsEdit(Sender: TObject);
    procedure iwbUpdateSortOrderClick(Sender: TObject);
    procedure iwbAddUnitWhoForClick(Sender: TObject);
    procedure iwbDeleteLinkToUnitWhoForClick(Sender: TObject);
    procedure iwbPublishClick(Sender: TObject);
  public
    RecordValues : TStringList;
    procedure UpdateQuery2;
    procedure UpdateQuery2MinMax;
    procedure ShowHideEditButtons;
    function CheckUserHasAccess(UnitID : string; UserID : string) : boolean;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_frGrid, Graphics, IWColor,
  IWStrat_constants, IWStrat_dm, IWStrat_dmDV, IWStrat_validcheck,
  IWStrat_addlinktoapplication, usrIW_dm, IWStrat_adddomainlink,
  IWStrat_addcorrelativelink,
  IWStrat_addsynonymlink, IWStrat_addsucceedinglink, IWStrat_addprecedinglink,
  IWStrat_addspecialfeaturelink, IWStrat_addgislink, IWStrat_addreflink,
  IWStrat_refdetail;

procedure TISFDetails.IWAppFormDestroy(Sender: TObject);
begin
  dmStrat.cdsRockClasses.Close;
  dmStrat.cdsSettings.Close;
  dmStrat.cdsRanks.Close;
  dmStrat.cdsAgeConstraints.Close;
  dmStrat.cdsStatus.Close;
  dmStrat.cdsSedEnvironments.Close;
  dmStrat.cdsDirections.Close;
  //dmStrat.cdsSpecialFeatures.Close;
  dmDV.cdsQueryDV.Close;
  dmDV.cdsDVMinMax.Close;
end;

procedure TISFDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
  end;
end;

procedure TISFDetails.ShowHideEditButtons;
begin
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsBrowse]));
  iwbDetailsEdit2.Visible := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsBrowse]));
  iwbReturn.Visible := (dmStrat.cdsUnitQ.State in [dsBrowse]);
  iwbReturn2.Visible := (dmStrat.cdsUnitQ.State in [dsBrowse]);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwbGoToParent.Visible := (dmStrat.cdsUnitQPARENTID.AsInteger <> 0);
  iwbObjection.Visible := true;
  iwbValidate.Visible := UserSession.CanValidate;
  iwbClearObjection.Visible := UserSession.CanValidate;
  iwbAddUnitToDateView.Enabled := (UserSession.CanModify or UserSession.CanInsert);
  iwbUpdateSortOrder.Enabled := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsBrowse]));
  iwDBlcbRockClass.Editable := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwDBlcbSetting.Editable := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwDBlcbPeriod.Editable := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwDBlcbUnitRank.Editable := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwDBlcbSedEnv.Editable := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwDBlcbCurrentDirection.Editable := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
  iwrDateView.Visible := UserSession.LinkToDateView;
  iwDBnDomains.Enabled := (dmStrat.cdsStratDomain.State in [dsBrowse, dsEdit, dsInsert]);

  iwbAddRefLink.Enabled := UserSession.CanModify and (dmStrat.cdsRefs.State in [dsBrowse]);
  iwbDeleteRefLink.Enabled := UserSession.CanModify and (dmStrat.cdsRefs.State in [dsBrowse]) and (dmStrat.cdsRefs.RecordCount>0);
  iwbAddSpecialFeaturesLink.Enabled := UserSession.CanModify and (dmStrat.cdsUnitFeature.State in [dsBrowse]);
  iwbDeleteSpecialFeaturesLink.Enabled := UserSession.CanModify and (dmStrat.cdsUnitFeature.State in [dsBrowse]) and (dmStrat.cdsUnitFeature.RecordCount>0);
  iwbAddSucceededLink.Enabled := UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsBrowse]);
  iwbDeleteSucceededLink.Enabled := UserSession.CanModify and (dmStrat.cdsSucceeding.State in [dsBrowse]) and (dmStrat.cdsSucceeding.RecordCount>0);
  iwbAddPrecededLink.Enabled := UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsBrowse]);
  iwbDeletePrecededLink.Enabled := UserSession.CanModify and (dmStrat.cdsPreceeding.State in [dsBrowse]) and (dmStrat.cdsPreceeding.RecordCount>0);
  iwbAddSynonymLink.Enabled := UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsBrowse]);
  iwbDeleteSynonymLink.Enabled := UserSession.CanModify and (dmStrat.cdsSynonyms.State in [dsBrowse]) and (dmStrat.cdsSynonyms.RecordCount>0);
  iwbAddCorrelativeLink.Enabled := UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsBrowse]);
  iwbDeleteCorrelativeLink.Enabled := UserSession.CanModify and (dmStrat.cdsCorrelatives.State in [dsBrowse]) and (dmStrat.cdsCorrelatives.RecordCount>0);
  iwbAddDomainLink.Enabled := UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsBrowse]);
  iwbDeleteDomainLink.Enabled := UserSession.CanModify and (dmStrat.cdsStratDomain.State in [dsBrowse]) and (dmStrat.cdsStratDomain.RecordCount>0);
  iwbAddLinkToApplications.Enabled := UserSession.CanModifyPlus and (dmStrat.cdsLinkedApplications.State in [dsBrowse]);
  iwbDeleteLinkToApplications.Enabled := UserSession.CanModifyPlus and (dmStrat.cdsLinkedApplications.State in [dsBrowse]) and (dmStrat.cdsLinkedApplications.RecordCount>0);
end;

procedure TISFDetails.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsRockClasses.Close;
  dmStrat.cdsSettings.Close;
  dmStrat.cdsPeriods.Close;
  dmStrat.cdsRanks.Close;
  dmStrat.cdsStatus.Close;
  dmStrat.cdsAgeConstraints.Close;
  dmStrat.cdsSedEnvironments.Close;
  dmStrat.cdsDirections.Close;
  //dmStrat.cdsSpecialFeatures.Close;
  dmDV.cdsQueryDV.Close;
  dmDV.cdsDVMinMax.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFGrid.Create(WebApplication).Show
end;

procedure TISFDetails.iwbUpdateSortOrderClick(Sender: TObject);
var
  tmpStr : string;
begin
  dmStrat.cdsUnitQ.Edit;
  tmpStr := FormatFloat('#########0',dmStrat.cdsUnitQMINAGE.AsFloat*1.0e6);
  dmStrat.cdsUnitQAGEYEARS.AsString := tmpStr;
  try
    dmStrat.cdsUnitQ.Post;
    dmStrat.cdsUnitQ.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update value');
  end;
end;

procedure TISFDetails.iwbCancelUpdatesClick(Sender: TObject);
begin
  dmStrat.cdsUnitQ.CancelUpdates;
  ShowHideEditButtons;
end;

procedure TISFDetails.iwbDetailsEditClick(Sender: TObject);
begin
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFDetailsEdit.Create(WebApplication).Show
  dmStrat.cdsUnitRockClass.Open;
  dmStrat.cdsUnitSetting.Open;
  dmStrat.cdsUnitPeriods.Open;
  }
  dmStrat.cdsUnitQ.Edit;
  dmStrat.cdsUnitRockClass.Edit;
  dmStrat.cdsUnitSetting.Edit;
  dmStrat.cdsUnitPeriods.Edit;
  dmStrat.cdsRefs.Edit;
  dmStrat.cdsUnitFeature.Edit;
  dmStrat.cdsSynonyms.Edit;
  dmStrat.cdsCorrelatives.Edit;
  dmStrat.cdsPreceeding.Edit;
  dmStrat.cdsSucceeding.Edit;
  dmStrat.cdsLinkedApplications.Edit;
  dmStrat.cdsStratDomain.Edit;
  dmStrat.cdsUnitSedEnv.Edit;
  dmStrat.cdsUnitCurrent.Edit;
  ShowHideEditButtons;
end;

procedure TISFDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
  tmpUser : string;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'StratDB Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Database';
    if (UserSession.CanModify) then
    begin
      iwDBgSynonyms.RowCurrentColor := clWebYellow;
      iwDBgCorrelatives.RowCurrentColor := clWebYellow;
      iwDBgReference.RowCurrentColor := clWebYellow;
      iwDBgDomain.RowCurrentColor := clWebYellow;
    end else
    begin
      iwDBgSynonyms.RowCurrentColor := clNone;
      iwDBgCorrelatives.RowCurrentColor := clNone;
      iwDBgReference.RowCurrentColor := clNone;
      iwDBgDomain.RowCurrentColor := clNone;
    end;
    iwlFooterProgramName.Caption := Copyright2;
    iwlFooterCopyright.Caption := Copyright1;
    dmStrat.cdsRockClasses.Close;
    dmStrat.cdsSettings.Close;
    dmStrat.cdsPeriods.Close;
    dmStrat.cdsRanks.Close;
    dmStrat.cdsAgeConstraints.Close;
    dmStrat.cdsSedEnvironments.Close;
    dmStrat.cdsDirections.Close;
    dmStrat.cdsStatus.Close;

    dmStrat.qUnitQ.Close;
    dmStrat.cdsUnitQ.Close;
    tmpUser := UserSession.UserID;
    dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
    dmStrat.qUnitQ.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSubUnits.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSucceeding.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qPreceeding.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSynonyms.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qCorrelatives.ParamByName('USERID').AsString := tmpUser;
    dmStrat.cdsUnitQ.Open;
    //iRec := dmStrat.cdsUnitQ.RecordCount;
    iRec := 1;
    if (iRec > 0) then
    begin
      UpdateQuery2;
      //dmUser.SetDeveloperData('1');
      dmStrat.cdsRockClasses.Open;
      //dmUser.SetDeveloperData('2');
      dmStrat.cdsSettings.Open;
      //dmUser.SetDeveloperData('3');
      dmStrat.cdsPeriods.Open;
      //dmUser.SetDeveloperData('4');
      dmStrat.cdsRanks.Open;
      //dmUser.SetDeveloperData('5');
      dmStrat.cdsAgeConstraints.Open;
      //dmUser.SetDeveloperData('6');
      dmStrat.cdsSedEnvironments.Open;
      //dmUser.SetDeveloperData('7');
      dmStrat.cdsDirections.Open;
      //dmUser.SetDeveloperData('8');
      dmStrat.cdsStatus.Open;
      //dmUser.SetDeveloperData('9');
    end;
  end;
  iwbAddRefLink.Enabled := false;
  iwbDeleteRefLink.Enabled := false;
  iwbAddSpecialFeaturesLink.Enabled := false;
  iwbDeleteSpecialFeaturesLink.Enabled := false;
  iwbAddSucceededLink.Enabled := false;
  iwbDeleteSucceededLink.Enabled := false;
  iwbAddPrecededLink.Enabled := false;
  iwbDeletePrecededLink.Enabled := false;
  iwbAddSynonymLink.Enabled := false;
  iwbDeleteSynonymLink.Enabled := false;
  iwbAddCorrelativeLink.Enabled := false;
  iwbDeleteCorrelativeLink.Enabled := false;
  iwbAddDomainLink.Enabled := false;
  iwbDeleteDomainLink.Enabled := false;
  iwbAddLinkToApplications.Enabled := false;
  iwbDeleteLinkToApplications.Enabled := false;
  iwbPublish.Enabled := false;
  //iwbAddSedEnvLink.Enabled := false;
  //iwbDeleteSedEnvLink.Enabled := false;
  //iwbAddCurrentDirectionLink.Enabled := false;
  //iwbDeleteCurrentDirectionLink.Enabled := false;
  //dmUser.SetDeveloperData('10');
  if (iRec>0) then
  begin
    dmStrat.qCountPublished.Close;
    dmStrat.qCountPublished.SQL.Clear;
    dmStrat.qCountPublished.SQL.Add('SELECT COUNT(UNITFOR.WHOFORID)');
    dmStrat.qCountPublished.SQL.Add('FROM UNITFOR');
    dmStrat.qCountPublished.SQL.Add('WHERE UNITFOR.UNITID = :ID');
    dmStrat.qCountPublished.SQL.Add('AND UNITFOR.WHOFORID='+''''+'PUBL'+'''');
    dmStrat.qCountPublished.ParamByName('ID').AsString := UserSession.RecordChosen;
    dmStrat.cdsCountPublished.Close;
    //dmStrat.cdsCountPublished.Open;
    //dmUser.SetDeveloperData('11');
    //if ((UserSession.CanModify) and (dmStrat.cdsCountPublishedCOUNT.AsInteger < 1)) then
    //begin
      iwbPublish.Enabled := true;
    //end;
    ShowHideEditButtons;
    //dmUser.SetDeveloperData('12');
  end else
  begin
    WebApplication.ShowMessage('This record has restricted access');
  end;
end;

procedure TISFDetails.iwbObjectionClick(Sender: TObject);
begin
  UserSession.UnitSender := usDetails;
  UserSession.RecordChosen := dmStrat.cdsUnitQUNITID.AsString;
  dmStrat.qValidFull.Close;
  dmStrat.qValidFull.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.cdsValidFull.Close;
  dmStrat.cdsValidFull.Open;
  dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
  dmStrat.cdsValidFull.Filtered := true;
  if (dmStrat.cdsValidFull.RecordCount = 0) then
  begin
    dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsValidFull.Filtered := true;
    if (dmStrat.cdsValidFull.RecordCount = 0) then
    begin
      dmStrat.cdsValidFull.Append;
      dmStrat.cdsValidFullUNITID.AsString := UserSession.RecordChosen;
      dmStrat.cdsValidFullVALIDSTATUSID.AsString := 'Check';
      dmStrat.cdsValidFullDATEDONE.AsDateTime := Now;
      dmStrat.cdsValidFullDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsValidFullCOMMENTS.AsString := ' ';
      dmStrat.cdsValidFull.Post;
    end;
    dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsValidFull.Filtered := true;
    dmStrat.cdsValidFull.Edit;
    dmStrat.cdsValidFullUNITID.AsString := UserSession.RecordChosen;
    dmStrat.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmStrat.cdsValidFullDATEDONE.AsDateTime := Now;
    dmStrat.cdsValidFullDONEBY.AsString := UserSession.UserID;
    dmStrat.cdsValidFullCOMMENTS.AsString := ' ';
    dmStrat.cdsValidFull.Post;
  end else
  begin
    dmStrat.cdsValidFull.Edit;
    dmStrat.cdsValidFullUNITID.AsString := UserSession.RecordChosen;
    dmStrat.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmStrat.cdsValidFullDATEDONE.AsDateTime := Now;
    dmStrat.cdsValidFull.Post;
    dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsValidFull.Filtered := true;
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFValidCheck.Create(WebApplication).Show;
end;

procedure TISFDetails.iwbPublishClick(Sender: TObject);
begin
  try
    dmStrat.cdsUnitFor.Append;
    dmStrat.cdsUnitForUNITID.AsString := UserSession.RecordChosen;
    dmStrat.cdsUnitForWHOFORID.AsString := ValueForPublished;
    dmStrat.cdsUnitFor.Post;
    dmStrat.cdsUnitFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('not able to Publish this record');
  end;
end;

procedure TISFDetails.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  if CheckUserHasAccess(Trim(AValue),UserSession.UserID) then
  begin
    UserSession.RecordChosen := Trim(AValue);
    UpdateQuery2;
    ShowHideEditButtons;
    UserSession.ParameterChosen := Trim(AValue);
  end else
  begin
    WebApplication.ShowMessage('Access to this record is restricted');
  end;
end;

function TISFDetails.CheckUserHasAccess(UnitID : string; UserID : string) : boolean;
begin
  dmStrat.qUserUnitAccess.Close;
  dmStrat.cdsUserUnitAccess.Close;
  dmStrat.qUserUnitAccess.ParamByName('UserID').AsString := UserID;
  dmStrat.qUserUnitAccess.ParamByName('UnitID').AsString := UnitID;
  Result := true;
  try
    dmStrat.cdsUserUnitAccess.Open;
    if (dmStrat.cdsUserUnitAccess.RecordCount > 0) then  Result := true
    else Result := false;
  except
    Result := false;
  end;
end;

procedure TISFDetails.iwbGoToParentClick(Sender: TObject);
begin
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  UserSession.ParameterChosen := dmStrat.cdsUnitQPARENTID.AsString;
  UserSession.RecordChosen := Trim(dmStrat.cdsUnitQPARENTID.AsString);
  if (UserSession.RecordChosen <> '0') then
  begin
    {
    dmStrat.qUnitQ.Close;
    dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
    }
    UpdateQuery2;
  end;
end;

procedure TISFDetails.iwDBgResultsColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSubUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.UpdateQuery2;
var
  i, iRec, iRec1, iRec2 : integer;
  tmpUnitID : integer;
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  try
    dmDV.cdsQueryDV.Close;
    dmDV.cdsDVMinMax.Close;
  except
  end;
  dmStrat.qUnitQ.Close;
  dmStrat.cdsUnitQ.Close;
  dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.qUnitQ.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSubUnits.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSucceeding.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qPreceeding.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSynonyms.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qCorrelatives.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsUnitQ.Open;
  iRec := 0;

  if (UserSession.LinkToDateView) then
  begin
    UserSession.UnitSender := usDetails;
    iRec1 := 0;
    iRec1 := dmStrat.cdsSynonyms.RecordCount;
    iRec2 := 0;
    iRec2 := dmStrat.cdsCorrelatives.RecordCount;
    iRec := iRec1 + iRec2;
    tmpUnitID := dmStrat.cdsUnitQUNITID.AsInteger;
    try
      if (iRec > 0) then
      begin
        RecordValues := TStringList.Create;
        RecordValues.Clear;
      end;
      if (iRec1 > 0) then
      begin
        dmStrat.cdsSynonyms.First;
        repeat
          RecordValues.Add(dmStrat.cdsSynonymsSYNONYMID.AsString);
          dmStrat.cdsSynonyms.Next;
        until dmStrat.cdsSynonyms.Eof;
        dmStrat.cdsSynonyms.First;
      end;
      if (iRec2 > 0) then
      begin
        dmStrat.cdsCorrelatives.First;
        repeat
          RecordValues.Add(dmStrat.cdsCorrelativesCORRELATIVEID.AsString);
          dmStrat.cdsCorrelatives.Next;
        until dmStrat.cdsCorrelatives.Eof;
        dmStrat.cdsCorrelatives.First;
      end;

      dmDV.QueryDV.Close;
      dmDV.QueryDV.SQL.Clear;
      dmDV.QueryDV.SQL.Add('SELECT DISTINCT SUITE.GISID, ISORGR30.COUNTRYABR, SUITE.UNITID, SUITE.UNITNAME,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.TECHABR,TECHNIQUE.TECHNIQUE,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.INTERPABR,ISORGR30.IAGE,ISORGR30.IAGEPERROR,ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.LITHOLOGY,ISORGR30.RECORDID,COUNTRY.COUNTRY,MATERIAL.MATERIALDESCRIPTION,');
      dmDV.QueryDV.SQL.Add('  INTERPRETATION.INTERPRETATION,APPROACH.APPROACHDESCRIPTION,ISOSYSTEM.ISOSYSTEMNAME,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
      dmDV.QueryDV.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,ISOSYSTEM,ISOFOR,TECHNIQUE, ');
      dmDV.QueryDV.SQL.Add('  SUITE,SUITECOUNTRY,USERSWHOFOR');
      dmDV.QueryDV.SQL.Add('WHERE  USERSWHOFOR.USERID = :UserID');
      dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID');
      dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      //if not UserSession.IsDeveloper then dmDV.QueryDV.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.TECHABR = TECHNIQUE.TECHABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.PREFLEVEL >= 1');
      dmDV.QueryDV.SQL.Add('AND SUITE.UNITID=SUITECOUNTRY.UNITID');
      dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.UNITID=ISORGR30.UNITID');
      dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.COUNTRYABR=ISORGR30.COUNTRYABR');
      dmDV.QueryDV.SQL.Add('AND (SUITE.GISID='+IntToStr(tmpUnitID));
      if (iRec > 0) then
      begin
        dmDV.QueryDV.SQL.Add('OR SUITE.GISID = '+RecordValues.Strings[0]);
        if (iRec > 1) then
        begin
          for i := 2 to iRec do
          begin
            dmDV.QueryDV.SQL.Add('OR SUITE.GISID = '+RecordValues.Strings[i-1]);
          end;
        end;
      end;
      dmDV.QueryDV.SQL.Add('  OR SUITE.PARENTID='+IntToStr(tmpUnitID)+')');
      dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPGROUP=2');
      dmDV.QUERYDV.SQL.ADD('ORDER BY ISORGR30.RAGE,SUITE.UNITNAME,ISORGR30.MATERIALABR,');
      dmDV.QUERYDV.SQL.ADD('  ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,');
      dmDV.QUERYDV.SQL.ADD('  ISORGR30.PREFLEVEL');

      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmDV.QueryDV.SQL.Text);
      end;

      dmDV.cdsQueryDV.Close;
      dmDV.QueryDV.ParamByName('UserID').AsString := UserSession.UserID;
      dmDV.cdsQueryDV.Open;
      //dmDV.qDVMinMax.ParamByName('UserID').AsString := UserSession.UserID;
      //dmDV.cdsDVMinMax.Open;
      iRec := 0;
      iRec := dmDV.cdsQueryDV.RecordCount;
    finally
      FreeAndNil(RecordValues);
    end;
  end;
  //dmUser.SetDeveloperData('before UpdateQuery2MinMax');
  if (iRec <= 0) then
  begin
    dmDV.cdsQueryDV.Close;
    iwDBgDateView.Visible := false;
    iwlDVSortedBy.Visible := false;
    iwlDatesAvailable.Visible := false;
    iwrDateView.Visible := false;
    iwDBeMinDVAge.Visible := false;
    iwDBeMaxDVAge.Visible := false;
  end else
  begin
    iwDBgDateView.Visible := true;
    iwlDVSortedBy.Visible := true;
    iwlDatesAvailable.Visible := true;
    iwDBeMinDVAge.Visible := true;
    iwDBeMaxDVAge.Visible := true;
    iwrDateView.Visible := UserSession.LinkToDateView;
    UpdateQuery2MinMax;
  end;
  //dmUser.SetDeveloperData('after UpdateQuery2MinMax');
end;

procedure TISFDetails.UpdateQuery2MinMax;
var
  i, iRec, iRec1, iRec2 : integer;
  tmpUnitID : integer;
begin
  iRec := 0;
  //dmStrat.qUnitQ.Close;
  //dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  //dmStrat.cdsUnitQ.Close;
  //dmStrat.cdsUnitQ.Open;
  if (UserSession.LinkToDateView) then
  begin
    iRec1 := 0;
    iRec1 := dmStrat.cdsSynonyms.RecordCount;
    iRec2 := 0;
    iRec2 := dmStrat.cdsCorrelatives.RecordCount;
    iRec := iRec1 + iRec2;
    //if (iRec > 0) then
    //begin
    //  RecordValues := TStringList.Create;
    //  RecordValues.Clear;
    //end;
    RecordValues := TStringList.Create;
    try
      RecordValues.Clear;
      if (iRec1 > 0) then
      begin
        dmStrat.cdsSynonyms.First;
        repeat
          RecordValues.Add(dmStrat.cdsSynonymsSYNONYMID.AsString);
          dmStrat.cdsSynonyms.Next;
        until dmStrat.cdsSynonyms.Eof;
        dmStrat.cdsSynonyms.First;
      end;
      if (iRec2 > 0) then
      begin
        dmStrat.cdsCorrelatives.First;
        repeat
          RecordValues.Add(dmStrat.cdsCorrelativesCORRELATIVEID.AsString);
          dmStrat.cdsCorrelatives.Next;
        until dmStrat.cdsCorrelatives.Eof;
        dmStrat.cdsCorrelatives.First;
      end;
      dmDV.cdsDVMinMax.Close;
      dmDV.qDVMinMax.Close;
      dmDV.qDVMinMax.SQL.Clear;
      dmDV.qDVMinMax.SQL.Add('SELECT MIN(1.0*(ISORGR30.rage-isorgr30.ragemerror)) as MinAge, ');
      dmDV.qDVMinMax.SQL.Add('MAX(1.0*(isorgr30.rage+isorgr30.rageperror)) as MaxAge ');
      dmDV.qDVMinMax.SQL.Add('from USERSWHOFOR,ISORGR30,SUITE,INTERPRETATION,ISOFOR ');
      dmDV.qDVMinMax.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID');
      dmDV.qDVMinMax.SQL.Add('AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID');
      dmDV.qDVMinMax.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      dmDV.qDVMinMax.SQL.Add('AND SUITE.UNITID=ISORGR30.UNITID');
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPABR = ISORGR30.INTERPABR');
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPGROUP=2');
      dmDV.qDVMinMax.SQL.Add('AND ISORGR30.PREFLEVEL >= '+''''+'1'+'''');
      //dmDV.qDVMinMax.SQL.Add('AND (SUITE.GISID='+UserSession.RecordChosen+' or SUITE.parentid='+UserSession.RecordChosen+')');
      dmDV.qDVMinMax.SQL.Add('AND (SUITE.GISID='+UserSession.RecordChosen);
      if (iRec > 0) then
      begin
        dmDV.qDVMinMax.SQL.Add('OR SUITE.GISID = '+RecordValues.Strings[0]);
        if (iRec > 1) then
        begin
          for i := 2 to iRec do
          begin
            dmDV.qDVMinMax.SQL.Add('OR SUITE.GISID = '+RecordValues.Strings[i-1]);
          end;
        end;
      end;
      dmDV.qDVMinMax.SQL.Add('  OR SUITE.PARENTID='+UserSession.RecordChosen+')');
      //if not UserSession.IsDeveloper then dmDV.qDVMinMax.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
    finally
      FreeAndNil(RecordValues);
    end;

    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmDV.qDVMinMax.SQL.Text);
    end;

    dmDV.cdsDVMinMaxMINAGE.DisplayFormat := '###0.00';
    dmDV.cdsDVMinMaxMAXAGE.DisplayFormat := '###0.00';
    dmDV.cdsDVMinMax.Close;
    dmDV.qDVMinMax.Close;
    dmDV.qDVMinMax.ParamByName('UserID').AsString := UserSession.UserID;
    //dmUser.SetDeveloperData('before open UpdateQuery2MinMax');
    //try
      dmDV.cdsDVMinMax.Open;
    //except
    //end;
    //dmUser.SetDeveloperData('after open UpdateQuery2MinMax 1');
  end;
end;

procedure TISFDetails.iwDBgCorrelativesColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.RecordChosen := Trim(AValue);
  UpdateQuery2;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFDetails.iwDBgDateViewColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsQueryDV.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDVSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.iwbApplyUpdatesClick(Sender: TObject);
var
  tmpChange : integer;
  tmpUser : string;
begin
  tmpChange := 0;
  if (dmStrat.cdsUnitRockClassROCKCLASSID.AsString = 'P') then tmpChange := 1;
  if (dmStrat.cdsUnitRockClassROCKCLASSID.AsString = 'V') then tmpChange := 1;
  if (dmStrat.cdsUnitRockClassROCKCLASSID.AsString = 'H') then tmpChange := 1;
  if (tmpChange=1) then
  begin
    dmStrat.cdsUnitSedEnvDEPOSITIONENVIRONMENTID.AsString := 'Z';
    dmStrat.cdsUnitCurrentCURRENTDIRECTION.AsInteger := 362;
  end;
  try
    dmStrat.cdsUnitQ.ApplyUpdates(0);
    dmStrat.qParent.Close;
    tmpUser := UserSession.UserID;
    dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
    dmStrat.cdsParent.Close;
    dmStrat.cdsParent.Open;
  except
    WebApplication.ShowMessage('Not able to update UnitQ record');
  end;
  try
    dmStrat.cdsUnitRockClass.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update UnitRockClass record');
  end;
  try
    dmStrat.cdsUnitSetting.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update UnitSetting record');
  end;
  try
    dmStrat.cdsUnitPeriods.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update UnitPeriods record');
  end;
  try
    dmStrat.cdsUnitSedEnv.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update UnitSedEnv record');
  end;
  try
    dmStrat.cdsUnitCurrent.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update UnitCurrent record');
  end;
  {
  try
    dmStrat.cdsUnitQ.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update record');
  end;
  }
  ShowHideEditButtons;
end;

procedure TISFDetails.iwbValidateClick(Sender: TObject);
var
  HasValidityRecord : boolean;
begin
  UserSession.UnitSender := usDetails;
  HasValidityRecord := false;
  dmStrat.cdsValid.Filter := 'ValidStatusID='+''''+'Valid'+'''';
  dmStrat.cdsValid.Filtered := true;
  if (dmStrat.cdsValid.RecordCount = 1) then
  begin
    HasValidityRecord := true;
  end;
  if (not HasValidityRecord) then
  begin
    dmStrat.cdsValid.Filter := 'ValidStatusID='+''''+'NotYt'+'''';
    dmStrat.cdsValid.Filtered := true;
    if (dmStrat.cdsValid.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmStrat.cdsValid.Edit;
      dmStrat.cdsValidVALIDSTATUSID.AsString := 'Valid';
      dmStrat.cdsValidDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsValidDATEDONE.AsDateTime := Now;
      dmStrat.cdsValid.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmStrat.cdsValid.Append;
      dmStrat.cdsValidUNITID.AsString := dmStrat.cdsUnitQUNITID.AsString;
      dmStrat.cdsValidVALIDSTATUSID.AsString := 'Valid';
      dmStrat.cdsValidDATEDONE.AsDateTime := Now;
      dmStrat.cdsValidDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsValidFullCOMMENTS.AsString := ' ';
      dmStrat.cdsValid.Post;
    end;
    try
      dmStrat.cdsValid.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update validation status');
    end;
  end;
  dmStrat.cdsValid.Filtered := false;
  dmStrat.cdsUnitQ.Close;
  dmStrat.cdsUnitQ.Open;
end;

procedure TISFDetails.iwbClearObjectionClick(Sender: TObject);
begin
  UserSession.UnitSender := usDetails;
  UserSession.RecordChosen := dmStrat.cdsUnitQUNITID.AsString;
  dmStrat.qValidFull.Close;
  dmStrat.qValidFull.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.cdsValidFull.Close;
  dmStrat.cdsValidFull.Open;
  dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmStrat.cdsValidFull.Filtered := true;
  if (dmStrat.cdsValidFull.RecordCount > 0) then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFValidCheck.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('No objection to clear');
  end;
end;

procedure TISFDetails.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSucceeding.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSucceedingSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.IWDBGrid2Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsPreceeding.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlPreceedingSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.IWDBGrid3Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSynonyms.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSynonymsSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.IWDBGrid4Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsCorrelatives.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlCorrelativesSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.IWDBGridFeatureColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.ParameterChosen := Trim(AValue);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddSpecialFeatureLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnGISlinksEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddGISLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnSpecialFeaturesEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddSpecialFeatureLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnPrecedingEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddPrecedingLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnReferencesEdit(Sender: TObject);
begin
  UserSession.UnitSender := usDetails;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddRefLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnCorrelativesEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddCorrelativeLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnDomainsEdit(Sender: TObject);
begin
  UserSession.ParameterChosen := dmStrat.cdsUnitQUNITID.AsString;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddDomainLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnSucceedingEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddSucceedingLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBnSynonymsEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddSynonymLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBgGISColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsStratMaps.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  {
  iwlCorrelativesSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
  }
end;

procedure TISFDetails.iwDBgReferenceColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := dmStrat.cdsUnitQUNITID.AsString;
  UserSession.UnitSender := usDetails;
  UserSession.ParameterChosen := Trim(AValue);
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFRefDetails.Create(WebApplication).Show;
end;

procedure TISFDetails.iwbDeleteRefLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteRefRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end;
end;

procedure TISFDetails.iwbDeleteSpecialFeaturesLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteSpecialFeatureLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDetails.iwbDeleteSucceededLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteSucceedingLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDetails.iwbDeleteSynonymLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteSynonymLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDetails.iwDBgDomainColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.ParameterChosen := Trim(AValue);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddDomainLink.Create(WebApplication).Show;
end;

procedure TISFDetails.iwDBgDomainColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsStratDomain.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDomainsSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.iwbDeleteLinkToApplicationsClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteLinkToApplicationRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDetails.iwbDeleteLinkToUnitWhoForClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  {
  dmStrat.DeleteUnitWhoForLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
  }
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFDetails.iwbDeletePrecededLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeletePrecedingLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDetails.iwbAddUnitToDateViewClick(Sender: TObject);
var
  tmpUnitName, tmpUnitRankID, tmpGISID, tmpCountryID : string;
begin
  tmpUnitName := dmStrat.cdsUnitQUNITNAME.AsString;
  tmpUnitRankID := dmStrat.cdsUnitQRANKID.AsString;
  tmpGISID := dmStrat.cdsUnitQUNITID.AsString;
  tmpCountryID := dmStrat.cdsUnitQCOUNTRYID.AsString;
  dmDV.AddUnitToDV(tmpUnitName,tmpUnitRankID,tmpGISID,tmpCountryID);
end;

procedure TISFDetails.iwbAddUnitWhoForClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  {
  WasSuccessful := false;
  mStrat.InsertCorrelativeLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddUnitWhoForLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
  }
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFDetails.iwbAddCorrelativeLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertCorrelativeLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddCorrelativeLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddDomainLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertDomainLink(WasSuccessful);
  if WasSuccessful then
  begin
    UserSession.ParameterChosen := dmStrat.cdsUnitQUNITID.AsString;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddDomainLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddGISLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertGISLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddGISLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddLinkToApplicationsClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertApplicationLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddLinkToApplication.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddPrecededLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertPrecedingLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddPrecedingLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddRefLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  UserSession.UnitSender := usDetails;
  WasSuccessful := false;
  dmStrat.InsertReferenceLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddRefLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddSpecialFeaturesLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertSpecialFeatureLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddSpecialFeatureLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddSucceededLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertSucceedingLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddSucceedingLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwbAddSynonymLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertSynonymLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddSynonymLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDetails.iwDBgLinkToApplicationsColumns0Click(
  ASender: TObject; const AValue: String);
begin
  if UserSession.IsDeveloper then
  begin
    dmStrat.cdsLinkedApplications.Locate('ApplicationID',AValue,[]);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddLinkToApplication.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Option not available');
  end;
end;

procedure TISFDetails.iwbDeleteCorrelativeLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteCorrelativeLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDetails.iwbDeleteDomainLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteDomainRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUnitQ.Close;
    dmStrat.cdsUnitQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

end.

