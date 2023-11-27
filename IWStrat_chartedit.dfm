object ISFChartEdit: TISFChartEdit
  Left = 0
  Top = 0
  Width = 716
  Height = 600
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWDBNavigator1: TIWDBNavigator
    Left = 172
    Top = 105
    Width = 108
    Height = 27
    Confirmations.Delete = 'Are you sure you want to delete this record?'
    Confirmations.Post = 'Are you sure you want to update this record?'
    Confirmations.Cancel = 'Are you sure you want to cancel your changes to this record?'
    DataSource = dmStratC.dsCharts
    FriendlyName = 'IWDBNavigator1'
    ImageHeight = 21
    ImageWidth = 21
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
  end
  object IWDBEdit1: TIWDBEdit
    Left = 117
    Top = 166
    Width = 278
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
    TabOrder = 1
    AutoEditable = True
    DataField = 'CHART'
    DataSource = dmStratC.dsCharts
    PasswordPrompt = False
  end
  object iwbReturn: TIWButton
    Left = 5
    Top = 74
    Width = 119
    Height = 25
    Caption = 'Return to list'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    TabOrder = 2
    OnClick = iwbReturnClick
  end
  object IWLabel1: TIWLabel
    Left = 32
    Top = 168
    Width = 33
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Chart'
  end
  object iwbSave: TIWButton
    Left = 317
    Top = 74
    Width = 119
    Height = 25
    Caption = 'Save changes'
    Color = clWebPEACHPUFF
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 4
    OnClick = iwbSaveClick
  end
  object iwbCancelChanges: TIWButton
    Left = 447
    Top = 74
    Width = 119
    Height = 25
    Caption = 'Cancel changes'
    Color = clWebLIGHTSTEELBLUE
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSaveChanges'
    TabOrder = 5
    OnClick = iwbCancelChangesClick
  end
  object iwbDelete: TIWButton
    Left = 576
    Top = 73
    Width = 119
    Height = 25
    Caption = 'Delete'
    Confirmation = 'Are you sure you want to delete this record?'
    Color = clWebLIGHTCORAL
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbDelete'
    TabOrder = 3
    OnClick = iwbDeleteClick
  end
  object IWLabel2: TIWLabel
    Left = 32
    Top = 140
    Width = 49
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Chart ID'
  end
  object IWDBEdit2: TIWDBEdit
    Left = 117
    Top = 138
    Width = 64
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
    TabOrder = 6
    AutoEditable = False
    DataField = 'CHARTID'
    DataSource = dmStratC.dsCharts
    PasswordPrompt = False
  end
  object IWLabel3: TIWLabel
    Left = 32
    Top = 196
    Width = 105
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Chart offset (mm)'
  end
  object IWDBEdit3: TIWDBEdit
    Left = 200
    Top = 193
    Width = 45
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
    TabOrder = 7
    AutoEditable = True
    DataField = 'CHARTOFFSET_MM'
    DataSource = dmStratC.dsCharts
    PasswordPrompt = False
  end
  object IWLabel4: TIWLabel
    Left = 32
    Top = 224
    Width = 169
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Default Domain Offset (mm)'
  end
  object IWDBEdit4: TIWDBEdit
    Left = 200
    Top = 222
    Width = 45
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
    TabOrder = 8
    AutoEditable = True
    DataField = 'DEFAULTDOMAINOFFSET'
    DataSource = dmStratC.dsCharts
    PasswordPrompt = False
  end
  object IWLabel5: TIWLabel
    Left = 32
    Top = 253
    Width = 69
    Height = 15
    Visible = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Description'
  end
  object IWDBMemo1: TIWDBMemo
    Left = 56
    Top = 274
    Width = 639
    Height = 159
    Visible = False
    StyleRenderOptions.RenderBorder = False
    BGColor = clNone
    Editable = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    InvisibleBorder = False
    HorizScrollBar = False
    VertScrollBar = True
    Required = False
    TabOrder = 9
    SubmitOnAsyncEvent = True
    AutoEditable = True
    DataSource = dmStratC.dsCharts
    FriendlyName = 'IWDBMemo1'
  end
  object iwbEdit: TIWButton
    Left = 167
    Top = 74
    Width = 119
    Height = 24
    Caption = 'Edit'
    Color = clWebLEMONCHIFFON
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbEdit'
    TabOrder = 10
    OnClick = iwbEditClick
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 716
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
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 716
    inherited IWFrameRegion: TIWRegion
      Width = 716
      TabOrder = 11
      ExplicitWidth = 716
      inherited iwrHeader: TIWRegion
        Width = 716
        ExplicitWidth = 716
        inherited iwrWelcome: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwrDisplayUserName: TIWRegion
            Width = 516
            ExplicitWidth = 516
            inherited lblWelcome: TIWLabel
              Left = 243
              ExplicitLeft = 243
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 716
          ExplicitWidth = 716
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
