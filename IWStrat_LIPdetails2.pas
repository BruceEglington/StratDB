unit IWStrat_LIPdetails2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWStrat_frTopBar;

type
  TISFLIPDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel3: TIWLabel;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    IWLabel18: TIWLabel;
    iwDBgReference: TIWDBGrid;
    iwDBgValidation: TIWDBGrid;
    IWLabel24: TIWLabel;
    iwbQueryValidationStatus: TIWButton;
    iwbDetailsEdit: TIWButton;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    rectLeft: TIWRectangle;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWLabel12: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    iwDBgResults: TIWDBGrid;
    iwbGoToParent: TIWButton;
    iwrDateView: TIWRegion;
    IWLabel22: TIWLabel;
    iwDBgDateView: TIWDBGrid;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwrUnitDetails: TIWRegion;
    iwrSubUnits: TIWRegion;
    iwrReferences: TIWRegion;
    iwrValidation: TIWRegion;
    iwlSortedBy: TIWLabel;
    iwlDVSortedBy: TIWLabel;
    iwbApplyUpdates: TIWButton;
    iwbValidate: TIWButton;
    iwbChecked: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwDBnReferences: TIWDBNavigator;
    iwbDeleteRefLink: TIWButton;
    iwbAddLIPToDateView: TIWButton;
    iwDBnSubEvents: TIWDBNavigator;
    IWLabel26: TIWLabel;
    iwDBlcbSize: TIWDBLookupComboBox;
    iwDBlcbRating: TIWDBLookupComboBox;
    IWLabel27: TIWLabel;
    iwbCancelUpdates: TIWButton;
    IWLabel28: TIWLabel;
    iwDBlcbComposition: TIWDBLookupComboBox;
    iwlDatesAvailable: TIWLabel;
    IWLabel29: TIWLabel;
    iwDBlcbAgeConstraints: TIWDBLookupComboBox;
    IWLabel30: TIWLabel;
    iwDBeMinDVAge: TIWDBEdit;
    IWLabel31: TIWLabel;
    iwDBeMaxDVAge: TIWDBEdit;
    IWLabel32: TIWLabel;
    iwrDomains: TIWRegion;
    IWLabel4: TIWLabel;
    iwDBgDomains: TIWDBGrid;
    iwlSortedByDomain: TIWLabel;
    iwDBnDomains: TIWDBNavigator;
    iwbLinkUnitsToParentDomain: TIWButton;
    IWLabel13: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel14: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    IWLabel15: TIWLabel;
    IWLabel17: TIWLabel;
    IWLabel19: TIWLabel;
    iwDBlcbContOcean: TIWDBLookupComboBox;
    TopBar: TISFTopBarStrat;
    iwrWhoFor: TIWRegion;
    IWLabel37: TIWLabel;
    iwDBgLinkToWhFor: TIWDBGrid;
    iwDBnLinkToWhoFor: TIWDBNavigator;
    iwbDeleteLinkToWhoFor: TIWButton;
    iwbAddWhoFor: TIWButton;
    IWLabel16: TIWLabel;
    iwDBlcbContinent: TIWDBLookupComboBox;
    iwbAddRefLink: TIWButton;
    iwrStratUnits: TIWRegion;
    IWLabel20: TIWLabel;
    IWDBGrid2: TIWDBGrid;
    iwlSortedByUnits: TIWLabel;
    iwDBnStratUnits: TIWDBNavigator;
    IWButton1: TIWButton;
    iwbAddLIPDomainLink: TIWButton;
    iwbAddLIPUnitLink: TIWButton;
    iwbPublish: TIWButton;
    IWLabel7: TIWLabel;
    IWDBEdit9: TIWDBEdit;
    iwbCalculateBarcodeAge: TIWButton;
    IWLabel21: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    iwrMorphology: TIWRegion;
    IWLabel23: TIWLabel;
    IWDBGrid1: TIWDBGrid;
    IWLabel25: TIWLabel;
    iwDBnMorphology: TIWDBNavigator;
    iwbAddMorphologyLink: TIWButton;
    IWLabel2: TIWLabel;
    iwDBlcbPlotBarcode: TIWDBLookupComboBox;
    iwrGIS: TIWRegion;
    IWLabel33: TIWLabel;
    IWDBGrid3: TIWDBGrid;
    iwDBnLinkToGIS: TIWDBNavigator;
    iwbDeleteGISLink: TIWButton;
    iwbAddGISLink: TIWButton;
    iwlRefSortedBy: TIWLabel;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbQueryValidationStatusClick(Sender: TObject);
    procedure iwDBgResultsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbGoToParentClick(Sender: TObject);
    procedure iwDBgResultsColumns0TitleClick(Sender: TObject);
    procedure iwDBgDateViewColumns0TitleClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbValidateClick(Sender: TObject);
    procedure iwbCheckedClick(Sender: TObject);
    procedure iwDBgReferenceColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbDeleteRefLinkClick(Sender: TObject);
    procedure iwbAddLIPToDateViewClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbLinkUnitsToParentDomainClick(Sender: TObject);
    procedure iwbAddRefLinkClick(Sender: TObject);
    procedure iwbAddWhoForClick(Sender: TObject);
    procedure iwbDeleteLinkToWhoForClick(Sender: TObject);
    procedure iwbAddLIPDomainLinkClick(Sender: TObject);
    procedure iwDBnDomainsEdit(Sender: TObject);
    procedure iwbAddLIPUnitLinkClick(Sender: TObject);
    procedure iwDBnStratUnitsEdit(Sender: TObject);
    procedure iwDBgDomainsColumns0TitleClick(Sender: TObject);
    procedure IWDBGrid2Columns0TitleClick(Sender: TObject);
    procedure iwbPublishClick(Sender: TObject);
    procedure iwbCalculateBarcodeAgeClick(Sender: TObject);
    procedure iwDBnLinkToWhoForEdit(Sender: TObject);
    procedure iwDBnReferencesEdit(Sender: TObject);
    procedure iwDBnMorphologyEdit(Sender: TObject);
    procedure iwbAddMorphologyLinkClick(Sender: TObject);
    procedure iwbAddGISLinkClick(Sender: TObject);
    procedure iwbDeleteGISLinkClick(Sender: TObject);
    procedure iwDBnLinkToGISEdit(Sender: TObject);
    procedure iwDBgReferenceColumns0TitleClick(Sender: TObject);
  public
    RecordValues : TStringList;
    procedure UpdateQuery2;
    procedure UpdateQuery2MinMax;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_frGrid, Graphics, IWColor,
  IWStrat_constants, IWStrat_dmDV, IWStrat_validcheck,
  IWStrat_addlinktoapplication, usrIW_dm, IWStrat_dmLIP, IWStrat_dm,
  IWStrat_frLIPGrid, IWStrat_addlipdomainlink, IWStrat_addlipunitlink,
  IWStrat_addlipmorphologylink;

procedure TISFLIPDetails.IWAppFormDestroy(Sender: TObject);
begin
  dmLIP.cdsLIPSizes.Close;
  dmLIP.cdsLIPRatings.Close;
  dmLIP.cdsCompositions.Close;
  dmLIP.cdsContOceans.Close;
  dmStrat.cdsAgeConstraints.Close;
  dmDV.cdsQueryDV.Close;
  dmDV.cdsDVMinMax.Close;
  dmStrat.cdsYesNo.Close;
  dmStrat.cdsContinents.Close;
end;

procedure TISFLIPDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwbGoToParent.Visible := (dmLIP.cdsLIPQLIPPARENTID.AsInteger <> 0);
  iwDBlcbSize.Editable := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwDBlcbRating.Editable := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwDBlcbContinent.Editable := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwDBlcbContOcean.Editable := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwDBlcbComposition.Editable := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
  iwDBlcbPlotBarcode.Editable := (UserSession.CanModify and (dmLIP.cdsLIPQ.State in [dsEdit]));
end;

procedure TISFLIPDetails.iwbReturnClick(Sender: TObject);
begin
  dmLIP.cdsLIPSizes.Close;
  dmLIP.cdsLIPRatings.Close;
  dmLIP.cdsCompositions.Close;
  dmStrat.cdsAgeConstraints.Close;
  dmLIP.cdsContOceans.Close;
  dmStrat.cdsContinents.Close;
  dmDV.cdsQueryDV.Close;
  dmDV.cdsDVMinMax.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLIPGrid.Create(WebApplication).Show
end;

procedure TISFLIPDetails.iwbCalculateBarcodeAgeClick(Sender: TObject);
var
  tBarcodeAge : double;
begin
  dmDV.qDVUser.Close;
  dmDV.qDVUser.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.cdsDVUser.Close;
  dmDV.cdsDVUser.Open;
  try
    if (dmDV.cdsDVUser.RecordCount < 1) then dmDV.AddUserToDV(UserSession.UserID);
  except
    WebApplication.ShowMessage('Not able to add user to DateView');
  end;
  tBarCodeAge := dmDV.CalculateDVMedian;
  if (tBarCodeAge <> dmLIP.cdsLIPQBARCODEAGE.AsFloat)  then
  begin
    try
    dmLIP.cdsLIPQ.Edit;
    dmLIP.cdsLIPQBARCODEAGE.AsFloat := tBarCodeAge;
    dmLIP.cdsLIPQ.Post;
    dmLIP.cdsLIPQ.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update Barcode Age');
    end;
  end;
end;

procedure TISFLIPDetails.iwbCancelUpdatesClick(Sender: TObject);
begin
  dmLIP.cdsLIPQ.CancelUpdates;
end;

procedure TISFLIPDetails.iwbDetailsEditClick(Sender: TObject);
begin
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFDetailsEdit.Create(WebApplication).Show
  dmLIP.cdsUnitRockClass.Open;
  dmLIP.cdsUnitSetting.Open;
  dmLIP.cdsUnitPeriods.Open;
  }
  dmLIP.cdsLIPQ.Edit;
  dmLIP.cdsLIPParent.Edit;
  dmLIP.cdsLIPForm.Edit;
  dmLIP.cdsLIPComposition.Edit;
  dmLIP.cdsLIPDescription.Edit;
end;

procedure TISFLIPDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'StratDB Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Database';
    iwrDateView.Visible := UserSession.LinkToDateView;
    iwbDetailsEdit.Visible := UserSession.CanModify;
    iwbDetailsEdit2.Visible := UserSession.CanModify;
    iwbValidate.Visible := UserSession.CanValidate;
    iwbApplyUpdates.Visible := false;
    iwbAddRefLink.Visible := UserSession.CanModify;
    iwbDeleteRefLink.Visible := UserSession.CanModify;
    iwDBnReferences.Visible := UserSession.CanModify;
    iwbAddWhoFor.Visible := UserSession.CanModify;
    iwbDeleteLinkToWhoFor.Visible := UserSession.CanModify;
    iwbAddMorphologyLink.Visible := UserSession.CanModify;
    //iwbAddLIPToDateView.Visible := UserSession.IsDeveloper;
    if (UserSession.CanModify) then
    begin
      iwDBgReference.RowCurrentColor := clWebYellow;
    end else
    begin
      iwDBgReference.RowCurrentColor := clNone;
    end;
    dmLIP.cdsLIPSizes.Close;
    dmLIP.cdsLIPRatings.Close;
    dmLIP.cdsCompositions.Close;
    dmStrat.cdsAgeConstraints.Close;
    dmLIP.cdsContOceans.Close;
    dmStrat.cdsContinents.Close;
    dmStrat.cdsYesNo.Close;
    UpdateQuery2;
    dmLIP.cdsLIPSizes.Open;
    dmLIP.cdsLIPRatings.Open;
    dmLIP.cdsCompositions.Open;
    dmStrat.cdsAgeConstraints.Open;
    dmLIP.cdsContOceans.Open;
    dmStrat.cdsContinents.Open;
    dmStrat.cdsYesNo.Open;
  end;
end;

procedure TISFLIPDetails.iwbQueryValidationStatusClick(Sender: TObject);
begin
  UserSession.RecordChosen := dmLIP.cdsLIPQLIPID.AsString;
  dmLIP.qValidFull.Close;
  dmLIP.qValidFull.ParamByName('LIPID').AsString := UserSession.RecordChosen;
  dmLIP.cdsValidFull.Close;
  dmLIP.cdsValidFull.Open;
  dmLIP.cdsValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
  dmLIP.cdsValidFull.Filtered := true;
  if (dmLIP.cdsValidFull.RecordCount = 0) then
  begin
    dmLIP.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmLIP.cdsValidFull.Filtered := true;
    if (dmLIP.cdsValidFull.RecordCount = 0) then
    begin
      dmLIP.cdsValidFull.Append;
      dmLIP.cdsValidFullLIPID.AsString := UserSession.RecordChosen;
      dmLIP.cdsValidFullVALIDSTATUSID.AsString := 'Check';
      dmLIP.cdsValidFullDATEDONE.AsDateTime := Now;
      dmLIP.cdsValidFullDONEBY.AsString := UserSession.UserID;
      dmLIP.cdsValidFullCOMMENTS.AsString := ' ';
      dmLIP.cdsValidFull.Post;
    end;
    dmLIP.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmLIP.cdsValidFull.Filtered := true;
    dmLIP.cdsValidFull.Edit;
    dmLIP.cdsValidFullLIPID.AsString := UserSession.RecordChosen;
    dmLIP.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmLIP.cdsValidFullDATEDONE.AsDateTime := Now;
    dmLIP.cdsValidFullDONEBY.AsString := UserSession.UserID;
    dmLIP.cdsValidFullCOMMENTS.AsString := ' ';
    dmLIP.cdsValidFull.Post;
  end else
  begin
    dmLIP.cdsValidFull.Edit;
    dmLIP.cdsValidFullLIPID.AsString := UserSession.RecordChosen;
    dmLIP.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmLIP.cdsValidFullDATEDONE.AsDateTime := Now;
    dmLIP.cdsValidFull.Post;
    dmLIP.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmLIP.cdsValidFull.Filtered := true;
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFValidCheck.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := Trim(AValue);
  {
  dmLIP.qLIPQ.Close;
  dmLIP.qLIPQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmLIP.cdsLIPQ.Close;
  dmLIP.cdsLIPQ.Open;
  }
  UpdateQuery2;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFLIPDetails.iwbGoToParentClick(Sender: TObject);
begin
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  UserSession.ParameterChosen := dmLIP.cdsLIPQLIPPARENTID.AsString;
  UserSession.RecordChosen := Trim(dmLIP.cdsLIPQLIPPARENTID.AsString);
  if (UserSession.RecordChosen <> '0') then
  begin
    UpdateQuery2;
  end;
end;

procedure TISFLIPDetails.iwbLinkUnitsToParentDomainClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwbPublishClick(Sender: TObject);
begin
  try
    dmLIP.cdsLIPFor.Append;
    dmLIP.cdsLIPForLIPID.AsString := UserSession.RecordChosen;
    dmLIP.cdsLIPForWHOFORID.AsString := ValueForPublished;
    dmLIP.cdsLIPFor.Post;
    dmLIP.cdsLIPFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('not able to Publish this record');
  end;
end;

procedure TISFLIPDetails.iwDBgResultsColumns0TitleClick(Sender: TObject);
begin
  dmLIP.cdsSubLIPs.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPDetails.IWDBGrid2Columns0TitleClick(Sender: TObject);
begin
  dmLIP.cdsLIPUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedByUnits.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPDetails.iwDBnLinkToGISEdit(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwDBnDomainsEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddLIPDomainLink.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.iwDBnLinkToWhoForEdit(Sender: TObject);
begin
  //TIWAppForm(WebApplication.ActiveForm).Release;
  //TISFAddLIPDomainLink.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.iwDBnMorphologyEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddLIPMorphologyLink.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.iwDBnReferencesEdit(Sender: TObject);
begin
  //TIWAppForm(WebApplication.ActiveForm).Release;
  //TISFAddLIPDomainLink.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.iwDBnStratUnitsEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddLIPUnitLink.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.UpdateQuery2;
var
  i, iRec : integer;
  tmpLIPID : integer;
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  try
    dmDV.cdsQueryDV.Close;
    dmDV.cdsDVMinMax.Close;
  except
  end;
  dmLIP.qLIPQ.Close;
  dmLIP.qLIPQ.ParamByName('LIPID').AsString := UserSession.RecordChosen;
  dmLIP.qLIPQ.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qLIPParent.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qSubLIPs.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qLIPUnits.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qLIPCorrelative.ParamByName('USERID').AsString := tmpUser;
  dmLIP.cdsLIPQ.Close;
  dmLIP.cdsLIPQ.Open;
  iRec := 0;
  //iRec := dmLIP.cdsSynonyms.RecordCount;
  if (UserSession.LinkToDateView) then
  begin
    tmpLIPID := dmLIP.cdsLIPQLIPID.AsInteger;
    dmDV.DefineDVQuery(tmpLIPID);

    if UserSession.IsDeveloper then
    begin
      dmUser.cdsDevInfo.Open;
      dmUser.cdsDevInfo.Insert;
      dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
      dmUser.cdsDevInfoQUERYCHECK.AsString := dmDV.QueryDV.SQL.Text;
      dmUser.cdsDevInfo.ApplyUpdates(0);
      dmUser.cdsDevInfo.Close;
    end;
    {
    dmDV.QueryDV.ParamByName('LIPID').AsString := dmLIP.cdsLIPQLIPID.AsString;
    dmDV.QueryDV.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsQueryDV.Close;
    dmDV.cdsQueryDV.Open;
    //iRec := 0;
    iRec := dmDV.cdsQueryDV.RecordCount;
    dmDV.cdsDVMinMax.Open;
    }
  end;
  iwbPublish.Enabled := false;
  if (iRec <= 0) then
  begin
    dmDV.cdsQueryDV.Close;
    iwDBgDateView.Visible := false;
    iwlDVSortedBy.Visible := false;
    iwlDatesAvailable.Visible := false;
    iwrDateView.Visible := false;
    iwbCalculateBarcodeAge.Enabled := false;
    iwDBeMinDVAge.Visible := false;
    iwDBeMaxDVAge.Visible := false;
  end else
  begin
    iwDBgDateView.Visible := true;
    iwlDVSortedBy.Visible := true;
    iwlDatesAvailable.Visible := true;
    iwDBeMinDVAge.Visible := true;
    iwDBeMaxDVAge.Visible := true;
    if ((UserSession.CanModify) and (UserSession.LinkToDateView))
      then iwbCalculateBarcodeAge.Enabled := true;
    iwrDateView.Visible := UserSession.LinkToDateView;
    //UpdateQuery2MinMax;
    dmStrat.qCountPublished.Close;
    dmStrat.qCountPublished.SQL.Clear;
    dmStrat.qCountPublished.SQL.Add('SELECT COUNT(LIPFOR.WHOFORID)');
    dmStrat.qCountPublished.SQL.Add('FROM LIPFOR');
    dmStrat.qCountPublished.SQL.Add('WHERE LIPFOR.LIPID = :ID');
    dmStrat.qCountPublished.SQL.Add('AND LIPFOR.WHOFORID='+''''+'PUBL'+'''');
    dmStrat.qCountPublished.ParamByName('ID').AsString := UserSession.RecordChosen;
    dmStrat.cdsCountPublished.Close;
    dmStrat.cdsCountPublished.Open;
    if ((UserSession.CanModify) and (dmStrat.cdsCountPublishedCOUNT.AsInteger < 1)) then
    begin
      iwbPublish.Enabled := true;
    end;
  end;
end;

procedure TISFLIPDetails.UpdateQuery2MinMax;
var
  i, iRec : integer;
begin
  if (UserSession.LinkToDateView) then
  begin
    try
      dmDV.cdsDVMinMax.Close;
      dmDV.qDVMinMax.Close;
      dmDV.qDVMinMax.SQL.Clear;
      dmDV.qDVMinMax.SQL.Add('SELECT MIN((ISORGR30.IAGE-ISORGR30.IAGEMERROR)/1000.0) AS MINAGE,');
      dmDV.qDVMinMax.SQL.Add('MAX((ISORGR30.IAGE+ISORGR30.IAGEPERROR)/1000.0) AS MAXAGE');
      dmDV.qDVMinMax.SQL.Add('FROM ISORGR30,ISOLIP,INTERPRETATION,ISOFOR,USERSWHOFOR');
      dmDV.qDVMinMax.SQL.Add('WHERE ISOLIP.LIPID='+UserSession.RecordChosen);
      dmDV.qDVMinMax.SQL.Add('AND ISOLIP.RECORDID=ISORGR30.RECORDID');
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPABR = ISORGR30.INTERPABR');
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPGROUP=2');
      dmDV.qDVMinMax.SQL.Add('AND ISORGR30.PREFLEVEL >= '+''''+'1'+'''');
      dmDV.qDVMinMax.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      dmDV.qDVMinMax.SQL.Add('AND USERSWHOFOR.USERNAMEID=:UserID');
      dmDV.qDVMinMax.SQL.Add('AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID');
      //if not UserSession.IsDeveloper then dmDV.qDVMinMax.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
      dmDV.qDVMinMax.ParamByName('USERID').AsString := UserSession.UserID;

{
SELECT MIN((ISORGR30.iage-isorgr30.iagemerror)/1000) as MinAge,
  max((isorgr30.iage+isorgr30.iageperror)/1000) as MaxAge
from ISORGR30,SUITE,UsersWhoFor,ISOFOR
WHERE USERSWHOFOR.USERNAMEID=:UserID
AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID
AND ISOFOR.RECORDID=ISORGR30.RECORDID
AND ISORGR30.UNITID = SUITE.UNITID
AND (SUITE.GISID=:UnitID or SUITE.parentid=:UnitID)
AND  (ISORGR30.INTERPABR = 'CrysI'
    OR ISORGR30.INTERPABR = 'CrysV'
    OR ISORGR30.INTERPABR = 'Detri'
    OR ISORGR30.INTERPABR = 'Depos'
    OR ISORGR30.INTERPABR = 'Diag')
AND ISORGR30.PREFLEVEL >= '1'
}

      if UserSession.IsDeveloper then
      begin
        dmUser.cdsDevInfo.Open;
        dmUser.cdsDevInfo.Insert;
        dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
        dmUser.cdsDevInfoQUERYCHECK.AsString := dmDV.qDVMinMax.SQL.Text;
        dmUser.cdsDevInfo.ApplyUpdates(0);
        dmUser.cdsDevInfo.Close;
      end;

      dmDV.cdsDVMinMaxMINAGE.DisplayFormat := '###0.00';
      dmDV.cdsDVMinMaxMAXAGE.DisplayFormat := '###0.00';
      dmDV.cdsDVMinMax.Close;
      dmDV.cdsDVMinMax.Open;
    finally
    end;
  end;
end;

procedure TISFLIPDetails.iwDBgDateViewColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsQueryDV.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDVSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPDetails.iwDBgDomainsColumns0TitleClick(Sender: TObject);
begin
  dmLIP.cdsDomainLIP.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedByDomain.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPDetails.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmLIP.cdsLIPQ.ApplyUpdates(0);
  except
  end;
  try
    dmLIP.cdsLIPDescription.ApplyUpdates(0);
  except
  end;
  try
    dmLIP.cdsLIPParent.ApplyUpdates(0);
  except
  end;
  try
    dmLIP.cdsLIPForm.ApplyUpdates(0);
  except
  end;
  try
    dmLIP.cdsLIPComposition.ApplyUpdates(0);
  except
  end;
end;

procedure TISFLIPDetails.iwbValidateClick(Sender: TObject);
var
  HasValidityRecord : boolean;
begin
  HasValidityRecord := false;
  dmLIP.cdsLIPValid.Filter := 'ValidStatusID='+''''+'Valid'+'''';
  dmLIP.cdsLIPValid.Filtered := true;
  if (dmLIP.cdsLIPValid.RecordCount = 1) then
  begin
    HasValidityRecord := true;
  end;
  if (not HasValidityRecord) then
  begin
    dmLIP.cdsLIPValid.Filter := 'ValidStatusID='+''''+'NotYt'+'''';
    dmLIP.cdsLIPValid.Filtered := true;
    if (dmLIP.cdsLIPValid.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmLIP.cdsLIPValid.Edit;
      dmLIP.cdsLIPValidVALIDSTATUSID.AsString := 'Valid';
      dmLIP.cdsLIPValidDONEBY.AsString := UserSession.UserID;
      dmLIP.cdsLIPValidDATEDONE.AsDateTime := Now;
      dmLIP.cdsLIPValid.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmLIP.cdsLIPValid.Append;
      dmLIP.cdsLIPValidLIPID.AsString := dmLIP.cdsLIPQLIPID.AsString;
      dmLIP.cdsLIPValidVALIDSTATUSID.AsString := 'Valid';
      dmLIP.cdsLIPValidDATEDONE.AsDateTime := Now;
      dmLIP.cdsLIPValidDONEBY.AsString := UserSession.UserID;
      //dmLIP.cdsValidFullCOMMENTS.AsString := ' ';
      dmLIP.cdsLIPValid.Post;
    end;
    try
      dmLIP.cdsLIPValid.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update validation status');
    end;
  end;
  dmLIP.cdsLIPValid.Filtered := false;
  dmLIP.cdsLIPQ.Close;
  dmLIP.cdsLIPQ.Open;
end;

procedure TISFLIPDetails.iwbCheckedClick(Sender: TObject);
begin
  UserSession.RecordChosen := dmLIP.cdsLIPQLIPID.AsString;
  dmLIP.qValidFull.Close;
  dmLIP.qValidFull.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmLIP.cdsValidFull.Close;
  dmLIP.cdsValidFull.Open;
  dmLIP.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmLIP.cdsValidFull.Filtered := true;
  if (dmLIP.cdsValidFull.RecordCount > 0) then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFValidCheck.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('No objection to clear');
  end;
end;

procedure TISFLIPDetails.iwDBgReferenceColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.Parameter2Chosen := Trim(AValue);
end;

procedure TISFLIPDetails.iwDBgReferenceColumns0TitleClick(Sender: TObject);
begin
  dmLIP.cdsLIPRefs.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPDetails.iwbDeleteGISLinkClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwbDeleteLinkToWhoForClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwbDeleteRefLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmLIP.DeleteRefRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmLIP.cdsLIPQ.Close;
    dmLIP.cdsLIPQ.Open;
  end;
end;

procedure TISFLIPDetails.iwbAddGISLinkClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwbAddLIPDomainLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmLIP.InsertLIPDomainLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddLIPDomainLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFLIPDetails.iwbAddLIPToDateViewClick(Sender: TObject);
var
  tmpLIPName, tmpLIPID : string;
begin
  tmpLIPName := dmLIP.cdsLIPQLIPNAME.AsString;
  tmpLIPID := dmLIP.cdsLIPQLIPID.AsString;
  //dmDV.AddLIPToDV(tmpLIPName,tmpLIPID);
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwbAddLIPUnitLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmLIP.InsertLIPUnitLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddLIPUnitLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFLIPDetails.iwbAddMorphologyLinkClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddLIPMorphologyLink.Create(WebApplication).Show;
end;

procedure TISFLIPDetails.iwbAddRefLinkClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFLIPDetails.iwbAddWhoForClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

end.
