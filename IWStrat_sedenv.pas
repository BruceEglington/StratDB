unit IWStrat_sedenv;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWStrat_frTopBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFSedEnv = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1DepositionEnvironmentID: TStringField;
    FDMemTable1DepositionEnvironment: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_dm, IWStrat_uMain, IWStrat_constants;




procedure TISFSedEnv.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.cdsSedEnvironments.Open;
end;

procedure TISFSedEnv.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsSedEnvironments.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsSedEnvironments.RecordCount > iwDBg.RowLimit);
end;

procedure TISFSedEnv.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSedEnvironments.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFSedEnv.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsSedEnvironments.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFSedEnv.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsSedEnvironments.MoveBy(iwDBg.RowLimit);
end;

procedure TISFSedEnv.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsSedEnvironments.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFSedEnv.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsSedEnvironments.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsSedEnvironmentsDEPOSITIONENVIRONMENTID.AsVariant,dmStrat.cdsSedEnvironmentsDEPOSITIONENVIRONMENT.AsVariant]);
    dmStrat.cdsSedEnvironments.Next;
  until dmStrat.cdsSedEnvironments.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBSedEnvironments.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBSedEnvironments.xlsx';
  frFileNameStr := 'SedimentaryEnvironments.xlsx';
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

end.
