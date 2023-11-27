unit IWStrat_ductilities;

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
  TISFDuctilities = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1DuctilityTypeID: TStringField;
    FDMemTable1DuctilityType: TStringField;
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




procedure TISFDuctilities.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.cdsDuctilities.Open;
end;

procedure TISFDuctilities.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsDuctilities.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsDuctilities.RecordCount > iwDBg.RowLimit);
end;

procedure TISFDuctilities.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsDuctilities.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDuctilities.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsDuctilities.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFDuctilities.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsDuctilities.MoveBy(iwDBg.RowLimit);
end;

procedure TISFDuctilities.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsDuctilities.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFDuctilities.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsDuctilities.First;
  repeat
    FDMemTable1.AppendRecord([dmStrat.cdsDuctilitiesDUCTILITYTYPEID.AsVariant,dmStrat.cdsDuctilitiesDUCTILITYTYPE.AsVariant]);
    dmStrat.cdsDuctilities.Next;
  until dmStrat.cdsDuctilities.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBDuctilities.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDuctilities.xlsx';
  frFileNameStr := 'Ductilities.xlsx';
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
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.
