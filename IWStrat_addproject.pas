unit IWStrat_addproject;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddProject = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBnUserProjects: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWLabel3: TIWLabel;
    TopBar: TISFTopBarStrat;
    IWDBEdit3: TIWDBEdit;
    iwbAddLink: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnUserProjectsInsert(Sender: TObject);
    procedure iwDBgLinkColumns1Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, usrIW_dm, IWStrat_uMain;




procedure TISFAddProject.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := ((dmStrat.cdsUserProjects.State in [dsBrowse]));
  iwbEdit.Visible := ((dmStrat.cdsUserProjects.State in [dsBrowse]));
  iwbApplyUpdates.Visible := ((dmStrat.cdsUserProjects.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := ((dmStrat.cdsUserProjects.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := ((dmStrat.cdsUserProjects.State in [dsBrowse]));
  iwbAddLink.Visible := ((dmStrat.cdsUserProjects.State in [dsBrowse]));
end;

procedure TISFAddProject.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.qUserProjects.Close;
  dmStrat.qUserProjects.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsUserProjects.Close;
  dmStrat.cdsUserProjects.Open;
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
end;

procedure TISFAddProject.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsUserProjects.ApplyUpdates(0);
    //dmUser.SetDeveloperData('AddProject iwApplyUpdatesClick - call ReplicateChanges');
    dmStrat.cdsUserProjects.Close;
    dmStrat.qUserProjects.Close;
    dmStrat.qUserProjects.ParamByName('UserID').AsString := UserSession.UserID;
    dmStrat.cdsUserProjects.Open;
    //dmReplicate.ReplicateChanges('ttNoTrace');
  end;
end;

procedure TISFAddProject.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsUserProjects.CancelUpdates;
  end;
end;

procedure TISFAddProject.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.Delete;
  dmStrat.cdsUserProjects.ApplyUpdates(0);
  //dmReplicate.ReplicateChanges('ttNoTrace');
end;

procedure TISFAddProject.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.Edit;
end;

procedure TISFAddProject.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.Close;
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFAddProject.iwDBgLinkColumns1Click(ASender: TObject;
  const AValue: string);
begin
  dmStrat.cdsUserProjects.Locate('UserProjectID',AValue,[]);
end;

procedure TISFAddProject.iwDBnUserProjectsInsert(Sender: TObject);
var
  WasSuccessful : boolean;
  tUserID : string;
begin
  WasSuccessful := false;
  tUserID := UserSession.UserID;
  dmStrat.InsertUserProject(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsUserProjects.Close;
    dmStrat.qUserProjects.Close;
    dmStrat.qUserProjects.ParamByName('UserID').AsString := tUserID;
    dmStrat.cdsUserProjects.Open;
    dmStrat.cdsUserProjects.Locate('UserProjectName','New'+tUserID,[]);
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new user project');
  end;
end;

end.

