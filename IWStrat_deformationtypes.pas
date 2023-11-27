unit IWStrat_deformationtypes;

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
  TISFDeformationTypes = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1DeformationTypeID: TIntegerField;
    FDMemTable1DeformationType: TStringField;
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




procedure TISFDeformationTypes.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.cdsOrogenyTypes.Open;
end;

procedure TISFDeformationTypes.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsOrogenyTypes.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsOrogenyTypes.RecordCount > iwDBg.RowLimit);
end;

procedure TISFDeformationTypes.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsOrogenyTypes.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDeformationTypes.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsOrogenyTypes.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFDeformationTypes.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsOrogenyTypes.MoveBy(iwDBg.RowLimit);
end;

procedure TISFDeformationTypes.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsOrogenyTypes.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFDeformationTypes.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsOrogenyTypes.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsOrogenyTypesDEFORMATIONTYPEID.AsVariant,dmStrat.cdsOrogenyTypesDEFORMATIONTYPE.AsVariant]);
    dmStrat.cdsOrogenyTypes.Next;
  until dmStrat.cdsOrogenyTypes.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBOrogenyTypes.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBOrogenyTypes.xlsx';
  frFileNameStr := 'OrogenyTypes.xlsx';
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
