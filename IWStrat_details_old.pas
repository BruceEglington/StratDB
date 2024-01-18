unit IWStrat_details_old;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB,
  IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox, 
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWStrat_frTopBar, IW509_frTopBar;

type
  TISFDetailsStrat = class(TIWAppForm)
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
    TopBar: TISFTopBar;
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
  public
    RecordValues : TStringList;
    procedure UpdateQuery;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IW509_frGrid,
  IW509_constants, IW509_dm, IW509_dmDV, IWStrat_uMain;

procedure TISFDetailsStrat.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dm509.cdsUnitQ.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dm509.cdsUnitQ.State in [dsEdit]));
end;

procedure TISFDetailsStrat.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFGrid.Create(WebApplication).Show
end;

procedure TISFDetailsStrat.iwbDetailsEditClick(Sender: TObject);
begin
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFDetailsEdit.Create(WebApplication).Show
  }
  dm509.cdsUnitQ.Edit;
end;

procedure TISFDetailsStrat.IWAppFormCreate(Sender: TObject);
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
    iwbApplyUpdates.Visible := false;
    UpdateQuery;
  end;
end;

procedure TISFDetailsStrat.iwbQueryValidationStatusClick(Sender: TObject);
begin
  {
  dm509.cdsStratValid2.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dm509.cdsStratValid2.Filtered := true;
  if (dm509.cdsStratValid2.RecordCount = 0) then
  begin
    dm509.cdsStratValid2.Append;
    dm509.cdsStratValid2RECORDID.AsString := UserSession.RecordChosen;
    dm509.cdsStratValid2VALIDSTATUSID.AsString := 'Check';
    dm509.cdsStratValid2DATEDONE.AsDateTime := Now;
    dm509.cdsStratValid2DONEBY.AsString := UserSession.UserID;
    dm509.cdsStratValid2.Post;
  end else
  begin
    dm509.cdsStratValid2.Edit;
    dm509.cdsStratValid2RECORDID.AsString := UserSession.RecordChosen;
    dm509.cdsStratValid2VALIDSTATUSID.AsString := 'Check';
    dm509.cdsStratValid2DATEDONE.AsDateTime := Now;
    dm509.cdsStratValid2.Post;
  end;
  UserSession.UnitSender := usDetails;
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFValidCheck.Create(WebApplication).Show;
  }
end;

procedure TISFDetailsStrat.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := Trim(AValue);
  {
  dm509.qUnitQ.Close;
  dm509.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dm509.cdsUnitQ.Close;
  dm509.cdsUnitQ.Open;
  }
  UpdateQuery;
  UserSession.ParameterChosen := AValue;
end;

procedure TISFDetailsStrat.iwbGoToParentClick(Sender: TObject);
begin
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  UserSession.ParameterChosen := dm509.cdsUnitQPARENTID.AsString;
  UserSession.RecordChosen := Trim(dm509.cdsUnitQPARENTID.AsString);
  if (UserSession.RecordChosen <> '0') then
  begin
    {
    dm509.qUnitQ.Close;
    dm509.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
    dm509.cdsUnitQ.Close;
    dm509.cdsUnitQ.Open;
    }
    UpdateQuery;
  end;
end;

procedure TISFDetailsStrat.iwDBgResultsColumns0TitleClick(Sender: TObject);
begin
  dm509.cdsSubUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetailsStrat.UpdateQuery;
var
  i, iRec : integer;
begin
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  dm509.qUnitQ.Close;
  dm509.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dm509.cdsUnitQ.Close;
  dm509.cdsUnitQ.Open;
  iRec := 0;
  iRec := dm509.cdsRecords.RecordCount;
  if ((UserSession.LinkToDateView) and (iRec > 0)) then
  begin
    try
      RecordValues := TStringList.Create;
      RecordValues.Clear;
      dm509.cdsRecords.First;
      repeat
        RecordValues.Add(dm509.cdsRecordsRECORDID.AsString);
        dm509.cdsRecords.Next;
      until dm509.cdsRecords.Eof;
      dm509.cdsRecords.First;
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

procedure TISFDetailsStrat.iwDBgDateViewColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsQueryDV.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDVSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDetailsStrat.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dm509.cdsUnitQ.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update record');
  end;
end;

end.
