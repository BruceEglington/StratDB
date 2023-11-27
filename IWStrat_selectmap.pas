unit IWStrat_selectmap;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWStrat_frTopBar, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion;

type
  TISFSelectMap = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    iwcbMaps: TIWComboBox;
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

uses ServerController, DB_List_Combo,
  IWStrat_uMain, IWStrat_constants, IWStrat_dm;

{$R *.dfm}


procedure TISFSelectMap.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  dmStrat.cdsMaps.Close;
  UpdateComboBoxValue(iwcbMaps,dmStrat.cdsMaps,'MapName','MapID2',UserSession.ParameterChosen);
end;

procedure TISFSelectMap.iwbNextStageOfQueryClick(Sender: TObject);
begin
  GetComboBoxValue(iwcbMaps,dmStrat.cdsMaps,'MapName','MapID2',UserSession.ParameterChosen);
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFMapDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFSelectMap.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateComboBoxValue(iwcbMaps,dmStrat.cdsMaps,'MapName','MapID2',UserSession.ParameterChosen);
  end;
end;

function TISFSelectMap.Validate: Boolean;
begin
  Result := true;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFSelectMap.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    {
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    }
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

end.
