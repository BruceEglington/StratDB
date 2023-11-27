unit IWStrat_definenewcontinent;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWStrat_frTopBar;

type
  TISFDefineNewContinent = class(TIWAppForm)
    iwbContinue: TIWButton;
    IWLabel1: TIWLabel;
    iwlContinent: TIWComboBox;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbContinueClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB,
  DB_List_Combo, IWStrat_chartdomain, IWStrat_dmC, IWStrat_chartdetails;




procedure TISFDefineNewContinent.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFDefineNewContinent.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStratC.cdsContinents.Open;
  UpdateComboBoxValue(iwlContinent,dmStratC.cdsContinents,'Continent','ContinentID',UserSession.NewContinentID);
end;

procedure TISFDefineNewContinent.iwbContinueClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  GetComboBoxValue(iwlContinent,dmStratC.cdsContinents,'Continent','ContinentID',UserSession.NewContinentID);
  dmStratC.cdsContinents.Close;
  dmStratC.AddChartDomain(UserSession.NewContinentID,WasSuccessful);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFChartDomain.Create(WebApplication).Show;
  {
  if WasSuccessful then
  begin
    TISFChartDomain.Create(WebApplication).Show;
  end else
  begin
    TISFChartDetails.Create(WebApplication).Show;
  end;
  }
end;

end.
