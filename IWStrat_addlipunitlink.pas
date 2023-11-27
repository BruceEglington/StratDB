unit IWStrat_addlipunitlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddLIPUnitLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBlcbLink: TIWDBLookupComboBox;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_LIPdetails, IWStrat_dmLIP, usrIW_dm;




procedure TISFAddLIPUnitLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmLIP.cdsLIPUnits.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPUnits.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPUnits.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmLIP.cdsLIPUnits.State in [dsBrowse]));
  iwDBlcbLink.Editable := (UserSession.CanModify and (dmLIP.cdsLIPUnits.State in [dsEdit]));
end;

procedure TISFAddLIPUnitLink.IWAppFormCreate(Sender: TObject);
var
  tempStr : string;
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.qUnits.Close;
  dmStrat.qUnits.SQL.Clear;
  dmStrat.qUnits.SQL.Add('SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.UNITNAME, ');
  tempStr := '   STRATUNITS.UNITNAME || '+''''+'   ('+''''+' || STRATUNITS.UNITID || '+''''+') '+''''+' AS UNITNAMEUNITID, ';
  dmStrat.qUnits.SQL.Add(tempStr);
  dmStrat.qUnits.SQL.Add('   STRATUNITS.COUNTRYID, STRATUNITS.PARENTID,');
  dmStrat.qUnits.SQL.Add('   STRATUNITS.RANKID, STRATUNITS.AGEYEARS,');
  dmStrat.qUnits.SQL.Add('   APPLICLINK.UNITID, APPLICLINK.APPLICATIONID');
  dmStrat.qUnits.SQL.Add('FROM STRATUNITS,COUNTRIES,CONTINENTS,APPLICLINK,UNITFOR,USERSWHOFOR');
  dmStrat.qUnits.SQL.Add('WHERE CONTINENTS.CONTINENTID = COUNTRIES.CONTINENTID');
  dmStrat.qUnits.SQL.Add('AND USERSWHOFOR.USERID = :UserID ');
  dmStrat.qUnits.SQL.Add('AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID ');
  dmStrat.qUnits.SQL.Add('AND COUNTRIES.COUNTRYID = STRATUNITS.COUNTRYID');
  dmStrat.qUnits.SQL.Add('AND STRATUNITS.UNITID = APPLICLINK.UNITID');
  dmStrat.qUnits.SQL.Add('AND STRATUNITS.UNITID=UNITFOR.UNITID ');
  tempStr := 'AND STRATUNITS.APPROVALID <> '+''''+'HS'+'''';
  dmStrat.qUnits.SQL.Add(tempStr);
  tempStr := 'AND STRATUNITS.APPROVALID <> '+''''+'NA'+'''';
  dmStrat.qUnits.SQL.Add(tempStr);
  if not UserSession.IncludeSeams then
  begin
    tempStr := 'AND STRATUNITS.RANKID <> '+''''+'SEAM'+'''';
    dmStrat.qUnits.SQL.Add(tempStr);
    tempStr := 'AND STRATUNITS.RANKID <> '+''''+'REEF'+'''';
    dmStrat.qUnits.SQL.Add(tempStr);
  end;
  if (UserSession.ThisProgram = 'IGCP509') then dmStrat.qUnits.SQL.Add('AND APPLICLINK.APPLICATIONID = 2 ');
  if (UserSession.ThisProgram = 'StratDB') then dmStrat.qUnits.SQL.Add('AND APPLICLINK.APPLICATIONID = 1 ');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qUnits.SQL.Add('AND ( CONTINENTS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qUnits.SQL.Add('OR CONTINENTS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qUnits.SQL.Add('OR CONTINENTS.CONTINENTID = '+''''+'UND'+'''');
    dmStrat.qUnits.SQL.Add(' ) ');
  end;
  if (UserSession.IsDeveloper) then
  begin
    //dmUser.SetDeveloperData(dmStrat.qUnits.SQL.Text);
  end;
//  dmLIP.cdsLIPQ.Close;
//  dmLIP.cdsLIPQ.Open;
  //dmLIP.cdsLIPUnits.Edit;
  dmStrat.cdsUnits.Close;
  dmStrat.qUnits.Close;
  dmStrat.qUnits.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsUnits.Open;
  dmLIP.cdsLIPUnits.Close;
  dmLIP.cdsLIPUnits.Open;
end;

procedure TISFAddLIPUnitLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmLIP.cdsLIPUnits.Post;
    dmLIP.cdsLIPUnits.ApplyUpdates(0);
    dmLIP.cdsLIPQ.Close;
    dmLIP.cdsLIPQ.Open;
    dmLIP.cdsLIPUnits.Close;
    dmLIP.cdsLIPUnits.Open;
  end;
end;

procedure TISFAddLIPUnitLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmLIP.cdsLIPUnits.CancelUpdates;
  end;
end;

procedure TISFAddLIPUnitLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmLIP.cdsLIPUnits.Delete;
  dmLIP.cdsLIPUnits.ApplyUpdates(0);
end;

procedure TISFAddLIPUnitLink.iwbEditClick(Sender: TObject);
begin
  dmLIP.cdsLIPUnits.Edit;
end;

procedure TISFAddLIPUnitLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUnits.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLIPDetails.Create(WebApplication).Show;
end;

procedure TISFAddLIPUnitLink.IWButton1Click(Sender: TObject);
begin
  dmStrat.cdsUnits.Open;
end;

end.
