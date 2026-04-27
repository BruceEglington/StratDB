unit IWStrat_selectchart;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWStrat_frTopBar, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion;

type
  TISFSelectChart = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    iwcbCharts: TIWComboBox;
    iwlblError: TIWLabel;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWStrat_dmC, ServerController, DB_List_Combo,
  IWStrat_uMain, IWStrat_constants, IWStrat_chartdetails, usrIW_dm;

{$R *.dfm}


procedure TISFSelectChart.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  dmStratC.qCharts.Close;
  dmStratC.qCharts.ParamByName('USERID').AsString := UserSession.UserID;
  dmStratC.cdsCharts.Close;
  UpdateComboBoxValue(iwcbCharts,dmStratC.cdsCharts,'Chart','ChartID',UserSession.ChartValue);
end;

procedure TISFSelectChart.iwbNextStageOfQueryClick(Sender: TObject);
begin
  //dmUser.SetDeveloperData('SelectChart NextStageOfQuery');
  GetComboBoxValue(iwcbCharts,dmStratC.cdsCharts,'Chart','ChartID',UserSession.ChartValue);
  //dmUser.SetDeveloperData('After GetComboBoxValue');
  //dmUser.SetDeveloperData('Chart selected is '+UserSession.ChartValue);
  if Validate then
  begin
    //dmUser.SetDeveloperData('Chart selection validated');
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFChartDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFSelectChart.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateComboBoxValue(iwcbCharts,dmStratC.cdsCharts,'Chart','ChartID',UserSession.ChartValue);
  end;
end;

function TISFSelectChart.Validate: Boolean;
begin
  Result := true;
  if (UserSession.ChartValue <= '') then Result := false;
  if (Result = false) then
  begin
    WebApplication.ShowMessage('You forgot to select a chart');
  end;
end;

procedure TISFSelectChart.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    {
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    }
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

end.
