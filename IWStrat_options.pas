unit IWStrat_options;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  IWStrat_frTopBar, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWRegion;

type
  TISFOptions = class(TIWAppForm)
    iwbSavePreferences: TIWButton;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    iwrgLinkToDateView: TIWRadioGroup;
    lblShowAll: TIWLabel;
    iwrgIncludeSeams: TIWRadioGroup;
    TopBar: TISFTopBarStrat;
    procedure iwbSavePreferencesClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ;
  end;

implementation

uses ServerController, IWStrat_dmopt, IWStrat_uMain;

{$R *.dfm}


procedure TISFOptions.iwbSavePreferencesClick(Sender: TObject);
begin
  if Validate then
  begin
    ClearErrorMessages;
    case iwrgLinkToDateView.ItemIndex of
      0 : UserSession.LinkToDateView := true;
      1 : UserSession.LinkToDateView := false;
    end;
    case iwrgIncludeSeams.ItemIndex of
      0 : UserSession.IncludeSeams := true;
      1 : UserSession.IncludeSeams := false;
    end;
    if (UpperCase(UserSession.UserID) <> 'GUEST') then dmOpt.SetUserOptions;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    {
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    }
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
  end;
end;

procedure TISFOptions.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

procedure TISFOptions.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
  if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  ClearErrorMessages;
  if (UserSession.LinkToDateView=true) then
  begin
    iwrgLinkToDateView.ItemIndex := 0;
  end else
  begin
    iwrgLinkToDateView.ItemIndex := 1;
  end;
  if (UserSession.IncludeSeams=true) then
  begin
    iwrgIncludeSeams.ItemIndex := 0;
  end else
  begin
    iwrgIncludeSeams.ItemIndex := 1;
  end;
end;

procedure TISFOptions.iwbCancelClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  {
  if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
  }
  if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

function TISFOptions.Validate: Boolean;
var
  iCode : integer;
  temp : double;
begin
  Result := true;
  ClearErrorMessages;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFOptions.ClearErrorMessages;
begin
  lblShowAll.Visible := false;
end;

end.
