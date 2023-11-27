unit IWStrat_timescale;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  DB,
  IWStrat_frTopBar, IWCompListbox,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWDBStdCtrls;

type
  TISFTimescale = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwbReturn: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    IWDBNavigator1: TIWDBNavigator;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants,
  IWStrat_dm;




procedure TISFTimescale.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qPeriods.Close;
  dmStrat.cdsPeriods.Close;
  dmStrat.cdsPeriods.Open;

end;

procedure TISFTimescale.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbAddNew.Visible := ((UserSession.CanModify) and (dmStrat.cdsPeriods.State in [dsBrowse]));
  iwbApplyUpdates.Visible := ((UserSession.CanModify) and (dmStrat.cdsPeriods.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := ((UserSession.CanModify) and (dmStrat.cdsPeriods.State in [dsEdit,dsInsert]));
  iwbReturn.Visible := (dmStrat.cdsPeriods.State in [dsBrowse]);
end;

procedure TISFTimescale.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsPeriods.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFTimescale.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsPeriods.ApplyUpdates(0);
  except
  end;
end;

procedure TISFTimescale.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsPeriods.CancelUpdates;
  except
  end;
end;

procedure TISFTimescale.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsPeriods.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFTimescale.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStrat.cdsPRep1.Open;
  dmStrat.cdsPRep2.Open;
  dmStrat.cdsPRep3.Open;
  dmStrat.cdsPRep4.Open;
  //dmStrat.FlexCelReportPeriods.Template := DefaultFlexCellFolder+'FlxStratDBPeriods.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBPeriods.xlsx';
  frFileNameStr := 'Timescale.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsPRep1',dmStrat.cdsPRep1);
    fr.AddTable('cdsPRep2',dmStrat.cdsPRep2);
    fr.AddTable('cdsPRep3',dmStrat.cdsPRep3);
    fr.AddTable('cdsPRep4',dmStrat.cdsPRep4);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStrat.cdsPRep1.Close;
        dmStrat.cdsPRep2.Close;
        dmStrat.cdsPRep3.Close;
        dmStrat.cdsPRep4.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.
