unit IWStrat_addlipmorphologylink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddLIPMorphologyLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWLabel3: TIWLabel;
    iwDBeOrder: TIWDBEdit;
    iwDBlcbLink: TIWDBLookupComboBox;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dmLIP, IWStrat_LIPdetails;




procedure TISFAddLIPMorphologyLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsBrowse]));
  iwDBeOrder.Editable := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  //iwDBlcbLink.Editable := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
end;

procedure TISFAddLIPMorphologyLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmLIP.cdsLIPForms.Close;
  dmLIP.cdsLIPForms.Open;
  dmLIP.cdsLIPQ.Close;
  dmLIP.cdsLIPQ.Open;
  dmLIP.cdsLIPForm.Close;
  dmLIP.cdsLIPForm.Open;
  //dmLIP.cdsLIPForm.Edit;
end;

procedure TISFAddLIPMorphologyLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmLIP.cdsLIPForm.Post;
    dmLIP.cdsLIPForm.ApplyUpdates(0);
    dmLIP.cdsLIPQ.Close;
    dmLIP.cdsLIPQ.Open;
    dmLIP.cdsLIPForm.Close;
    dmLIP.cdsLIPForm.Open;
  end;
end;

procedure TISFAddLIPMorphologyLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmLIP.cdsLIPForm.CancelUpdates;
  end;
end;

procedure TISFAddLIPMorphologyLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmLIP.cdsLIPForm.Delete;
  dmLIP.cdsLIPForm.ApplyUpdates(0);
end;

procedure TISFAddLIPMorphologyLink.iwbEditClick(Sender: TObject);
begin
  dmLIP.cdsLIPForms.Close;
  dmLIP.cdsLIPForms.Open;
  dmLIP.cdsLIPForm.Edit;
end;

procedure TISFAddLIPMorphologyLink.iwbReturnClick(Sender: TObject);
begin
  dmLIP.cdsLIPForms.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLIPDetails.Create(WebApplication).Show;
end;

procedure TISFAddLIPMorphologyLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  //dmLIP.InsertMorphologyLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmLIP.cdsLIPForm.Close;
    dmLIP.cdsLIPForm.Open;
    dmLIP.cdsLIPForm.Edit;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

end.
