unit IWStrat_chartedit;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWStrat_frTopBar, IWCompMemo;

type
  TISFChartEdit = class(TIWAppForm)
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbSave: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    IWLabel2: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel3: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel4: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel5: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    iwbEdit: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWStrat_dmC, IWStrat_charts;




procedure TISFChartEdit.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbSave.Visible := dmStratC.cdsCharts.State in [dsEdit];
  iwbDelete.Visible := dmStratC.cdsCharts.State in [dsBrowse];
  iwbEdit.Visible := dmStratC.cdsCharts.State in [dsBrowse];
  iwbCancelChanges.Visible := dmStratC.cdsCharts.State in [dsEdit];
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFChartEdit.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDelete.Visible := UserSession.CanDelete;
  iwDBNavigator1.Visible := UserSession.CanModifyPlus;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  try
    dmStratC.cdsCharts.Locate('CHARTID',UserSession.ParameterChosen,[]);
  except
  end;
  //dmStratC.cdsCharts.Edit;
end;

procedure TISFChartEdit.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFCharts.Create(WebApplication).Show;
end;

procedure TISFChartEdit.iwbSaveClick(Sender: TObject);
begin
  try
    dmStratC.cdsCharts.Post;
  except
  end;
  try
    dmStratC.cdsCharts.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFChartEdit.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStratC.cdsCharts.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFChartEdit.iwbDeleteClick(Sender: TObject);
begin
  try
    dmStratC.cdsCharts.Delete;
    dmStratC.cdsCharts.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete record',smAlert);
  end;
end;

procedure TISFChartEdit.iwbEditClick(Sender: TObject);
begin
  dmStratC.cdsCharts.Edit;
end;

end.
