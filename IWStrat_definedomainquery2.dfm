object ISFDefineDomainQuery2: TISFDefineDomainQuery2
  Left = 0
  Top = 0
  Width = 1039
  Height = 1881
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  PixelsPerInch = 120
  DesignLeft = 2
  DesignTop = 2
  object IWRegion2: TIWRegion
    Left = 0
    Top = 69
    Width = 104
    Height = 1812
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object rectLeft: TIWRectangle
      AlignWithMargins = False
      Left = 0
      Top = 0
      Width = 104
      Height = 1812
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ZIndex = 1
      Font.PxSize = 13
      Font.Color = clWebBLACK
      BorderOptions.Width = 0
      FriendlyName = 'rectLeft'
      Color = clWebLAVENDER
      Alignment = taLeftJustify
      VAlign = vaMiddle
      ExplicitHeight = 1813
    end
  end
  object IWRegion1: TIWRegion
    Left = 104
    Top = 69
    Width = 935
    Height = 1812
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwrTopButtons: TIWRegion
      Left = 0
      Top = 0
      Width = 935
      Height = 421
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorTop: TIWLabel
        AlignWithMargins = False
        Left = 549
        Top = 373
        Width = 250
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        Font.Color = clWebRED
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlblErrorTop'
        Caption = 'No items selected or boxes not checked'
      end
      object IWText1: TIWText
        AlignWithMargins = False
        Left = 538
        Top = 20
        Width = 326
        Height = 330
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        BGColor = clNone
        ConvertSpaces = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        Font.Color = clWebDARKSLATEGRAY
        FriendlyName = 'IWText1'
        Lines.Strings = (
          'Select parameters which define the records '
          'you require. '
          ''
          'Multiple selections may be made in most list '
          'boxes. '
          ''
          'A more restricted range in data will improve '
          'performance and provide faster response '
          'times to your queries.'
          ''
          'Note that you also need to check the '#39'Include'#39
          'box above a list if you want the items specified'
          'to be include in your query.'
          ''
          '"Submit query" buttons are placed in a number'
          'of places on the form so one does not need to '
          'scroll up or down to activate a query.')
        RawText = False
        UseFrame = False
        WantReturns = True
      end
      object iwcbRestrictParentID: TIWCheckBox
        AlignWithMargins = False
        Left = 19
        Top = 128
        Width = 456
        Height = 31
        Cursor = crAuto
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Restrict results to top level units (ParentID must be zero)'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        Checked = False
        FriendlyName = 'iwcbRestrictParentID'
      end
      object iwbCancel: TIWButton
        AlignWithMargins = False
        Left = 354
        Top = 20
        Width = 176
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel query definition'
        Color = clWebLIGHTSALMON
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbCancel'
        TabOrder = 1
        OnClick = iwbCancelClick
      end
      object iwbClearCheckboxes: TIWButton
        AlignWithMargins = False
        Left = 181
        Top = 20
        Width = 157
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Clear checkboxes'
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbClearCheckboxes'
        TabOrder = 2
        OnClick = iwbClearCheckboxesClick
      end
      object iwbSubmitQuery: TIWButton
        AlignWithMargins = False
        Left = 9
        Top = 20
        Width = 156
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery'
        TabOrder = 3
        OnClick = iwbSubmitQueryClick
      end
    end
    object iwrDomains: TIWRegion
      Left = 0
      Top = 421
      Width = 935
      Height = 372
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton8: TIWButton
        AlignWithMargins = False
        Left = 625
        Top = 333
        Width = 156
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 4
        OnClick = iwbSubmitQueryClick
      end
      object iwlDomains: TIWListbox
        AlignWithMargins = False
        Left = 25
        Top = 50
        Width = 436
        Height = 311
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        TabOrder = 5
        NonEditableAsLabel = True
        FriendlyName = 'iwlDomains'
        Items.Strings = (
          '')
        Sorted = True
        MultiSelect = True
      end
      object iwcbDomains: TIWCheckBox
        AlignWithMargins = False
        Left = 19
        Top = 16
        Width = 442
        Height = 27
        Cursor = crAuto
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Include selection from Domains'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 6
        Checked = False
        FriendlyName = 'iwcbDomains'
      end
    end
    object iwrDomainTypes: TIWRegion
      Left = 0
      Top = 793
      Width = 935
      Height = 268
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton2: TIWButton
        AlignWithMargins = False
        Left = 625
        Top = 216
        Width = 156
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 7
        OnClick = iwbSubmitQueryClick
      end
      object iwlDomainTypes: TIWListbox
        AlignWithMargins = False
        Left = 16
        Top = 49
        Width = 445
        Height = 197
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 8
        NonEditableAsLabel = True
        FriendlyName = 'iwlDomainTypes'
        Sorted = True
        MultiSelect = True
      end
      object iwcbDomainTypes: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 15
        Width = 445
        Height = 26
        Cursor = crAuto
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Include selection from Domain Types'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 9
        Checked = False
        FriendlyName = 'iwcbDomainTypes'
      end
    end
    object iwrOrogenies: TIWRegion
      Left = 0
      Top = 1061
      Width = 935
      Height = 272
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton4: TIWButton
        AlignWithMargins = False
        Left = 625
        Top = 210
        Width = 156
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 10
        OnClick = iwbSubmitQueryClick
      end
      object iwlOrogenies: TIWListbox
        AlignWithMargins = False
        Left = 25
        Top = 48
        Width = 436
        Height = 197
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 11
        NonEditableAsLabel = True
        FriendlyName = 'iwlOrogenies'
        Items.Strings = (
          '')
        Sorted = True
        MultiSelect = True
      end
      object iwcbOrogenies: TIWCheckBox
        AlignWithMargins = False
        Left = 19
        Top = 14
        Width = 456
        Height = 26
        Cursor = crAuto
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Include selection from Orogenies'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 12
        Checked = False
        FriendlyName = 'iwcbOrogenies'
      end
    end
    object iwrValidation: TIWRegion
      Left = 0
      Top = 1333
      Width = 935
      Height = 228
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWButton1: TIWButton
        AlignWithMargins = False
        Left = 625
        Top = 160
        Width = 156
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 13
        OnClick = iwbSubmitQueryClick
      end
      object iwlValidation: TIWListbox
        AlignWithMargins = False
        Left = 25
        Top = 49
        Width = 436
        Height = 151
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        RequireSelection = False
        UseSize = False
        TabOrder = 14
        NonEditableAsLabel = True
        FriendlyName = 'iwlValidation'
        Sorted = True
        MultiSelect = True
      end
      object iwcbValidation: TIWCheckBox
        AlignWithMargins = False
        Left = 19
        Top = 15
        Width = 442
        Height = 26
        Cursor = crAuto
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Include selection from Validation Status'
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 15
        Checked = False
        FriendlyName = 'iwcbValidation'
      end
    end
    object iwrOrderBy: TIWRegion
      Left = 0
      Top = 1561
      Width = 935
      Height = 202
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlblErrorBottom: TIWLabel
        AlignWithMargins = False
        Left = 264
        Top = 163
        Width = 312
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        Font.Color = clWebRED
        HasTabOrder = False
        FriendlyName = 'iwlblErrorBottom'
        Caption = 'No items selected or boxes not checked'
      end
      object iwbSubmitQuery2: TIWButton
        AlignWithMargins = False
        Left = 625
        Top = 150
        Width = 156
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Submit Query'
        Color = clWebLIGHTGREEN
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbSubmitQuery2'
        TabOrder = 16
        OnClick = iwbSubmitQueryClick
      end
      object iwrgOrderBy: TIWRadioGroup
        AlignWithMargins = False
        Left = 25
        Top = 39
        Width = 521
        Height = 106
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwrgOrderBy'
        ItemIndex = 0
        Items.Strings = (
          'ContinentID, DomainName'
          'Domain ID'
          'Parent ID')
        Layout = glVertical
        TabOrder = -1
      end
      object IWLabel4: TIWLabel
        AlignWithMargins = False
        Left = 19
        Top = 13
        Width = 126
        Height = 18
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Order results by'
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1039
    Height = 69
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 69
    Constraints.MinHeight = 69
    Constraints.MinWidth = 750
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    TabStop = True
    ExplicitWidth = 1039
    inherited IWFrameRegion: TIWRegion
      Width = 1039
      TabOrder = 17
      ExplicitWidth = 1039
      inherited iwrHeader: TIWRegion
        Width = 1039
        ExplicitWidth = 1039
        inherited iwrWelcome: TIWRegion
          Width = 1039
          ExplicitWidth = 1039
          inherited iwrDisplayUserName: TIWRegion
            Width = 789
            ExplicitWidth = 789
            inherited lblWelcome: TIWLabel
              Left = 606
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 448
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1039
          ExplicitWidth = 1039
          inherited iwlSignOut: TIWLink
            Font.Color = clWebBLUE
          end
          inherited lnkSignIn: TIWLink
            Font.Color = clWebBLUE
          end
          inherited lblProgTitle: TIWLabel
            Width = 338
            Height = 24
            Font.Color = clWebSTEELBLUE
            ExplicitWidth = 338
            ExplicitHeight = 24
          end
        end
      end
    end
  end
end
