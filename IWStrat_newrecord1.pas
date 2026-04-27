unit IWStrat_newrecord1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWStrat_frTopBar;

type
  TISFNewRecord1 = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    IWText1: TIWText;
    iwcbContinent: TIWComboBox;
    IWLabel1: TIWLabel;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, DB_List_Combo, IWStrat_dm, IWStrat_uMain,
  IWStrat_newrecord2;

{$R *.dfm}


procedure TISFNewRecord1.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  dmStrat.cdsContinents.Close;
  dmStrat.qContinents.Close;
  dmStrat.qContinents.SQL.Clear;
  dmStrat.qContinents.SQL.Add('SELECT * FROM CONTINENTS');
  SetComboBox(iwcbContinent,dmStrat.cdsContinents,'Continent','ContinentID');
end;

procedure TISFNewRecord1.iwbNextStageOfQueryClick(Sender: TObject);
begin
  GetComboBoxValue(iwcbContinent,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.NewContinentID);
  dmStrat.cdsContinents.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFNewRecord2.Create(WebApplication).Show;
end;

procedure TISFNewRecord1.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateComboBoxValue(iwcbContinent,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.NewContinentID);
  end;
end;

procedure TISFNewRecord1.iwbCancelClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
