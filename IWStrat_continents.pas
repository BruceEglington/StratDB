unit IWStrat_continents;

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
  TISFContinents = class(TIWAppForm)
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    iwDBg: TIWDBGrid;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1ContinentID: TStringField;
    FDMemTable1Continent: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dm;




procedure TISFContinents.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qContinents.Close;
  dmStrat.cdsContinents.Close;
  dmStrat.cdsContinents.Open;
end;

procedure TISFContinents.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbAddNew.Visible := (UserSession.IsDeveloper and (dmStrat.cdsContinents.State in [dsBrowse]));
  //iwbApplyUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsContinents.State in [dsEdit]));
  //iwbCancelUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsContinents.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsContinents.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsContinents.RecordCount > iwDBg.RowLimit);
end;

procedure TISFContinents.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsContinents.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFContinents.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsContinents.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFContinents.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsContinents.MoveBy(iwDBg.RowLimit);
end;

procedure TISFContinents.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsContinents.ApplyUpdates(0);
  except
  end;
end;

procedure TISFContinents.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsContinents.CancelUpdates;
  except
  end;
end;

procedure TISFContinents.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFContinents.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsContinents.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsContinentsCONTINENTID.AsVariant,dmStrat.cdsContinentsCONTINENT.AsVariant]);
    dmStrat.cdsContinents.Next;
  until dmStrat.cdsContinents.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBContinents.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBContinents.xlsx';
  frFileNameStr := 'Continents.xlsx';
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

procedure TISFContinents.iwDBgColumns1Click(ASender: TObject; const AValue: string);
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
