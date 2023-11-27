object ISFMain: TISFMain
  Left = 0
  Top = 0
  Width = 831
  Height = 573
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'StratDB'
  PreventBackButton = True
  OnCreate = IWAppFormCreate
  Background.Filename = 
    'W:\source\IntraWeb6.0\Demos\Win32\Delphi\DieFlyDie\Files\grid_ba' +
    'ckground.gif'
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  StyleSheet.Filename = 'styles.css'
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWRegion1: TIWRegion
    Left = 200
    Top = 55
    Width = 631
    Height = 518
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwRFooter: TIWRegion
      Left = 0
      Top = 453
      Width = 631
      Height = 65
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alBottom
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      DesignSize = (
        631
        65)
      object iwlDeveloperName: TIWLabel
        Left = 22
        Top = 9
        Width = 113
        Height = 15
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlDeveloperName'
        Caption = 'Dr Bruce Eglington'
      end
      object iwlDeveloperEmail: TIWLabel
        Left = 22
        Top = 46
        Width = 141
        Height = 14
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlDeveloperEmail'
        Caption = 'bruce.eglington@usask.ca'
      end
      object iwlNumUses: TIWLabel
        Left = 491
        Top = 54
        Width = 155
        Height = 14
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNumUses'
        Caption = 'This program has been used '
      end
      object iwbPermissions: TIWButton
        Left = 264
        Top = 13
        Width = 117
        Height = 25
        Visible = False
        Caption = 'Permissions'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbPermissions'
        TabOrder = 2
        OnClick = iwbPermissionsClick
      end
      object iwbCheckIniFile: TIWButton
        Left = 264
        Top = 40
        Width = 117
        Height = 25
        Visible = False
        Caption = 'Check IniFile'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbCheckIniFile'
        TabOrder = 3
        OnClick = iwbCheckIniFileClick
      end
      object IWButton1: TIWButton
        Left = 456
        Top = 18
        Width = 120
        Height = 30
        Visible = False
        Caption = 'IWButton1'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWButton1'
        TabOrder = 4
        OnClick = IWButton1Click
      end
      object iwdbgDevInfo: TIWDBGrid
        Left = 600
        Top = 16
        Width = 400
        Height = 150
        Visible = False
        BorderColors.Color = clNone
        BorderColors.Light = clNone
        BorderColors.Dark = clNone
        BGColor = clNone
        BorderSize = 0
        BorderStyle = tfDefault
        CellPadding = 0
        CellSpacing = 0
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FrameBuffer = 40
        Lines = tlAll
        UseFrame = True
        UseSize = False
        ScrollToCurrentRow = False
        Columns = <
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DEVINFOORDER'
            LinkField = 'DEVINFOORDER'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'DEVINFOORDER'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'DATESAVED'
            LinkField = 'DATESAVED'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'DATESAVED'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'QUERYCHECK'
            LinkField = 'QUERYCHECK'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'QUERYCHECK'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end>
        DataSource = dmUser.dsDevInfo
        FooterRowCount = 0
        FriendlyName = 'iwdbgDevInfo'
        FromStart = True
        HighlightColor = clNone
        HighlightRows = False
        Options = [dgShowTitles]
        RefreshMode = rmAutomatic
        RowLimit = 0
        RollOver = True
        RowClick = False
        RollOverColor = clInfoBk
        RowHeaderColor = clNone
        RowAlternateColor = clNone
        RowCurrentColor = clNone
      end
      object IWButton2: TIWButton
        Left = 330
        Top = 6
        Width = 120
        Height = 30
        Visible = False
        Caption = 'IWButton2'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWButton2'
        TabOrder = 6
        OnClick = IWButton2Click
      end
      object iwlProgressDate: TIWLabel
        Left = 22
        Top = 30
        Width = 150
        Height = 14
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        AutoSize = False
        FriendlyName = 'iwlProgressDate'
        Caption = 'yyyy-mm-dd'
      end
    end
    object IWRegion4: TIWRegion
      Left = 0
      Top = 0
      Width = 631
      Height = 453
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      RenderInvisibleControls = False
      TabOrder = 5
      Align = alClient
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwRHeader: TIWRegion
        Left = 0
        Top = 0
        Width = 631
        Height = 60
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object lblWelcome: TIWLabel
          Left = 10
          Top = 18
          Width = 338
          Height = 22
          ZIndex = 1
          Font.Color = clWebCORNFLOWERBLUE
          Font.FontName = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          NoWrap = True
          HasTabOrder = False
          FriendlyName = 'lblWelcome'
          Caption = 'Welcome to this database system'
        end
      end
      object iwRMemo: TIWRegion
        Left = 0
        Top = 60
        Width = 631
        Height = 393
        RenderInvisibleControls = False
        TabOrder = 1
        Align = alClient
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        ClipRegion = False
        object IWDBMemo1: TIWDBMemo
          Left = 13
          Top = 0
          Width = 596
          Height = 393
          Align = alClient
          StyleRenderOptions.RenderBorder = False
          BGColor = clWebWHITE
          Editable = False
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          InvisibleBorder = True
          HorizScrollBar = False
          VertScrollBar = True
          Required = False
          SubmitOnAsyncEvent = True
          AutoEditable = False
          DataField = 'PROGRESSDETAILS'
          DataSource = dmUser.dsProgress
          FriendlyName = 'IWDBMemo1'
          ExplicitLeft = 7
          ExplicitTop = -6
          ExplicitHeight = 377
        end
        object IWRegion2: TIWRegion
          Left = 0
          Top = 0
          Width = 13
          Height = 393
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
        object IWRegion3: TIWRegion
          Left = 609
          Top = 0
          Width = 22
          Height = 393
          RenderInvisibleControls = False
          Align = alRight
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
      end
    end
  end
  object IWRegion5: TIWRegion
    Left = 0
    Top = 55
    Width = 200
    Height = 518
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    inline FrameMenu: TISFFrameMenu
      Left = 0
      Top = 0
      Width = 200
      Height = 518
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alLeft
      AutoScroll = True
      TabOrder = 0
      TabStop = True
      ExplicitWidth = 200
      ExplicitHeight = 518
      inherited IWFrameRegion: TIWRegion
        Width = 200
        Height = 518
        TabOrder = 7
        ExplicitWidth = 200
        ExplicitHeight = 518
        inherited IWRegion1: TIWRegion
          Width = 200
          Height = 518
          ExplicitWidth = 200
          ExplicitHeight = 518
          inherited IWMenu1: TIWMenu
            Height = 438
            ExplicitHeight = 438
          end
          inherited IWRegion2: TIWRegion
            Width = 200
            ExplicitWidth = 200
            inherited IWRegion3: TIWRegion
              Width = 200
              ExplicitWidth = 200
              inherited IWImageIGCP509: TIWImage
                Width = 200
                ExplicitWidth = 200
              end
            end
          end
        end
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 831
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 55
    Constraints.MinHeight = 55
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    TabStop = True
    ExplicitWidth = 831
    inherited IWFrameRegion: TIWRegion
      Width = 831
      TabOrder = 8
      ExplicitWidth = 831
      inherited iwrHeader: TIWRegion
        Width = 831
        ExplicitWidth = 831
        inherited iwrWelcome: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwrDisplayUserName: TIWRegion
            Width = 631
            ExplicitWidth = 631
            inherited lblWelcome: TIWLabel
              Left = 358
              NoWrap = True
              ExplicitLeft = 606
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
