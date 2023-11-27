unit IWStrat_ranks;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, DB,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWStrat_frTopBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFRanks = class(TIWAppForm)
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBarStrat;
    iwDBg: TIWDBGrid;
    FDMemTable1: TFDMemTable;
    FDMemTable1RankID: TStringField;
    FDMemTable1RankWidth: TIntegerField;
    FDMemTable1Rank: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dm;




procedure TISFRanks.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qRanks.Close;
  dmStrat.cdsRanks.Close;
  dmStrat.cdsRanks.Open;
end;

procedure TISFRanks.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbAddNew.Visible := (UserSession.IsDeveloper and (dmStrat.cdsRanks.State in [dsBrowse]));
  //iwbApplyUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsRanks.State in [dsEdit]));
  //iwbCancelUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsRanks.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsRanks.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsRanks.RecordCount > iwDBg.RowLimit);
end;

procedure TISFRanks.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsRanks.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFRanks.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsRanks.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFRanks.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsRanks.MoveBy(iwDBg.RowLimit);
end;

procedure TISFRanks.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStrat.cdsRanks.Append;
    dmStrat.cdsRanksRANKID.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsRanksUNITRANK.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsRanksRANKWIDTH.AsInteger := 0;
    dmStrat.cdsRanks.Post;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
  {
  try
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFProvinceEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new chart record',smAlert);
  end;
  }
end;

procedure TISFRanks.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsRanks.ApplyUpdates(0);
  except
  end;
end;

procedure TISFRanks.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsRanks.CancelUpdates;
  except
  end;
end;

procedure TISFRanks.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsRanks.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFRanks.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsRanks.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsRanksRANKID.AsVariant,dmStrat.cdsRanksRANKWIDTH.AsVariant,dmStrat.cdsRanksUNITRANK.AsVariant]);
    dmStrat.cdsRanks.Next;
  until dmStrat.cdsRanks.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBRanks.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBRanks.xlsx';
  frFileNameStr := 'UnitRanks.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFRanks.iwDBgColumns1Click(ASender: TObject; const AValue: string);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFProvinceEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
