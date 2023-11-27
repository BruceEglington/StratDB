unit IWStrat_metamorphicgrades;

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
  TISFMetamorphicGrades = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1GradeID: TStringField;
    FDMemTable1Grade: TStringField;
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
  ServerController, DBClient, IWStrat_dmC, IWStrat_uMain, IWStrat_constants;




procedure TISFMetamorphicGrades.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStratC.cdsMetamorphicGrade.Open;
end;

procedure TISFMetamorphicGrades.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStratC.cdsMetamorphicGrade.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStratC.cdsMetamorphicGrade.RecordCount > iwDBg.RowLimit);
end;

procedure TISFMetamorphicGrades.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStratC.cdsMetamorphicGrade.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFMetamorphicGrades.iwlPrevPageClick(Sender: TObject);
begin
  dmStratC.cdsMetamorphicGrade.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFMetamorphicGrades.iwlNextPageClick(Sender: TObject);
begin
  dmStratC.cdsMetamorphicGrade.MoveBy(iwDBg.RowLimit);
end;

procedure TISFMetamorphicGrades.iwbCloseClick(Sender: TObject);
begin
  dmStratC.cdsMetamorphicGrade.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFMetamorphicGrades.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStratC.cdsMetamorphicGrade.First;
  repeat
    FDMemTable1.InsertRecord([dmStratC.cdsMetamorphicGradeGRADEID.AsVariant,dmStratC.cdsMetamorphicGradeGRADE.AsVariant]);
    dmStratC.cdsMetamorphicGrade.Next;
  until dmStratC.cdsMetamorphicGrade.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBMetamorphicGrades.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBMetamorphicGrades.xlsx';
  frFileNameStr := 'MetamorphicGrades.xlsx';
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
