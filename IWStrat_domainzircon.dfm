object ISFDomainZircon: TISFDomainZircon
  Left = 0
  Top = 0
  Width = 1100
  Height = 1850
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  ActiveControl = iwbReturn
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwrLeftRegion: TIWRegion
    Left = 0
    Top = 55
    Width = 85
    Height = 1795
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    object rectLeft: TIWRectangle
      Left = 0
      Top = 0
      Width = 83
      Height = 1795
      Align = alLeft
      ZIndex = 1
      Font.Color = clWebBLACK
      Font.Size = 10
      Font.Style = []
      BorderOptions.Width = 0
      FriendlyName = 'rectLeft'
      Color = clWebLAVENDER
      Alignment = taLeftJustify
      VAlign = vaMiddle
      ExplicitHeight = 625
    end
  end
  object iwrClientAll: TIWRegion
    Left = 85
    Top = 55
    Width = 1015
    Height = 1795
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 1015
      Height = 60
      RenderInvisibleControls = False
      TabOrder = 0
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      object iwbDetailsEdit: TIWButton
        Left = 263
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Edit this record'
        Color = clWebLEMONCHIFFON
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 3
      end
      object iwbReturn: TIWButton
        Left = 96
        Top = 19
        Width = 141
        Height = 25
        Caption = 'Return to Main page'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbReturn'
        TabOrder = 2
        OnClick = iwbReturnClick
      end
      object iwbApplyUpdates: TIWButton
        Left = 422
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Apply updates'
        Color = clWebPEACHPUFF
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 4
        OnClick = iwbApplyUpdatesClick
      end
      object iwbCancel: TIWButton
        Left = 584
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Cancel updates'
        Color = clWebLIGHTSALMON
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 5
        OnClick = iwbCancelClick
      end
    end
    object iwrBottomButtons: TIWRegion
      Left = 0
      Top = 1651
      Width = 1015
      Height = 84
      RenderInvisibleControls = False
      Align = alBottom
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      object iwbDetailsEdit2: TIWButton
        Left = 426
        Top = 27
        Width = 129
        Height = 25
        Caption = 'Edit this record'
        Color = clWebLEMONCHIFFON
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbDetailsEdit2'
        TabOrder = 0
      end
      object iwbReturn2: TIWButton
        Left = 228
        Top = 27
        Width = 141
        Height = 25
        Caption = 'Return to Main page'
        Color = clWebLIGHTGREEN
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbReturn2'
        TabOrder = 1
        OnClick = iwbReturnClick
      end
    end
    object iwrCopyRight: TIWRegion
      Left = 0
      Top = 1735
      Width = 1015
      Height = 60
      RenderInvisibleControls = False
      Align = alBottom
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clNone
      object IWLabel66: TIWLabel
        Left = 4
        Top = 12
        Width = 174
        Height = 16
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 10
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Stratigraphic Unit Database'
      end
      object IWLabel67: TIWLabel
        Left = 4
        Top = 30
        Width = 159
        Height = 14
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = '(c) Dr Bruce Eglington (2007)'
      end
    end
    object iwrUnitDetails: TIWRegion
      Left = 0
      Top = 60
      Width = 1015
      Height = 221
      RenderInvisibleControls = False
      TabOrder = 1
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      Color = clWebHONEYDEW
      object IWLabel5: TIWLabel
        Left = 16
        Top = 9
        Width = 75
        Height = 19
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Domain :'
      end
      object IWLabel3: TIWLabel
        Left = 12
        Top = 42
        Width = 86
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Domain name'
      end
      object IWDBEdit3: TIWDBEdit
        Left = 104
        Top = 39
        Width = 357
        Height = 21
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebLEMONCHIFFON
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 7
        AutoEditable = True
        DataField = 'DOMAINNAME'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWDBEdit7: TIWDBEdit
        Left = 104
        Top = 183
        Width = 121
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 8
        AutoEditable = True
        DataField = 'DOMAINPARENTID'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel4: TIWLabel
        Left = 508
        Top = 42
        Width = 28
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Type'
      end
      object IWLabel2: TIWLabel
        Left = 478
        Top = 74
        Width = 44
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = 'Region'
      end
      object IWDBEdit2: TIWDBEdit
        Left = 553
        Top = 72
        Width = 249
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 9
        AutoEditable = False
        DataField = 'CONTINENT'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel1: TIWLabel
        Left = 12
        Top = 74
        Width = 64
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Domain ID'
      end
      object IWDBEdit1: TIWDBEdit
        Left = 104
        Top = 71
        Width = 121
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 10
        AutoEditable = False
        DataField = 'DOMAINID'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel10: TIWLabel
        Left = 12
        Top = 158
        Width = 89
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Parent domain'
      end
      object IWDBEdit8: TIWDBEdit
        Left = 104
        Top = 155
        Width = 301
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 11
        AutoEditable = False
        DataField = 'DOMAINNAME'
        DataSource = dmStrat.dsDomainParent
        PasswordPrompt = False
      end
      object IWDBEdit9: TIWDBEdit
        Left = 553
        Top = 155
        Width = 249
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 12
        AutoEditable = False
        DataField = 'DOMAINTYPE'
        DataSource = dmStrat.dsDomainParent
        PasswordPrompt = False
      end
      object IWLabel8: TIWLabel
        Left = 12
        Top = 186
        Width = 56
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel11'
        Caption = 'Parent ID'
      end
      object iwbGoToParent: TIWButton
        Left = 236
        Top = 181
        Width = 105
        Height = 25
        Caption = 'Go to Parent'
        Color = clWebLIGHTBLUE
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'iwbGoToParent'
        TabOrder = 13
      end
      object IWLabel16: TIWLabel
        Left = 508
        Top = 158
        Width = 28
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Type'
      end
      object iwbAddDomainToDateView: TIWButton
        Left = 748
        Top = 8
        Width = 157
        Height = 25
        Caption = 'Add to DateView'
        Color = clWebLIGHTSKYBLUE
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbAddDomainToDateView'
        TabOrder = 14
      end
      object IWLabel21: TIWLabel
        Left = 12
        Top = 102
        Width = 88
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Min. Plot Age ='
      end
      object IWDBEdit5: TIWDBEdit
        Left = 125
        Top = 99
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 15
        AutoEditable = True
        DataField = 'MINPLOTAGE'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel23: TIWLabel
        Left = 215
        Top = 102
        Width = 90
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Max. Plot Age ='
      end
      object IWDBEdit6: TIWDBEdit
        Left = 305
        Top = 99
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 16
        AutoEditable = True
        DataField = 'MAXPLOTAGE'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object iwDBlcbDomainType: TIWDBLookupComboBox
        Left = 553
        Top = 39
        Width = 249
        Height = 21
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebLEMONCHIFFON
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        NonEditableAsLabel = True
        TabOrder = 17
        AutoEditable = True
        DataField = 'DOMAINTYPEID'
        DataSource = dmStrat.dsDomainQ
        FriendlyName = 'iwDBlcbDomainType'
        KeyField = 'DOMAINTYPEID'
        ListField = 'DOMAINTYPE'
        ListSource = dmStrat.dsDomainTypes
        DisableWhenEmpty = True
        NoSelectionText = '-- No Selection --'
      end
      object iwrDatesAvailable: TIWRegion
        Left = 0
        Top = 123
        Width = 886
        Height = 29
        RenderInvisibleControls = False
        BorderOptions.NumericWidth = 0
        BorderOptions.BorderWidth = cbwNumeric
        BorderOptions.Style = cbsNone
        BorderOptions.Color = clNone
        Color = clWebHONEYDEW
        object IWLabel30: TIWLabel
          Left = 12
          Top = 3
          Width = 114
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Minimum DV age ='
        end
        object IWDBEdit10: TIWDBEdit
          Left = 125
          Top = 5
          Width = 62
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 18
          AutoEditable = False
          DataField = 'MINAGE'
          DataSource = dmDV.dsDVMinMax
          PasswordPrompt = False
        end
        object IWLabel31: TIWLabel
          Left = 193
          Top = 8
          Width = 116
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Maximum DV age ='
        end
        object IWDBEdit12: TIWDBEdit
          Left = 305
          Top = 5
          Width = 62
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          Editable = False
          NonEditableAsLabel = True
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 19
          AutoEditable = False
          DataField = 'MAXAGE'
          DataSource = dmDV.dsDVMinMax
          PasswordPrompt = False
        end
        object IWLabel32: TIWLabel
          Left = 373
          Top = 8
          Width = 17
          Height = 15
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Ma'
        end
        object iwlDatesAvailable: TIWLabel
          Left = 553
          Top = 8
          Width = 249
          Height = 15
          Alignment = taCenter
          BGColor = clWebGREENYELLOW
          Font.Color = clWebBLACK
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          HasTabOrder = False
          AutoSize = False
          FriendlyName = 'iwlDatesAvailable'
          Caption = '  Geochronology Available'
        end
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1100
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
    ExplicitWidth = 1100
    inherited IWFrameRegion: TIWRegion
      Width = 1100
      TabOrder = 6
      ExplicitWidth = 1100
      inherited iwrHeader: TIWRegion
        Width = 1100
        ExplicitWidth = 1100
        inherited iwrWelcome: TIWRegion
          Width = 1100
          ExplicitWidth = 1100
          inherited iwrDisplayUserName: TIWRegion
            Width = 900
            ExplicitWidth = 900
            inherited lblWelcome: TIWLabel
              Left = 627
              ExplicitLeft = 627
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1100
          ExplicitWidth = 1100
        end
      end
    end
  end
end
