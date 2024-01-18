object ISFMain: TISFMain
  Left = 0
  Top = 0
  Width = 788
  Height = 531
  OnRender = IWAppFormRender
  ConnectionMode = cmAny
  Title = 'User Control'
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  BrowserSecurityCheck = True
  Background.Filename = 
    'W:\source\IntraWeb6.0\Demos\Win32\Delphi\DieFlyDie\Files\grid_ba' +
    'ckground.gif'
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  StyleSheet.Filename = 'styles.css'
  ShowHint = True
  XPTheme = True
  DesignLeft = 26
  DesignTop = 96
  inline LeftTree: TISFProductTree
    Left = 0
    Top = 57
    Width = 142
    Height = 474
    Align = alLeft
    Constraints.MaxWidth = 142
    Constraints.MinWidth = 142
    Color = clNone
    ParentColor = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    inherited IWFrameRegion: TIWRegion
      Height = 474
      TabOrder = 4
      inherited rectRight: TIWRectangle
        Height = 472
      end
      inherited iwregPageLinks: TIWRegion
        Height = 341
        inherited iwlDefineQuery: TIWLink
          OnClick = LeftTreeiwlDefineQueryClick
        end
      end
    end
  end
  object IWRegion1: TIWRegion
    Left = 142
    Top = 57
    Width = 646
    Height = 474
    Cursor = crAuto
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    object iwRHeader: TIWRegion
      Left = 1
      Top = 1
      Width = 644
      Height = 60
      Cursor = crAuto
      Align = alTop
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      Color = clNone
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      object lblWelcome: TIWLabel
        Left = 10
        Top = 18
        Width = 438
        Height = 22
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 1
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clWebCORNFLOWERBLUE
        Font.FontName = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        NoWrap = False
        FriendlyName = 'lblWelcome'
        Caption = 'Welcome to this stratigraphic unit database'
        RawText = False
      end
    end
    object iwRFooter: TIWRegion
      Left = 1
      Top = 413
      Width = 644
      Height = 60
      Cursor = crAuto
      Align = alBottom
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      Color = clNone
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      DesignSize = (
        644
        60)
      object IWDBLabel1: TIWDBLabel
        Left = 22
        Top = 21
        Width = 108
        Height = 15
        Cursor = crAuto
        Anchors = [akLeft, akTop, akBottom]
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = False
        DataField = 'PROGRESSDATE'
        DataSource = dmUser.dsProgress
        FriendlyName = 'IWDBLabel1'
      end
      object IWLabel1: TIWLabel
        Left = 22
        Top = 1
        Width = 113
        Height = 15
        Cursor = crAuto
        Anchors = [akLeft, akTop, akBottom]
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = False
        FriendlyName = 'IWLabel1'
        Caption = 'Dr Bruce Eglington'
        RawText = False
      end
      object IWLabel3: TIWLabel
        Left = 22
        Top = 38
        Width = 141
        Height = 14
        Cursor = crAuto
        Anchors = [akLeft, akTop, akBottom]
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = False
        FriendlyName = 'IWLabel3'
        Caption = 'bruce.eglington@usask.ca'
        RawText = False
      end
      object iwlNumUses: TIWLabel
        Left = 489
        Top = 42
        Width = 155
        Height = 14
        Cursor = crAuto
        Anchors = [akLeft, akTop, akRight, akBottom]
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = False
        FriendlyName = 'iwlNumUses'
        Caption = 'This program has been used '
        RawText = False
      end
    end
    object iwRMemo: TIWRegion
      Left = 1
      Top = 61
      Width = 644
      Height = 352
      Cursor = crAuto
      Align = alClient
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      Color = clNone
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      DesignSize = (
        644
        352)
      object IWDBMemo1: TIWDBMemo
        Left = 24
        Top = 12
        Width = 599
        Height = 321
        Cursor = crAuto
        Anchors = [akLeft, akTop, akRight, akBottom]
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        BGColor = clWebWHITE
        Editable = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        ScriptEvents = <>
        InvisibleBorder = False
        HorizScrollBar = False
        VertScrollBar = True
        Required = False
        TabOrder = 0
        AutoEditable = False
        DataField = 'PROGRESSDETAILS'
        DataSource = dmUser.dsProgress
        FriendlyName = 'IWDBMemo1'
      end
    end
  end
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 788
    Height = 57
    Cursor = crAuto
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    TabOrder = 0
    Align = alTop
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    Color = clWebALICEBLUE
    ParentShowHint = False
    ShowHint = True
    ZIndex = -1
    DesignSize = (
      788
      57)
    object rectBlackTop: TIWRectangle
      Left = 1
      Top = 37
      Width = 142
      Height = 18
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Font.Color = clWebBLACK
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = []
      BorderOptions.Color = clNone
      BorderOptions.Width = 0
      FriendlyName = 'rectBlackTop'
      Color = clWebLIGHTSLATEGRAY
      Alignment = taLeftJustify
      VAlign = vaMiddle
    end
    object rectRedTop: TIWRectangle
      Left = 142
      Top = 37
      Width = 646
      Height = 18
      Cursor = crAuto
      Anchors = [akLeft, akTop, akRight]
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Font.Color = clWebBLACK
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = []
      BorderOptions.Color = clNone
      BorderOptions.Width = 0
      FriendlyName = 'rectRedTop'
      Color = clWebLIGHTSTEELBLUE
      Alignment = taLeftJustify
      VAlign = vaBottom
    end
    object lnkSignIn: TIWLink
      Left = 530
      Top = 10
      Width = 53
      Height = 17
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      Color = clNone
      Font.Color = clWebBLUE
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      ScriptEvents = <>
      DoSubmitValidation = False
      FriendlyName = 'lnkSignIn'
      TabOrder = 9
      RawText = False
      Caption = 'Log In'
    end
    object IWRectangleTitle: TIWRectangle
      Left = 1
      Top = 4
      Width = 496
      Height = 29
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Text = '.   Stratigraphic Unit Database'
      Font.Color = clWebCORNFLOWERBLUE
      Font.FontName = 'Arial'
      Font.Size = 14
      Font.Style = [fsBold]
      BorderOptions.Color = clNone
      BorderOptions.Width = 0
      FriendlyName = 'IWRectangleTitle'
      Color = clWebLIGHTBLUE
      Alignment = taLeftJustify
      VAlign = vaMiddle
    end
    object IWLabel2: TIWLabel
      Left = 150
      Top = 38
      Width = 62
      Height = 15
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clWebTEAL
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = [fsBold]
      NoWrap = False
      FriendlyName = 'lblWelcome'
      Caption = ' Welcome'
      RawText = False
    end
    object iwlSignOut: TIWLink
      Left = 606
      Top = 10
      Width = 53
      Height = 17
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      Color = clNone
      Font.Color = clWebBLUE
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      ScriptEvents = <>
      DoSubmitValidation = False
      FriendlyName = 'iwlSignOut'
      TabOrder = 12
      RawText = False
      Caption = 'Log Out'
    end
  end
end
