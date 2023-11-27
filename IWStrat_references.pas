unit IWStrat_references;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, 
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWCompEdit, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWVCLBaseControl, IWBaseHTMLControl,
  IWCompLabel, IWStrat_frTopBar, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, DB, IWRegion;

type
  TISFReferences = class(TIWAppForm)
    TopBar: TISFTopBarStrat;
    IWRegion2: TIWRegion;
    rectLeft: TIWRectangle;
    IWRegion4: TIWRegion;
    IWRegion1: TIWRegion;
    iwbAddNewReference: TIWButton;
    iwbReturn: TIWButton;
    IWRegion3: TIWRegion;
    iwlSortedBy: TIWLabel;
    iwlLastPage: TIWLink;
    iwlFirstPage: TIWLink;
    iwlOf: TIWLabel;
    iwlNextPage: TIWLink;
    iwlPageNum: TIWLabel;
    iwlPageNumTotal: TIWLabel;
    iwlPrevPage: TIWLink;
    iwDBgReferences: TIWDBGrid;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwDBgReferencesColumns1Click(ASender: TObject;
      const AValue: String);
    procedure iwbAddNewReferenceClick(Sender: TObject);
    procedure iwDBgReferencesColumns0TitleClick(Sender: TObject);
    procedure iwlFirstPageClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwlLastPageClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_refdetail, IWStrat_dm, IWStrat_uMain,
  IWStrat_constants, usrIW_dm;




procedure TISFReferences.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbReturn.Visible := (dmStrat.cdsReferences.State in [dsBrowse]);
  iwbAddNewReference.Visible := (UserSession.CanModify and (dmStrat.cdsReferences.State in [dsBrowse]));
  iwlPageNum.Caption := IntToStr(UserSession.PageNum);
end;

procedure TISFReferences.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
  iwlPrevPage.Visible := false;
  iwlNextPage.Visible := false;
  iwlFirstPage.Visible := false;
  iwlLastPage.Visible := false;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  UserSession.NumRecordsFound := 0;
  {References}
  dmStrat.qReferences.Close;
  dmStrat.qReferences.SQL.Clear;
  dmStrat.qReferences.SQL.Add('SELECT DISTINCT SOURCELIST.SOURCENUM, SOURCELIST.SOURCESHORT, SOURCELIST.CONTINENTID,');
  dmStrat.qReferences.SQL.Add('  CONTINENTS.CONTINENT, SOURCELIST.SOURCEYEAR');
  dmStrat.qReferences.SQL.Add('FROM SOURCELIST,CONTINENTS');
  dmStrat.qReferences.SQL.Add('WHERE CONTINENTS.CONTINENTID = SOURCELIST.CONTINENTID');
  dmStrat.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT >= :FirstReference');
  dmStrat.qReferences.SQL.Add('AND SOURCELIST.SOURCESHORT <= :LastReference');
  dmStrat.qReferences.SQL.Add('AND ( SOURCELIST.CONTINENTID = '+''''+ValueForUndefinedContinentID+'''');
  if (UserSession.IncludeContinentValues) then
  begin
    if (UserSession.ContinentValues.Count > 0) then
    begin
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qReferences.SQL.Add('OR SOURCELIST.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
  end;
  dmStrat.qReferences.SQL.Add(' ) ');
  dmStrat.qReferences.SQL.Add('ORDER BY SOURCELIST.SOURCESHORT ');
  dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := UserSession.ReferenceStartFrom;
  dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := UserSession.ReferenceEndWith;
  dmStrat.cdsReferences.Close;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStrat.qReferences.SQL.Text);
  end;
  dmStrat.cdsReferences.Open;
  UserSession.NumRecordsFound := dmStrat.cdsReferences.RecordCount;
  if (UserSession.ParameterChosen = NothingChosen) then
  begin
  end else
  begin
    try
      dmStrat.cdsReferences.Locate('SOURCEShort',UserSession.ParameterChosen,[]);
    except
    end;
  end;
  dmStrat.cdsContinents.Open;
  dmStrat.cdsCountries.Open;
  //iwlPrevPage.Visible := (dmStrat.cdsReferences.RecordCount > iwDBgReferences.RowLimit);
  //iwlNextPage.Visible := (dmStrat.cdsReferences.RecordCount > iwDBgReferences.RowLimit);
  iwlPrevPage.Visible := (UserSession.NumRecordsFound > iwDBgReferences.RowLimit);
  iwlNextPage.Visible := (UserSession.NumRecordsFound > iwDBgReferences.RowLimit);
  iwlFirstPage.Visible := (UserSession.NumRecordsFound > iwDBgReferences.RowLimit);
  iwlLastPage.Visible := (UserSession.NumRecordsFound > iwDBgReferences.RowLimit);
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := UserSession.NumRecordsFound div iwDBgReferences.RowLimit;
  if ((UserSession.NumRecordsFound mod iwDBgReferences.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
  iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
end;

procedure TISFReferences.iwbReturnClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFReferences.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsReferences.Post;
  except
  end;
  try
    dmStrat.cdsReferences.ApplyUpdates(0);
  except
  end;
end;

procedure TISFReferences.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsReferences.CancelUpdates;
  except
  end;
end;

procedure TISFReferences.iwDBgReferencesColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.UnitSender := usReferences;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFRefDetails.Create(WebApplication).Show;
end;

procedure TISFReferences.iwbAddNewReferenceClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.SubmitNewReference(WasSuccessful);
  if WasSuccessful then
  begin
    try
      dmStrat.qReferences.Close;
      dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'NEW'+UserSession.UserID;
      dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := 'NEW'+UserSession.UserID;
      dmStrat.cdsReferences.Close;
      dmStrat.cdsReferences.Open;
      UserSession.ParameterChosen := dmStrat.cdsReferencesSOURCENUM.AsString;
      dmStrat.cdsContinents.Open;
      dmStrat.cdsCountries.Open;
    except
      WebApplication.ShowMessage('Not able to find new Reference',smAlert);
    end;
  end else
  begin
    WebApplication.ShowMessage('Not able to create record for new Reference',smAlert);
  end;
  if WasSuccessful then
  begin
    try
      UserSession.UnitSender := usReferences;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TISFRefDetails.Create(WebApplication).Show;
    except
    end;
  end;
end;

procedure TISFReferences.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsReferences.MoveBy(-1*iwDBgReferences.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFReferences.iwlFirstPageClick(Sender: TObject);
begin
  dmStrat.cdsReferences.First;
  UserSession.PageNum := 1;
end;

procedure TISFReferences.iwlLastPageClick(Sender: TObject);
begin
  dmStrat.cdsReferences.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFReferences.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsReferences.MoveBy(iwDBgReferences.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFReferences.iwDBgReferencesColumns0TitleClick(
  Sender: TObject);
begin
  dmStrat.cdsReferences.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

end.
