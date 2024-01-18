object IWFrame2: TIWFrame2
  Left = 0
  Top = 0
  Width = 250
  Height = 304
  Align = alLeft
  TabOrder = 0
  TabStop = True
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 120
    Width = 250
    Height = 184
    Cursor = crAuto
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWMenu1: TIWMenu
      Left = 0
      Top = 0
      Width = 120
      Height = 184
      Cursor = crAuto
      Align = alLeft
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      FriendlyName = 'IWMenu1'
      AttachedMenu = MainMenu1
      ItemSpacing = itsNone
      AutoSize = mnaNone
      MainMenuStyle.MenuItemFont.Color = clWebBLUE
      MainMenuStyle.MenuItemFont.FontName = 'Arial'
      MainMenuStyle.MenuItemFont.Size = 9
      MainMenuStyle.MenuItemFont.Style = [fsBold]
      MainMenuStyle.SelectedMenuItemFont.Color = clNone
      MainMenuStyle.SelectedMenuItemFont.FontName = 'Arial'
      MainMenuStyle.SelectedMenuItemFont.Size = 9
      MainMenuStyle.SelectedMenuItemFont.Style = []
      MainMenuStyle.DisabledMenuItemFont.Color = clWebSILVER
      MainMenuStyle.DisabledMenuItemFont.FontName = 'Arial'
      MainMenuStyle.DisabledMenuItemFont.Size = 9
      MainMenuStyle.DisabledMenuItemFont.Style = [fsBold]
      MainMenuStyle.BGColor = clWebLIGHTSTEELBLUE
      MainMenuStyle.ItemBGColor = clWebLIGHTSTEELBLUE
      MainMenuStyle.SelectedItemBGColor = clWebLIGHTBLUE
      MainMenuStyle.DisabledItemBGColor = clWebLIGHTSTEELBLUE
      MainMenuStyle.BorderColor = clWebWHITE
      MainMenuStyle.Orientation = iwOVertical
      SubMenuStyle.MenuItemFont.Color = clWebBLUE
      SubMenuStyle.MenuItemFont.Size = 10
      SubMenuStyle.MenuItemFont.Style = []
      SubMenuStyle.SelectedMenuItemFont.Color = clNone
      SubMenuStyle.SelectedMenuItemFont.FontName = 'Arial'
      SubMenuStyle.SelectedMenuItemFont.Size = 9
      SubMenuStyle.SelectedMenuItemFont.Style = [fsBold]
      SubMenuStyle.DisabledMenuItemFont.Color = clWebSILVER
      SubMenuStyle.DisabledMenuItemFont.FontName = 'Arial'
      SubMenuStyle.DisabledMenuItemFont.Size = 9
      SubMenuStyle.DisabledMenuItemFont.Style = []
      SubMenuStyle.BGColor = clWebLIGHTSTEELBLUE
      SubMenuStyle.ItemBGColor = clWebLIGHTSTEELBLUE
      SubMenuStyle.SelectedItemBGColor = clWebLIGHTBLUE
      SubMenuStyle.DisabledItemBGColor = clWebLIGHTSTEELBLUE
      SubMenuStyle.BorderColor = clWebWHITE
      SubMenuStyle.Orientation = iwOVertical
      TimeOut = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitHeight = 300
    end
  end
  object IWRegion1: TIWRegion
    Left = 0
    Top = 0
    Width = 250
    Height = 120
    Cursor = crAuto
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    TabOrder = 0
    Align = alTop
    BorderOptions.NumericWidth = 0
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWRegion2: TIWRegion
      Left = 0
      Top = 0
      Width = 120
      Height = 120
      Cursor = crAuto
      Align = alLeft
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      Color = clWebLIGHTSTEELBLUE
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWImageFile1: TIWImageFile
        Left = 0
        Top = 0
        Width = 120
        Height = 120
        Cursor = crAuto
        Align = alClient
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        AutoSize = False
        BorderOptions.Color = clNone
        BorderOptions.Width = 0
        DoSubmitValidation = True
        ScriptEvents = <>
        TabOrder = -1
        UseSize = True
        Cacheable = True
        FriendlyName = 'IWImageFile1'
        ImageFile.URL = '\Files\Images\eggtimer_bluebackground_130x136.bmp'
        ExplicitLeft = 52
        ExplicitTop = 68
        ExplicitWidth = 89
        ExplicitHeight = 112
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 268
    Top = 136
    object Mainpage1: TMenuItem
      Caption = 'Main Page'
    end
    object Select1: TMenuItem
      Caption = 'Select'
      object SelectUnits1: TMenuItem
        Caption = 'Units'
      end
      object SelectDomains1: TMenuItem
        Caption = 'Domains'
      end
      object SelectLIPs1: TMenuItem
        Caption = 'Large Igneous Provinces'
      end
      object SelectChart1: TMenuItem
        Caption = 'Chart'
      end
    end
    object Lookups1: TMenuItem
      Caption = 'Lookups'
      object LookupCharts1: TMenuItem
        Caption = 'Charts'
      end
      object LookupDeposits1: TMenuItem
        Caption = 'Deposits'
      end
      object LookupDirections1: TMenuItem
        Caption = 'Directions'
      end
      object LookupDomains1: TMenuItem
        Caption = 'Domains'
      end
      object LookupDomainTypes1: TMenuItem
        Caption = 'Domain Types'
      end
      object LookupDuctilityTypes1: TMenuItem
        Caption = 'Ductility Types'
      end
      object LookupLIPs1: TMenuItem
        Caption = 'Large Igneous Provinces'
      end
      object LookupMaps1: TMenuItem
        Caption = 'Maps'
      end
      object LookupMetamorphicGrades1: TMenuItem
        Caption = 'Metamorphic Grades'
      end
      object LookupOrogenies1: TMenuItem
        Caption = 'Orogenies'
      end
      object LookupOrogenyTypes1: TMenuItem
        Caption = 'Orogeny Types'
      end
      object LookupReferences1: TMenuItem
        Caption = 'References'
      end
      object LookupTimescale1: TMenuItem
        Caption = 'Timescale'
      end
    end
    object Graph1: TMenuItem
      Caption = 'Graph'
      Enabled = False
    end
    object Options1: TMenuItem
      Caption = 'Options'
    end
    object New1: TMenuItem
      Caption = 'New'
      object NewUnit1: TMenuItem
        Caption = 'Unit'
      end
      object NewDomain1: TMenuItem
        Caption = 'Domain'
        Enabled = False
      end
      object NewLIP1: TMenuItem
        Caption = 'Large Igneous Province'
        Enabled = False
      end
      object NewDeposit1: TMenuItem
        Caption = 'Deposit'
        Enabled = False
      end
    end
  end
end
