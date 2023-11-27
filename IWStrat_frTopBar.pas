unit IWStrat_frTopBar;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWCompExtCtrls, IWHTMLControls,
  IWCompLabel, IWHTMLTag, IWCompEdit, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, IWHTML40Container;

type
  TISFTopBarStrat = class(TFrame)
    IWFrameRegion: TIWRegion;
    iwrHeader: TIWRegion;
    iwrWelcome: TIWRegion;
    iwrLeftBlock: TIWRegion;
    iwrDisplayUserName: TIWRegion;
    lblWelcome: TIWLabel;
    iwrSignInOut: TIWRegion;
    iwlSignOut: TIWLink;
    lnkSignIn: TIWLink;
    lblProgTitle: TIWLabel;
    procedure SignIn(Sender: TObject);
    procedure iwlSignOutClick(Sender: TObject);
    procedure iwlDonateClick(Sender: TObject);
  private
  public
  end;

implementation
{$R *.dfm}

uses
  IWInit, IWAppForm,
  ServerController,
  IWApplication, usr_constants, usr_uDBInterface;

procedure TISFTopBarStrat.SignIn(Sender: TObject);
begin
  UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
end;



procedure TISFTopBarStrat.iwlSignOutClick(Sender: TObject);
begin
  try
    //WebApplication.ShowMessage(GetURLonTerminate(UserSession.ThisProgram));
    //WebApplication.ShowMessage(URLonTerminate);
    UserSession.SetCookies;
  finally
    //WebApplication.ShowMessage(GetURLonTerminate(UserSession.ThisProgram));
    //WebApplication.ShowMessage(URLonTerminate);
    WebApplication.TerminateAndRedirect(URLonTerminate);
  end;
end;

procedure TISFTopBarStrat.iwlDonateClick(Sender: TObject);
begin
 //UserSession.MakeDonation(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
end;

end.

