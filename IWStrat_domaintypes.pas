unit IWStrat_domaintypes;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  IWStrat_frTopBar, IWCompListbox,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWDBStdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFDomainTypes = class(TIWAppForm)
    iwDBg: TIWDBGrid;
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
    FDMemTable1: TFDMemTable;
    FDMemTable1DomainTypeID: TStringField;
    FDMemTable1DomainType: TStringField;
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
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_dmC, IWStrat_uMain, IWStrat_constants;




procedure TISFDomainTypes.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStratC.cdsDomainTypes.Open;
  {
  dmStratC.qDomainTypes.Close;
  dmStratC.qDomainTypes.ParamByName('CONTINENTID').AsString := 'AFR';
  dmStratC.cdsDomainTypes.Close;
  dmStratC.cdsDomainTypes.Open;
  }
end;

procedure TISFDomainTypes.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStratC.cdsDomainTypes.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStratC.cdsDomainTypes.RecordCount > iwDBg.RowLimit);
end;

procedure TISFDomainTypes.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStratC.cdsDomainTypes.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainTypes.iwlPrevPageClick(Sender: TObject);
begin
  dmStratC.cdsDomainTypes.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFDomainTypes.iwlNextPageClick(Sender: TObject);
begin
  dmStratC.cdsDomainTypes.MoveBy(iwDBg.RowLimit);
end;

procedure TISFDomainTypes.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStratC.cdsDomainTypes.Append;
    dmStratC.cdsDomainTypesDOMAINTYPEID.AsString := 'NEW';
    dmStratC.cdsDomainTypesDOMAINTYPE.AsString := 'NEW';
    dmStratC.cdsDomainTypes.Post;
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

procedure TISFDomainTypes.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsDomainTypes.ApplyUpdates(0);
  except
  end;
end;

procedure TISFDomainTypes.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsDomainTypes.CancelUpdates;
  except
  end;
end;

procedure TISFDomainTypes.iwbCloseClick(Sender: TObject);
begin
  dmStratC.cdsDomainTypes.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFDomainTypes.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStratC.cdsDomainTypes.First;
  repeat
    FDMemTable1.AppendRecord([dmStratC.cdsDomainTypesDOMAINTYPEID.AsVariant,dmStratC.cdsDomainTypesDOMAINTYPE.AsVariant]);
    dmStratC.cdsDomainTypes.Next;
  until dmStratC.cdsDomainTypes.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBDomainTypes.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDomainTypes.xlsx';
  frFileNameStr := 'DomainTypes.xlsx';
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
