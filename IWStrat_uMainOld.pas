{
  ISFMain main user window

  This is the first page the user sees when accessing this application.
}

unit IWStrat_uMainOld;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompButton, Forms,
  IWCompRectangle, IWCompLabel, IWDBStdCtrls,
  IWCompText, IWExtCtrls,
  IWCompMemo, IWCompCheckbox, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion,  IWStrat_frTopBar,
  IWHTMLControls, IWStrat_frProductTree;

type
  TISFMain = class(TIWAppForm)
    lblWelcome: TIWLabel;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBLabel1: TIWDBLabel;
    IWDBMemo1: TIWDBMemo;
    LeftTree: TISFProductTree;
    iwlNumUses: TIWLabel;
    IWRegion1: TIWRegion;
    iwRHeader: TIWRegion;
    iwRFooter: TIWRegion;
    iwRMemo: TIWRegion;
    IWFrameRegion: TIWRegion;
    rectBlackTop: TIWRectangle;
    rectRedTop: TIWRectangle;
    lnkSignIn: TIWLink;
    IWRectangleTitle: TIWRectangle;
    IWLabel2: TIWLabel;
    iwlSignOut: TIWLink;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure LeftTreeiwlDefineQueryClick(Sender: TObject);
  public
  protected
    procedure LoadWelcomeMessage;
  end;

type
  TISFMainClass = class of TISFMain;

implementation
{$R *.dfm}

uses
  ServerController, usrIW_dm, IWHTMLControls, IWColor, Graphics,
  IWBaseForm, jpeg, IWStrat_dm, IWStrat_constants;

procedure TISFMain.IWAppFormCreate(Sender: TObject);
begin
  UserSession.ThisProgram := 'StratDB';
  LoadWelcomeMessage;
end;

procedure TISFMain.LoadWelcomeMessage;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmUser.qProgress.Close;
  dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
  dmUser.cdsProgress.Close;
  dmUser.cdsProgress.Open;
end;

procedure TISFMain.IWAppFormRender(Sender: TObject);
begin
  LeftTree.iwregPageLinks.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.IsDeveloper then
  begin
    dmUser.qNumTimesUsed.Close;
    dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsNumTimesUsed.Close;
    dmUser.cdsNumTimesUsed.Open;
    iwlNumUses.Caption := 'This program has been used '+dmUser.cdsNumTimesUsedNUMTIMESUSED.AsString+' times';
    dmUser.cdsNumTimesUsed.Close;
  end else
  begin
    iwlNumUses.Caption := '';
  end;
end;

procedure TISFMain.LeftTreeiwlDefineQueryClick(Sender: TObject);
begin
  LeftTree.iwlDefineQueryClick(Sender);

end;

initialization
  TISFMain.SetAsMainForm;
end.
