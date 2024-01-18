unit IWStrat_details2;

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
    iwbQueryValidationStatus: TIWButton;
    iwbDetailsEdit: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
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
    IWDBEdit10: TIWDBEdit;
    iwDBgResults: TIWDBGrid;
    IWLabel14: TIWLabel;
    IWDBGrid1: TIWDBGrid;
    IWLabel15: TIWLabel;
    IWDBGrid2: TIWDBGrid;
    iwbGoToParent: TIWButton;
    iwrDateView: TIWRegion;
    IWLabel22: TIWLabel;
    iwDBgDateView: TIWDBGrid;
    IWRegion1: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    IWLabel16: TIWLabel;
    IWRegion4: TIWRegion;
    IWRegion5: TIWRegion;
    IWRegion6: TIWRegion;
    IWRegion7: TIWRegion;
    IWRegion8: TIWRegion;
    IWRegion9: TIWRegion;
    IWLabel17: TIWLabel;
    IWDBGrid3: TIWDBGrid;
    IWDBNavigator1: TIWDBNavigator;
    IWDBMemo2: TIWDBMemo;
    IWRegion10: TIWRegion;
    IWLabel19: TIWLabel;
    IWDBGrid4: TIWDBGrid;
    IWDBNavigator2: TIWDBNavigator;
    IWDBMemo3: TIWDBMemo;
    IWLabel20: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    iwlSortedBy: TIWLabel;
    iwlDVSortedBy: TIWLabel;
    iwbApplyUpdates: TIWButton;
    iwbValidate: TIWButton;
    TopBar: TISFTopBarStrat;
    iwbChecked: TIWButton;
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
  public
    RecordValues : TStringList;
    procedure UpdateQuery;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_frGrid,
  IWStrat_constants, IWStrat_dm, IWStrat_dmDV, IWStrat_validcheck;

procedure TISFDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsUnitQ.State in [dsEdit]));
end;

procedure TISFDetails.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFGrid.Create(WebApplication).Show
end;

procedure TISFDetails.iwbDetailsEditClick(Sender: TObject);
begin
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFDetailsEdit.Create(WebApplication).Show
  }
  dmStrat.cdsUnitQ.Edit;
end;

procedure TISFDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwrDateView.Visible := UserSession.LinkToDateView;
    iwbDetailsEdit.Visible := UserSession.CanModify;
    iwbDetailsEdit2.Visible := UserSession.CanModify;
    iwbValidate.Visible := UserSession.CanValidate;
    iwbApplyUpdates.Visible := false;
    UpdateQuery;
  end;
end;

procedure TISFDetails.iwbQueryValidationStatusClick(Sender: TObject);
begin
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
      dmStrat.cdsValidFull.Post;
    end;
    dmStrat.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsValidFull.Filtered := true;
    dmStrat.cdsValidFull.Edit;
    dmStrat.cdsValidFullUNITID.AsString := UserSession.RecordChosen;
    dmStrat.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmStrat.cdsValidFullDATEDONE.AsDateTime := Now;
    dmStrat.cdsValidFullDONEBY.AsString := UserSession.UserID;
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

procedure TISFDetails.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := Trim(AValue);
  {
  dmStrat.qUnitQ.Close;
  dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.cdsUnitQ.Close;
  dmStrat.cdsUnitQ.Open;
  }
  UpdateQuery;
  UserSession.ParameterChosen := AValue;
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
    UpdateQuery;
  end;
end;

procedure TISFDetails.iwDBgResultsColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSubUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.UpdateQuery;
var
  i, iRec : integer;
begin
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  dmStrat.qUnitQ.Close;
  dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.cdsUnitQ.Close;
  dmStrat.cdsUnitQ.Open;
  iRec := 0;
  iRec := dmStrat.cdsRecords.RecordCount;
  if ((UserSession.LinkToDateView) and (iRec > 0)) then
  begin
    try
      RecordValues := TStringList.Create;
      RecordValues.Clear;
      dmStrat.cdsRecords.First;
      repeat
        RecordValues.Add(dmStrat.cdsRecordsRECORDID.AsString);
        dmStrat.cdsRecords.Next;
      until dmStrat.cdsRecords.Eof;
      dmStrat.cdsRecords.First;
      dmDV.QueryDV.SQL.Clear;
      dmDV.QueryDV.SQL.Add('select ISORGR30.COUNTRYABR, ISORGR30.UnitName,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.MaterialAbr,ISORGR30.IsotopeSystem,ISORGR30.ApproachAbr,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.TechAbr,TECHNIQUE.Technique,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.InterpAbr,ISORGR30.IAge,ISORGR30.IAgePError,ISORGR30.IAgeMError, ISORGR30.AgeUnits,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.Lithology,ISORGR30.RecordID,COUNTRY.Country,MATERIAL.MaterialDescription,');
      dmDV.QueryDV.SQL.Add('  Interpretation.Interpretation,APPROACH.ApproachDescription,ISOSYSTEM.IsoSystemName,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
      dmDV.QueryDV.SQL.Add('from isorgr30,Country,Interpretation,Approach,Material,IsoSystem,ISOFOR,Technique');
      dmDV.QueryDV.SQL.Add('WHERE  ISORGR30.CountryAbr = COUNTRY.CountryAbr');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.TechAbr = TECHNIQUE.TechAbr');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.PrefLevel >= 1');
      dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      if not UserSession.IsDeveloper then dmDV.QueryDV.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
      dmDV.QueryDV.SQL.Add('AND ( ISORGR30.RECORDID = '+RecordValues.Strings[0]);
      if (iRec > 1) then
      begin
        for i := 2 to iRec do
        begin
          dmDV.QueryDV.SQL.Add('OR ISORGR30.RECORDID = '+RecordValues.Strings[i-1]);
        end;
      end;
      dmDV.QueryDV.SQL.Add(' ) ');
      dmDV.QueryDV.SQL.Add('ORDER by IsoRgr30.CountryAbr,IsoRgr30.UnitName,IsoRgr30.MaterialAbr,');
      dmDV.QueryDV.SQL.Add('  IsoRgr30.IsotopeSystem,IsoRgr30.ApproachAbr,IsoRgr30.InterpAbr,');
      dmDV.QueryDV.SQL.Add('  IsoRgr30.PrefLevel,IsoRgr30.IAge');
      dmDV.cdsQueryDV.Close;
      dmDV.cdsQueryDV.Open;
      iRec := 0;
      iRec := dmDV.cdsQueryDV.RecordCount;
      if (iRec > 0) then iwrDateView.Visible := UserSession.LinkToDateView;
    finally
      FreeAndNil(RecordValues);
    end;
  end;
  if (iRec <= 0) then
  begin
    dmDV.cdsQueryDV.Close;
    iwDBgDateView.Visible := false;
    iwlDVSortedBy.Visible := false;
  end else
  begin
    iwDBgDateView.Visible := true;
    iwlDVSortedBy.Visible := true;
  end;
end;

procedure TISFDetails.iwDBgDateViewColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsQueryDV.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDVSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetails.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsUnitQ.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update record');
  end;
end;

procedure TISFDetails.iwbValidateClick(Sender: TObject);
var
  HasValidityRecord : boolean;
begin
  HasValidityRecord := false;
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
    dmStrat.cdsValidUNITID.AsString := dmStrat.cdsQuery1UNITID.AsString;
    dmStrat.cdsValidVALIDSTATUSID.AsString := 'Valid';
    dmStrat.cdsValidDATEDONE.AsDateTime := Now;
    dmStrat.cdsValidDONEBY.AsString := UserSession.UserID;
    dmStrat.cdsValid.Post;
  end;
  try
    dmStrat.cdsValid.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update validation status');
  end;
  dmStrat.cdsValid.Filtered := false;
  dmStrat.cdsUnitQ.Close;
  dmStrat.cdsUnitQ.Open;
end;

procedure TISFDetails.iwbCheckedClick(Sender: TObject);
begin
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

end.
