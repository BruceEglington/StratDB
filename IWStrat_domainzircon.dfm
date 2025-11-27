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
    BorderOptions.Style = cbsNone
    object rectLeft: TIWRectangle
      AlignWithMargins = False
      Left = 0
      Top = 0
      Width = 83
      Height = 1795
      Align = alLeft
      ZIndex = 1
      Font.PxSize = 13
      Font.Color = clWebBLACK
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
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 1015
      Height = 60
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbDetailsEdit: TIWButton
        AlignWithMargins = False
        Left = 263
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Edit this record'
        Color = clWebLEMONCHIFFON
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 4
      end
      object iwbReturn: TIWButton
        AlignWithMargins = False
        Left = 96
        Top = 19
        Width = 141
        Height = 25
        Caption = 'Return to Main page'
        Color = clWebLIGHTGREEN
        FriendlyName = 'iwbReturn'
        TabOrder = 3
        OnClick = iwbReturnClick
      end
      object iwbApplyUpdates: TIWButton
        AlignWithMargins = False
        Left = 422
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Apply updates'
        Color = clWebPEACHPUFF
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 5
        OnClick = iwbApplyUpdatesClick
      end
      object iwbCancel: TIWButton
        AlignWithMargins = False
        Left = 584
        Top = 19
        Width = 129
        Height = 25
        Caption = 'Cancel updates'
        Color = clWebLIGHTSALMON
        FriendlyName = 'iwbDetailsEdit'
        TabOrder = 6
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
      BorderOptions.Style = cbsNone
      object iwbDetailsEdit2: TIWButton
        AlignWithMargins = False
        Left = 426
        Top = 27
        Width = 129
        Height = 25
        Caption = 'Edit this record'
        Color = clWebLEMONCHIFFON
        FriendlyName = 'iwbDetailsEdit2'
      end
      object iwbReturn2: TIWButton
        AlignWithMargins = False
        Left = 228
        Top = 27
        Width = 141
        Height = 25
        Caption = 'Return to Main page'
        Color = clWebLIGHTGREEN
        FriendlyName = 'iwbReturn2'
        TabOrder = 2
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
      object IWLabel66: TIWLabel
        AlignWithMargins = False
        Left = 4
        Top = 12
        Width = 174
        Height = 16
        Font.FontName = 'Arial'
        Font.PxSize = 13
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Stratigraphic Unit Database'
      end
      object IWLabel67: TIWLabel
        AlignWithMargins = False
        Left = 4
        Top = 30
        Width = 159
        Height = 14
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Font.PxSize = 10
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
      BorderOptions.Style = cbsNone
      Color = clWebHONEYDEW
      object IWLabel5: TIWLabel
        AlignWithMargins = False
        Left = 16
        Top = 9
        Width = 75
        Height = 19
        Font.FontName = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Font.PxSize = 16
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Domain :'
      end
      object IWLabel3: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 42
        Width = 86
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Domain name'
      end
      object IWDBEdit3: TIWDBEdit
        AlignWithMargins = False
        Left = 104
        Top = 39
        Width = 357
        Height = 21
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebLEMONCHIFFON
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        Font.PxSize = 17
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 8
        AutoEditable = True
        DataField = 'DOMAINNAME'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWDBEdit7: TIWDBEdit
        AlignWithMargins = False
        Left = 104
        Top = 183
        Width = 121
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 9
        AutoEditable = True
        DataField = 'DOMAINPARENTID'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel4: TIWLabel
        AlignWithMargins = False
        Left = 508
        Top = 42
        Width = 28
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Type'
      end
      object IWLabel2: TIWLabel
        AlignWithMargins = False
        Left = 478
        Top = 74
        Width = 44
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel2'
        Caption = 'Region'
      end
      object IWDBEdit2: TIWDBEdit
        AlignWithMargins = False
        Left = 553
        Top = 72
        Width = 249
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 10
        AutoEditable = False
        DataField = 'CONTINENT'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel1: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 74
        Width = 64
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Domain ID'
      end
      object IWDBEdit1: TIWDBEdit
        AlignWithMargins = False
        Left = 104
        Top = 71
        Width = 121
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 11
        AutoEditable = False
        DataField = 'DOMAINID'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel10: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 158
        Width = 89
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Parent domain'
      end
      object IWDBEdit8: TIWDBEdit
        AlignWithMargins = False
        Left = 104
        Top = 155
        Width = 301
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 12
        AutoEditable = False
        DataField = 'DOMAINNAME'
        DataSource = dmStrat.dsDomainParent
        PasswordPrompt = False
      end
      object IWDBEdit9: TIWDBEdit
        AlignWithMargins = False
        Left = 553
        Top = 155
        Width = 249
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Editable = False
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 13
        AutoEditable = False
        DataField = 'DOMAINTYPE'
        DataSource = dmStrat.dsDomainParent
        PasswordPrompt = False
      end
      object IWLabel8: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 186
        Width = 56
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel11'
        Caption = 'Parent ID'
      end
      object iwbGoToParent: TIWButton
        AlignWithMargins = False
        Left = 236
        Top = 181
        Width = 105
        Height = 25
        Caption = 'Go to Parent'
        Color = clWebLIGHTBLUE
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbGoToParent'
        TabOrder = 14
      end
      object IWLabel16: TIWLabel
        AlignWithMargins = False
        Left = 508
        Top = 158
        Width = 28
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Type'
      end
      object iwbAddDomainToDateView: TIWButton
        AlignWithMargins = False
        Left = 748
        Top = 8
        Width = 157
        Height = 25
        Caption = 'Add to DateView'
        Color = clWebLIGHTSKYBLUE
        FriendlyName = 'iwbAddDomainToDateView'
        TabOrder = 15
      end
      object IWLabel21: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 102
        Width = 88
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Min. Plot Age ='
      end
      object IWDBEdit5: TIWDBEdit
        AlignWithMargins = False
        Left = 125
        Top = 99
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 16
        AutoEditable = True
        DataField = 'MINPLOTAGE'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object IWLabel23: TIWLabel
        AlignWithMargins = False
        Left = 215
        Top = 102
        Width = 90
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Max. Plot Age ='
      end
      object IWDBEdit6: TIWDBEdit
        AlignWithMargins = False
        Left = 305
        Top = 99
        Width = 62
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        FriendlyName = 'IWDBEdit1'
        SubmitOnAsyncEvent = True
        TabOrder = 17
        AutoEditable = True
        DataField = 'MAXPLOTAGE'
        DataSource = dmStrat.dsDomainQ
        PasswordPrompt = False
      end
      object iwDBlcbDomainType: TIWDBLookupComboBox
        AlignWithMargins = False
        Left = 553
        Top = 39
        Width = 249
        Height = 21
        StyleRenderOptions.RenderBorder = False
        BGColor = clWebLEMONCHIFFON
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        NonEditableAsLabel = True
        TabOrder = 18
        AutoEditable = True
        DataField = 'DOMAINTYPEID'
        DataSource = dmStrat.dsDomainQ
        FriendlyName = 'iwDBlcbDomainType'
        KeyField = 'DOMAINTYPEID'
        ListField = 'DOMAINTYPE'
        ListSource = dmStrat.dsDomainTypes
        DisableWhenEmpty = True
      end
      object iwrDatesAvailable: TIWRegion
        Left = 0
        Top = 123
        Width = 886
        Height = 29
        RenderInvisibleControls = False
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        Color = clWebHONEYDEW
        object IWLabel30: TIWLabel
          AlignWithMargins = False
          Left = 12
          Top = 3
          Width = 114
          Height = 15
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.PxSize = 12
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Minimum DV age ='
        end
        object IWDBEdit10: TIWDBEdit
          AlignWithMargins = False
          Left = 125
          Top = 5
          Width = 62
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          Editable = False
          NonEditableAsLabel = True
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Font.PxSize = 12
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 19
          AutoEditable = False
          DataField = 'MINAGE'
          DataSource = dmDV.dsDVMinMax
          PasswordPrompt = False
        end
        object IWLabel31: TIWLabel
          AlignWithMargins = False
          Left = 193
          Top = 8
          Width = 116
          Height = 15
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.PxSize = 12
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Maximum DV age ='
        end
        object IWDBEdit12: TIWDBEdit
          AlignWithMargins = False
          Left = 305
          Top = 5
          Width = 62
          Height = 21
          StyleRenderOptions.RenderBorder = False
          Alignment = taRightJustify
          Editable = False
          NonEditableAsLabel = True
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Font.PxSize = 12
          FriendlyName = 'IWDBEdit1'
          SubmitOnAsyncEvent = True
          TabOrder = 20
          AutoEditable = False
          DataField = 'MAXAGE'
          DataSource = dmDV.dsDVMinMax
          PasswordPrompt = False
        end
        object IWLabel32: TIWLabel
          AlignWithMargins = False
          Left = 373
          Top = 8
          Width = 17
          Height = 15
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.PxSize = 12
          HasTabOrder = False
          FriendlyName = 'IWLabel11'
          Caption = 'Ma'
        end
        object iwlDatesAvailable: TIWLabel
          AlignWithMargins = False
          Left = 553
          Top = 8
          Width = 249
          Height = 15
          Alignment = taCenter
          BGColor = clWebGREENYELLOW
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Font.PxSize = 12
          Font.Color = clWebBLACK
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
      TabOrder = 7
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
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 627
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1100
          ExplicitWidth = 1100
          inherited iwlSignOut: TIWLink
            Font.Color = clWebBLUE
          end
          inherited lnkSignIn: TIWLink
            Font.Color = clWebBLUE
          end
          inherited lblProgTitle: TIWLabel
            Font.Color = clWebSTEELBLUE
          end
        end
      end
    end
  end
end
