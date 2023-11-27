unit IWStrat_addlinktoapplication;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  DB, IWDBGrids, IWCompListbox;

type
  TISFAddLinkToApplication = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbSaveReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelReturn: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbApplication: TIWDBLookupComboBox;
    iwDBnLinkToApplications: TIWDBNavigator;
    IWDBGrid1: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details;




procedure TISFAddLinkToApplication.IWAppFormRender(Sender: TObject);
begin
  iwbSaveReturn.Visible := (UserSession.CanModify and (dmStrat.cdsLinkedApplications.State in [dsBrowse,dsEdit]));
  iwbCancelReturn.Visible := (UserSession.CanModify and (dmStrat.cdsLinkedApplications.State in [dsBrowse,dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModifyPlus and (dmStrat.cdsLinkedApplications.State in [dsBrowse]));
end;

procedure TISFAddLinkToApplication.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.cdsApplications.Open;
  dmStrat.cdsLinkedApplications.Edit;
end;

procedure TISFAddLinkToApplication.iwbReturnClick(Sender: TObject);
begin
  if(Sender = iwbSaveReturn) then
  begin
    dmStrat.cdsLinkedApplications.Post;
    dmStrat.cdsLinkedApplications.ApplyUpdates(0);
  end;
  if(Sender = iwbCancelReturn) then
  begin
    dmStrat.cdsLinkedApplications.Cancel;
    dmStrat.cdsLinkedApplications.CancelUpdates;
  end;
  dmStrat.cdsApplications.Close;
  dmStrat.cdsLinkedApplications.Filtered := false;
  dmStrat.cdsLinkedApplications.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDetails.Create(WebApplication).Show;
end;

end.
