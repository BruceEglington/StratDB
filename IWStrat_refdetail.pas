unit IWStrat_refdetail;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompGrids,
  IWDBGrids, IWCompListbox, usrIW_dm, IWStrat_frTopBar;

type
  TISFRefDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbLink: TIWDBLookupComboBox;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    IWLabel5: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel7: TIWLabel;
    iwDBlcbWhoFor: TIWDBLookupComboBox;
    TopBar: TISFTopBarStrat;
    iwbCopyRefShort: TIWButton;
    IWMemoASCIIwarning: TIWMemo;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
    procedure iwbCopyRefShortClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details, IWStrat_references,
  IWStrat_constants, IWStrat_dmDV;




procedure TISFRefDetails.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanDelete and (dmStrat.cdsRefFull.State in [dsBrowse]));
  iwbReturn.Visible := (dmStrat.cdsRefFull.State in [dsBrowse]);
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmStrat.cdsRefFull.State in [dsEdit,dsInsert]));
end;

procedure TISFRefDetails.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.qUsersWhoFor.Close;
  dmStrat.qUsersWhoFor.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsUsersWhoFor.Close;
  dmStrat.cdsUsersWhoFor.Open;
  dmStrat.qRefFull.Close;
  dmStrat.qRefFull.ParamByName('SOURCENUM').AsString := UserSession.ParameterChosen;
  dmStrat.cdsRefFull.Close;
  dmStrat.cdsRefFull.Open;
  //dmStrat.cdsRefFull.Edit;
  dmStrat.cdsRefFull.Open;
end;

procedure TISFRefDetails.iwbApplyUpdatesClick(Sender: TObject);
var
  WasSuccessful : boolean;
  tSourceNum, tSourceYear : integer;
  tSourceShort, tContinentID, tWhoForID : string;
begin
  if(Sender = iwbApplyUpdates) then
  begin
    WasSuccessful := false;
    tSourceNum := dmStrat.cdsRefFullSOURCENUM.AsInteger;
    //tSourceNum := UserSession.ParameterChosen;
    tSourceYear := dmStrat.cdsRefFullSOURCEYEAR.AsInteger;
    tSourceShort := dmStrat.cdsRefFullSOURCESHORT.AsString;
    tContinentID := dmstrat.cdsRefFullCONTINENTID.AsString;
    tWhoForID := dmStrat.cdsRefFullWHOFORID.AsString;
    //try
      dmDV.InsertReference(tSOURCENUM,tSOURCEYEAR,tSOURCESHORT,tCONTINENTID,tWHOFORID,WasSuccessful);
      if not WasSuccessful then
      begin
        WebApplication.ShowMessage('Not able to copy reference to DateView database');
      end;
    //except
    //end;
    try
      dmStrat.cdsRefFull.Post;
      dmStrat.cdsRefFull.ApplyUpdates(-1);
      //dmUser.SetDeveloperData('RefDetails iwApplyUpdatesClick - call ReplicateChanges');
      //dmStrat.cdsRefFull.Close;
      //dmStrat.cdsRefFull.Open;
      //dmReplicate.ReplicateChanges('ttNoTrace');
    except
    end;
  end;
end;

procedure TISFRefDetails.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsRefFull.CancelUpdates;
  end;
end;

procedure TISFRefDetails.iwbCopyRefShortClick(Sender: TObject);
begin
  dmStrat.cdsRefFullSOURCEDESCRIPTION.AsString :=  dmStrat.cdsRefFullSOURCESHORT.AsString + dmStrat.cdsRefFullSOURCEDESCRIPTION.AsString
end;

procedure TISFRefDetails.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsRefFull.Delete;
  dmStrat.cdsRefFull.ApplyUpdates(0);
end;

procedure TISFRefDetails.iwbEditClick(Sender: TObject);
begin
  dmStrat.cdsRefFull.Edit;
end;

procedure TISFRefDetails.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsRefFull.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender = usReferences) then TISFReferences.Create(WebApplication).Show;
  if (UserSession.UnitSender = usDetails) then TISFDetails.Create(WebApplication).Show;
  if (UserSession.UnitSender = usDetailsEdit) then TISFDetails.Create(WebApplication).Show;
end;

procedure TISFRefDetails.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
  tSourceNum, tSourceYear : integer;
  tSourceShort, tContinentID, tWhoForID : string;
begin
  WasSuccessful := false;
  dmStrat.InsertReference(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsRefFull.Close;
    dmStrat.cdsRefFull.Open;
    {}
  end
  else begin
    {}
  end;
    dmDV.InsertReference(tSOURCENUM,tSOURCEYEAR,tSOURCESHORT,tCONTINENTID,tWHOFORID,WasSuccessful);
end;

end.
