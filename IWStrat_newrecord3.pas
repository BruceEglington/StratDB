unit IWStrat_newrecord3;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompGrids, IWDBGrids, IWCompRectangle,
  IWStrat_frTopBar;

type
  TISFNewRecord3 = class(TIWAppForm)
    iwbSubmitQuery: TIWButton;
    IWLabel3: TIWLabel;
    IWLabel1: TIWLabel;
    iwcbReference: TIWComboBox;
    iwlWhoFor: TIWListbox;
    lblReferenceError: TIWLabel;
    lblWhoForError: TIWLabel;
    IWLabel2: TIWLabel;
    rectLeft: TIWRectangle;
    iwCancel: TIWButton;
    TopBar: TISFTopBarStrat;
    iweUnit: TIWEdit;
    lblStratigraphicUnitError: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ; 
  end;

implementation

uses ServerController, DB_List_Combo, IWStrat_uMain, IWStrat_dm,
  IWStrat_details, IWStrat_constants, usrIW_dm;

{$R *.dfm}


procedure TISFNewRecord3.IWAppFormCreate(Sender: TObject);
begin
  ClearErrorMessages;
  dmStrat.qUsersWhoFor.Close;
  dmStrat.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.qReferences.Close;
  dmStrat.qReferences.SQL.Clear;
  dmStrat.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmStrat.qReferences.SQL.Add('  SOURCELIST.SOURCEYEAR, CONTINENTS.CONTINENT');
  dmStrat.qReferences.SQL.Add('FROM SOURCELIST,CONTINENTS');
  dmStrat.qReferences.SQL.Add('WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID');
  dmStrat.qReferences.SQL.Add('AND (SOURCELIST.CONTINENTID = '+''''+UserSession.NewContinentID+'''');
  dmStrat.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedContinentID+''''+')');
  dmStrat.qReferences.SQL.Add('ORDER BY SOURCELIST.SOURCESHORT ');
  dmStrat.cdsUsersWhoFor.Close;
  dmStrat.cdsReferences.Close;
  //dmUser.SetDeveloperData(dmStrat.qReferences.SQL.Text);
  dmStrat.cdsUsersWhoFor.Open;
  dmStrat.cdsReferences.Open;
  if (UserSession.UsersWhoForValues.Count = 0) then UserSession.UsersWhoForValues.Add('PUBL');
  UpdateComboBoxValue(iwcbReference,dmStrat.cdsReferences,'SourceShort','SourceNum',UserSession.NewReferenceID);
  UpdateListBoxValues(iwlWhoFor,dmStrat.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
end;

procedure TISFNewRecord3.iwbSubmitQueryClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  UserSession.NewUnit := iweUnit.Text;
  GetComboBoxValue(iwcbReference,dmStrat.cdsReferences,'SourceShort','SourceNum',UserSession.NewReferenceID);
  GetListBoxValues(iwlWhoFor,dmStrat.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
  if Validate then
  begin
    dmStrat.cdsCountries.Close;
    dmStrat.cdsReferences.Close;
    dmStrat.cdsWhoFor.Close;
    dmStrat.SubmitNewRecord2(WasSuccessful);
    UserSession.WhereAmI := 'After SubmitNewRecord';
    if WasSuccessful then
    begin
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFDetails.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('Not able to insert new record ');
    end;
  end;
end;

procedure TISFNewRecord3.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFNewRecord3.Validate: Boolean;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweUnit.Text) = '') then
  begin
    lblStratigraphicUnitError.Caption := '''Strat. Unit'' requires a value.';
    Result := false;
  end;
  if (Trim(iwcbReference.Text) = '') then
  begin
    lblReferenceError.Caption := '''Reference'' requires a value.';
    Result := false;
  end;
  if (UserSession.UsersWhoForValues.Count = 0) then
  begin
    lblWhoForError.Caption := '''Accessable by'' requires a value.';
    Result := false;
  end;
  if (Result = false) then
  begin
    Exit;
  end;
end;

procedure TISFNewRecord3.ClearErrorMessages;
begin
  lblStratigraphicUnitError.Caption := '';
  lblReferenceError.Caption := '';
  lblWhoForError.Caption := '';
end;

procedure TISFNewRecord3.iwCancelClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
