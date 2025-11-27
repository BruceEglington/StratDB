object ISFGridGrainProbabilityUnits: TISFGridGrainProbabilityUnits
  Left = 0
  Top = 0
  Width = 1079
  Height = 4300
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwrLeft: TIWRegion
    Left = 0
    Top = 55
    Width = 73
    Height = 4245
    RenderInvisibleControls = False
    Align = alLeft
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    Color = clWebLAVENDER
  end
  object iwrPageFull: TIWRegion
    Left = 73
    Top = 55
    Width = 991
    Height = 4245
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwDBgResults: TIWDBGrid
      AlignWithMargins = False
      Left = 0
      Top = 362
      Width = 991
      Height = 614
      Align = alTop
      BorderColors.Color = clNone
      BorderColors.Light = clNone
      BorderColors.Dark = clNone
      BGColor = clNone
      BorderSize = 1
      BorderStyle = tfDefault
      CellPadding = 2
      CellSpacing = 0
      Font.FontName = 'Arial'
      Font.Size = 8
      Font.PxSize = 10
      FrameBuffer = 40
      Lines = tlAll
      UseFrame = False
      UseSize = True
      ShowEmptyCells = True
      ShowInvisibleRows = True
      ScrollToCurrentRow = False
      Columns = <
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'UNITID'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'ID'
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
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'COUNTRY'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Area'
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
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'UNITNAME'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Strat. Unit'
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
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'UNITRANK'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Rank'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = True
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'AGEYEARS'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Sort Order'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = True
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'PARENTID'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Parent ID'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = True
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'MINAGE'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Min. Age (Ma)'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = True
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = True
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'MAXAGE'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Max. Age (Ma)'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = True
          Title.RawText = True
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'AGEUNITS'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Age Units'
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
          Font.FontName = 'Arial'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'APPROVALSTATUS'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Arial'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Approval Status'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end>
      DataSource = dmStrat.dsQuery1
      FooterRowCount = 0
      FriendlyName = 'iwDBgResults'
      FromStart = False
      HighlightColor = clNone
      HighlightRows = False
      Options = [dgShowTitles]
      RefreshMode = rmAutomatic
      RowLimit = 20
      RollOver = True
      RowClick = False
      RollOverColor = clWebPALEGOLDENROD
      RowHeaderColor = clWebLIGHTSTEELBLUE
      RowAlternateColor = clNone
      RowCurrentColor = clNone
      ExplicitLeft = 6
      ExplicitTop = 205
    end
    object iwDBgUnits: TIWDBGrid
      AlignWithMargins = False
      Left = 0
      Top = 1100
      Width = 991
      Height = 425
      Align = alTop
      BorderColors.Color = clNone
      BorderColors.Light = clNone
      BorderColors.Dark = clNone
      BGColor = clNone
      BorderSize = 1
      BorderStyle = tfDefault
      CellPadding = 2
      CellSpacing = 0
      Font.FontName = 'Verdana'
      Font.Size = 8
      Font.PxSize = 10
      FrameBuffer = 40
      Lines = tlAll
      UseFrame = False
      UseSize = True
      ShowEmptyCells = True
      ShowInvisibleRows = True
      ScrollToCurrentRow = False
      Columns = <
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'COUNTRYID'
          OnClick = iwDBgUnitsColumns1Click
          OnTitleClick = iwDBgUnitsColumns0TitleClick
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Country ID'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'UNITID'
          LinkField = 'UNITID'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Unit ID'
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
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'STRATDBUNITNAME'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Unit Name'
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
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'STRATDBUNITRANK'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Rank'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'UNITAGE'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Unit Min. Age (Ma)'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'DVUNITID'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'DV Unit ID'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end>
      DataSource = dmStrat.dsUserUnits
      FooterRowCount = 0
      FriendlyName = 'iwDBgUnits'
      FromStart = True
      HighlightColor = clNone
      HighlightRows = False
      Options = [dgShowTitles]
      RefreshMode = rmAutomatic
      RowLimit = 20
      RollOver = True
      RowClick = False
      RollOverColor = clWebPALEGOLDENROD
      RowHeaderColor = clWebLIGHTSTEELBLUE
      RowAlternateColor = clNone
      RowCurrentColor = clWebYELLOW
      ExplicitLeft = 6
      ExplicitTop = 0
      ExplicitWidth = 857
    end
    object iwDBgUnitsSamples: TIWDBGrid
      AlignWithMargins = False
      Left = 0
      Top = 1682
      Width = 991
      Height = 425
      Align = alTop
      BorderColors.Color = clNone
      BorderColors.Light = clNone
      BorderColors.Dark = clNone
      BGColor = clNone
      BorderSize = 1
      BorderStyle = tfDefault
      CellPadding = 2
      CellSpacing = 0
      Font.FontName = 'Verdana'
      Font.Size = 8
      Font.PxSize = 10
      FrameBuffer = 40
      Lines = tlAll
      UseFrame = False
      UseSize = True
      ShowEmptyCells = True
      ShowInvisibleRows = True
      ScrollToCurrentRow = False
      Columns = <
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'COUNTRYID'
          OnClick = iwDBgUnitsSamplesColumns6Click
          OnTitleClick = iwDBgUnitsSamplesColumns0TitleClick
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Country ID'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'UNITID'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'DV Unit ID'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'STRATDBUNITID'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'StratDB Unit ID'
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
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'STRATDBUNITNAME'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'StratDB Unit Name'
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
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'STRATDBUNITRANK'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'StratDB Unit Rank'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'STRATDBUNITAGE'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Unit Min. Age (Ma)'
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
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'SAMPLENO'
          LinkField = 'SAMPLENO'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Sample No'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'LONGITUDE'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Longitude'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.FontName = 'Verdana'
          Font.Size = 8
          Font.PxSize = 10
          Header = False
          Height = '0'
          ShowHint = True
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = 'LATITUDE'
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.FontName = 'Verdana'
          Title.Font.Size = 8
          Title.Font.Style = [fsBold]
          Title.Font.PxSize = 10
          Title.Header = False
          Title.Height = '0'
          Title.ShowHint = True
          Title.Text = 'Latitude'
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end>
      DataSource = dmDV.dsUserUnitSuiteSamples
      FooterRowCount = 0
      FriendlyName = 'iwDBgUnitsSamples'
      FromStart = True
      HighlightColor = clNone
      HighlightRows = False
      Options = [dgShowTitles]
      RefreshMode = rmAutomatic
      RowLimit = 20
      RollOver = True
      RowClick = False
      RollOverColor = clWebPALEGOLDENROD
      RowHeaderColor = clWebLIGHTSTEELBLUE
      RowAlternateColor = clNone
      RowCurrentColor = clWebYELLOW
      ExplicitLeft = -6
      ExplicitTop = 0
    end
    object iwrUnitsQueryTop: TIWRegion
      Left = 0
      Top = 305
      Width = 991
      Height = 57
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      DesignSize = (
        991
        57)
      object iwlFirstPage: TIWLink
        AlignWithMargins = False
        Left = 30
        Top = 34
        Width = 33
        Height = 17
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Alignment = taLeftJustify
        Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsUnderline]
        Font.PxSize = 12
        Font.Color = clWebBLUE
        HasTabOrder = True
        DoSubmitValidation = False
        FriendlyName = 'iwlFirstPage'
        OnClick = iwlFirstPageClick
        TabOrder = 17
        RawText = False
        Caption = 'First'
      end
      object iwlLastPage: TIWLink
        AlignWithMargins = False
        Left = 240
        Top = 34
        Width = 35
        Height = 17
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Alignment = taLeftJustify
        Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsUnderline]
        Font.PxSize = 12
        Font.Color = clWebBLUE
        HasTabOrder = True
        DoSubmitValidation = False
        FriendlyName = 'iwlLastPage'
        OnClick = iwlLastPageClick
        TabOrder = 19
        RawText = False
        Caption = 'Last'
      end
      object iwlNextPage: TIWLink
        AlignWithMargins = False
        Left = 206
        Top = 34
        Width = 35
        Height = 17
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Alignment = taLeftJustify
        Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsUnderline]
        Font.PxSize = 12
        Font.Color = clWebBLUE
        HasTabOrder = True
        DoSubmitValidation = False
        FriendlyName = 'iwlNextPage'
        OnClick = iwlNextPageClick
        TabOrder = 20
        RawText = False
        Caption = 'Next'
      end
      object iwlPrevPage: TIWLink
        AlignWithMargins = False
        Left = 70
        Top = 34
        Width = 53
        Height = 17
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        Alignment = taLeftJustify
        Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = [fsUnderline]
        Font.PxSize = 12
        Font.Color = clWebBLUE
        HasTabOrder = True
        DoSubmitValidation = False
        FriendlyName = 'iwlPrevPage'
        OnClick = iwlPrevPageClick
        TabOrder = 21
        RawText = False
        Caption = 'Previous'
      end
      object iwlPageNumTotal: TIWLabel
        AlignWithMargins = False
        Left = 174
        Top = 35
        Width = 15
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'iwlPageNumTotal'
        Caption = '11'
      end
      object iwlSortedBy: TIWLabel
        AlignWithMargins = False
        Left = 820
        Top = 37
        Width = 150
        Height = 14
        Anchors = [akTop, akRight]
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlSortedBy'
        Caption = 'Sorted as specified in query'
        ExplicitLeft = 700
      end
      object iwlPageNum: TIWLabel
        AlignWithMargins = False
        Left = 140
        Top = 35
        Width = 14
        Height = 15
        Alignment = taRightJustify
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = '11'
      end
      object lblRecordCount: TIWLabel
        AlignWithMargins = False
        Left = 30
        Top = 13
        Width = 145
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'lblRecordCount'
        Caption = 'records match the query'
      end
      object iwlOf: TIWLabel
        AlignWithMargins = False
        Left = 156
        Top = 35
        Width = 11
        Height = 15
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.PxSize = 12
        HasTabOrder = False
        FriendlyName = 'iwlOf'
        Caption = 'of'
      end
      object iwlQueryResults: TIWLabel
        AlignWithMargins = False
        Left = 344
        Top = 6
        Width = 251
        Height = 29
        Alignment = taCenter
        Font.FontName = 'Verdana'
        Font.Size = 18
        Font.Style = [fsBold]
        Font.PxSize = 24
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlQueryResults'
        Caption = 'Unit Query Results'
      end
    end
    object iwrButtonsTop: TIWRegion
      Left = 0
      Top = 0
      Width = 991
      Height = 60
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbReturn: TIWButton
        AlignWithMargins = False
        Left = 6
        Top = 10
        Width = 124
        Height = 25
        Caption = 'Return'
        Color = clWebLIGHTGREEN
        FriendlyName = 'iwbReturn'
        OnClick = iwbReturnClick
      end
    end
    object iwrProjectSelect: TIWRegion
      Left = 0
      Top = 60
      Width = 991
      Height = 245
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwlUserProject: TIWLabel
        AlignWithMargins = False
        Left = 6
        Top = 16
        Width = 244
        Height = 38
        Font.FontName = 'Verdana'
        Font.Size = 24
        Font.Style = [fsBold]
        Font.PxSize = 32
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'User Project'
      end
      object iwcbUserProject: TIWComboBox
        AlignWithMargins = False
        Left = 16
        Top = 174
        Width = 411
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Font.FontName = 'Arial'
        Font.Style = [fsBold]
        Font.PxSize = 13
        OnChange = iwlUserProject1Change
        NonEditableAsLabel = True
        TabOrder = 1
        ItemIndex = -1
        FriendlyName = 'iwlUserProject'
      end
      object iwlbUserProject: TIWListbox
        AlignWithMargins = False
        Left = 467
        Top = 0
        Width = 497
        Height = 225
        Visible = False
        TabOrder = 67
        FriendlyName = 'iwlbUserProject'
      end
    end
    object iwrUnitsButtons: TIWRegion
      Left = 0
      Top = 976
      Width = 991
      Height = 74
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbUnitsAdd: TIWButton
        AlignWithMargins = False
        Left = 149
        Top = 24
        Width = 200
        Height = 25
        Caption = 'Add to Units Table'
        Color = clWebLIGHTGREEN
        FriendlyName = 'iwbUnitsAdd'
        TabOrder = 4
        OnClick = iwbUnitsAddClick
      end
      object iwbUnitsClear: TIWButton
        AlignWithMargins = False
        Left = 475
        Top = 24
        Width = 200
        Height = 25
        Caption = 'Empty Units Table'
        Color = clWebLIGHTCORAL
        FriendlyName = 'iwbUnitsClear'
        TabOrder = 3
        OnClick = iwbUnitsClearClick
      end
      object iwcbIncludeSubunits: TIWCheckBox
        AlignWithMargins = False
        Left = 10
        Top = 24
        Width = 121
        Height = 21
        Caption = 'Include Subunits'
        Editable = True
        Font.FontName = 'Arial'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 2
        Checked = False
        FriendlyName = 'iwcbIncludeSubunits'
      end
    end
    object iwrUnitsTop: TIWRegion
      Left = 0
      Top = 1050
      Width = 991
      Height = 50
      RenderInvisibleControls = False
      TabOrder = 11
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      DesignSize = (
        991
        50)
      object iwlUnits: TIWLabel
        AlignWithMargins = False
        Left = 5
        Top = -7
        Width = 69
        Height = 29
        Alignment = taCenter
        Font.FontName = 'Verdana'
        Font.Size = 18
        Font.Style = [fsBold]
        Font.PxSize = 24
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlUnits'
        Caption = 'Units'
      end
      object iwlUnitsSortedBy: TIWLabel
        AlignWithMargins = False
        Left = 820
        Top = 29
        Width = 150
        Height = 14
        Anchors = [akTop, akRight]
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlUnitsSortedBy'
        Caption = 'Sorted as specified in query'
      end
      object iwbDeleteUnitRecord: TIWButton
        AlignWithMargins = False
        Left = 621
        Top = 19
        Width = 170
        Height = 25
        Caption = 'Delete record'
        Color = clBtnFace
        FriendlyName = 'iwbDeleteUnitRecord'
        TabOrder = 8
        OnClick = iwbDeleteUnitRecordClick
      end
      object iwlUnitsPartialList: TIWLabel
        AlignWithMargins = False
        Left = 6
        Top = 29
        Width = 172
        Height = 14
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlUnitsPartialList'
        Caption = 'Only a partial list may be shown'
      end
      object iwbDownloadUnits: TIWButton
        AlignWithMargins = False
        Left = 418
        Top = 19
        Width = 170
        Height = 25
        Caption = 'Download Units'
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbDownloadUnits'
        TabOrder = 7
        OnClick = iwbDownloadUnitsClick
      end
      object iwbShowUnits: TIWButton
        AlignWithMargins = False
        Left = 215
        Top = 19
        Width = 170
        Height = 25
        Caption = 'Show Units'
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbShowUnits'
        TabOrder = 6
        OnClick = iwbShowUnitsClick
      end
    end
    object iwrUnitsSamplesButtons: TIWRegion
      Left = 0
      Top = 1525
      Width = 991
      Height = 102
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbUnitsSamplesAdd: TIWButton
        AlignWithMargins = False
        Left = 296
        Top = 22
        Width = 200
        Height = 25
        Caption = 'Add to Units+Samples Table'
        Color = clWebLIGHTGREEN
        FriendlyName = 'iwbUnitsAdd'
        TabOrder = 10
        OnClick = iwbUnitsSamplesAddClick
      end
      object iwbUnitsSamplesClear: TIWButton
        AlignWithMargins = False
        Left = 625
        Top = 22
        Width = 200
        Height = 25
        Caption = 'Empty Units+Samples Table'
        Color = clWebLIGHTCORAL
        FriendlyName = 'iwbUnitsClear'
        TabOrder = 9
        OnClick = iwbUnitsSamplesClearClick
      end
      object iwrgIsotopeSystemVariable: TIWRadioGroup
        AlignWithMargins = False
        Left = 37
        Top = 22
        Width = 202
        Height = 67
        OnClick = iwrgIsotopeSystemVariableClick
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iwrgIsotopeSystemVariable'
        ItemIndex = 0
        Items.Strings = (
          'U-Pb,  Age'
          'Lu-Hf, T(DM2)'
          'Multiple, Age-DM-chem')
        Layout = glVertical
        TabOrder = 18
      end
    end
    object iwrUnitsSamplesTop: TIWRegion
      Left = 0
      Top = 1627
      Width = 991
      Height = 55
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      TabOrder = 13
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      DesignSize = (
        991
        55)
      object iwlUnitsSamples: TIWLabel
        AlignWithMargins = False
        Left = 5
        Top = -7
        Width = 272
        Height = 29
        Font.FontName = 'Verdana'
        Font.Size = 18
        Font.Style = [fsBold]
        Font.PxSize = 24
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlUnitsSamples'
        Caption = 'Units and Samples'
      end
      object iwlUnitsSamplesSortedBy: TIWLabel
        AlignWithMargins = False
        Left = 820
        Top = 35
        Width = 150
        Height = 14
        Anchors = [akTop, akRight]
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlUnitsSortedBy'
        Caption = 'Sorted as specified in query'
      end
      object iwbDeleteUnitsSamplesRecord: TIWButton
        AlignWithMargins = False
        Left = 685
        Top = 27
        Width = 103
        Height = 25
        Caption = 'Delete record'
        Color = clBtnFace
        FriendlyName = 'iwbDeleteRecord'
        TabOrder = 16
        OnClick = iwbDeleteUnitsSamplesRecordClick
      end
      object iwlUnitsSamplesPartialList: TIWLabel
        AlignWithMargins = False
        Left = 6
        Top = 35
        Width = 172
        Height = 14
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Font.PxSize = 10
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlUnitsSamplesPartialList'
        Caption = 'Only a partial list may be shown'
      end
      object iwbDownloadUnitsSamples: TIWButton
        AlignWithMargins = False
        Left = 348
        Top = 27
        Width = 168
        Height = 25
        Caption = 'Download Units / Samples'
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbDownloadUnitsSamples'
        TabOrder = 14
        OnClick = iwbDownloadUnitsSamplesClick
      end
      object iwbShowUnitsSamples: TIWButton
        AlignWithMargins = False
        Left = 184
        Top = 28
        Width = 145
        Height = 25
        Caption = 'Show Units / Samples'
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbShowUnitsSamples'
        TabOrder = 12
        OnClick = iwbShowUnitsSamplesClick
      end
      object iwbUpdateUnitAge: TIWButton
        AlignWithMargins = False
        Left = 536
        Top = 27
        Width = 124
        Height = 25
        Caption = 'Check Unit Ages'
        Color = clBtnFace
        FriendlyName = 'iwbUpdateUnitAge'
        TabOrder = 15
        OnClick = iwbUpdateUnitAgeClick
      end
    end
    object iwrGraphOptions: TIWRegion
      Left = 0
      Top = 2107
      Width = 991
      Height = 661
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      Color = clWebLEMONCHIFFON
      object IWLabel1: TIWLabel
        AlignWithMargins = False
        Left = 6
        Top = 14
        Width = 125
        Height = 18
        Font.FontName = 'Verdana'
        Font.Size = 12
        Font.Style = [fsBold]
        Font.PxSize = 16
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Data Options'
      end
      object iweGraphAgeFrom: TIWEdit
        AlignWithMargins = False
        Left = 16
        Top = 46
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweGraphAgeFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 23
        Text = '0.0'
      end
      object IWLabel11: TIWLabel
        AlignWithMargins = False
        Left = 98
        Top = 49
        Width = 117
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= Age (Ma) <='
      end
      object iweGraphAgeTo: TIWEdit
        AlignWithMargins = False
        Left = 240
        Top = 46
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweGraphAgeTo'
        SubmitOnAsyncEvent = True
        TabOrder = 24
        Text = '4500.0'
      end
      object iwbScalePDFAxes: TIWButton
        AlignWithMargins = False
        Left = 505
        Top = 521
        Width = 136
        Height = 25
        Caption = 'Rescale Axes'
        Color = clBtnFace
        FriendlyName = 'iwbScalePDFAxes'
        TabOrder = 41
        OnClick = iwbScalePDFAxesClick
      end
      object iwcbGraphsAutoscale: TIWCheckBox
        AlignWithMargins = False
        Left = 505
        Top = 552
        Width = 136
        Height = 21
        Caption = 'Auto-scale axes'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 42
        OnClick = iwcbGraphsAutoscaleClick
        OnChange = iwcbGraphsAutoscaleChange
        Checked = True
        FriendlyName = 'iwcbGraphsAutoscale'
      end
      object iweConcordanceFrom: TIWEdit
        AlignWithMargins = False
        Left = 16
        Top = 73
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 25
        Text = '90.0'
      end
      object IWLabel5: TIWLabel
        AlignWithMargins = False
        Left = 86
        Top = 73
        Width = 165
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= % Concordance <='
      end
      object iweConcordanceTo: TIWEdit
        AlignWithMargins = False
        Left = 240
        Top = 72
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceTo'
        SubmitOnAsyncEvent = True
        TabOrder = 26
        Text = '110.0'
      end
      object iwbCalculateProbabilityCurves: TIWButton
        AlignWithMargins = False
        Left = 16
        Top = 409
        Width = 230
        Height = 25
        Caption = 'Calculate Probability Curves'
        Color = clWebLIGHTSKYBLUE
        FriendlyName = 'iwbCalculateProbabilityCurves'
        TabOrder = 29
        OnClick = iwbCalculateProbabilityCurvesClick
      end
      object IWLabel4: TIWLabel
        AlignWithMargins = False
        Left = 505
        Top = 48
        Width = 211
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Min. 1 sigma age uncertainty'
      end
      object iwcbExcludeDataWithoutAnalyses: TIWCheckBox
        AlignWithMargins = False
        Left = 505
        Top = 72
        Width = 264
        Height = 21
        Caption = 'Exclude Data Without Analyses'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 28
        Checked = False
        FriendlyName = 'iwcbExcludeDataWithoutAnalyses'
      end
      object iwrgAndOr: TIWRadioGroup
        AlignWithMargins = False
        Left = 863
        Top = 70
        Width = 89
        Height = 43
        SubmitOnAsyncEvent = True
        RawText = False
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iwrgAndOr'
        ItemIndex = 0
        Items.Strings = (
          'AND'
          'OR')
        Layout = glVertical
        TabOrder = 31
      end
      object IWLabel10: TIWLabel
        AlignWithMargins = False
        Left = 844
        Top = 48
        Width = 113
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel10'
        Caption = 'Probability type'
      end
      object iweMinimumUncertainty: TIWEdit
        AlignWithMargins = False
        Left = 711
        Top = 46
        Width = 43
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweMinimumUncertainty'
        SubmitOnAsyncEvent = True
        TabOrder = 27
        Text = '5.0'
      end
      object IWLabel7: TIWLabel
        AlignWithMargins = False
        Left = 768
        Top = 48
        Width = 20
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        HasTabOrder = False
        FriendlyName = 'IWLabel4'
        Caption = 'Ma'
      end
      object iwe1: TIWEdit
        AlignWithMargins = False
        Left = 127
        Top = 613
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 43
        Text = '0.1'
      end
      object IWLabel2: TIWLabel
        AlignWithMargins = False
        Left = 12
        Top = 614
        Width = 108
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = 'Symbol cutoffs'
      end
      object IWLabel3: TIWLabel
        AlignWithMargins = False
        Left = 192
        Top = 614
        Width = 59
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= 1 <='
      end
      object iwe2: TIWEdit
        AlignWithMargins = False
        Left = 255
        Top = 613
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 44
        Text = '10.0'
      end
      object IWLabel6: TIWLabel
        AlignWithMargins = False
        Left = 320
        Top = 614
        Width = 59
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= 2 <='
      end
      object iwe3: TIWEdit
        AlignWithMargins = False
        Left = 383
        Top = 613
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 45
        Text = '40.0'
      end
      object IWLabel8: TIWLabel
        AlignWithMargins = False
        Left = 448
        Top = 614
        Width = 59
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= 3 <='
      end
      object iwe4: TIWEdit
        AlignWithMargins = False
        Left = 513
        Top = 613
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 46
        Text = '60.0'
      end
      object IWLabel9: TIWLabel
        AlignWithMargins = False
        Left = 578
        Top = 614
        Width = 59
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= 4 <='
      end
      object iwe5: TIWEdit
        AlignWithMargins = False
        Left = 643
        Top = 613
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweConcordanceFrom'
        SubmitOnAsyncEvent = True
        TabOrder = 47
        Text = '80.0'
      end
      object IWLabel13: TIWLabel
        AlignWithMargins = False
        Left = 708
        Top = 614
        Width = 34
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= 5'
      end
      object iweXMin: TIWEdit
        AlignWithMargins = False
        Left = 16
        Top = 547
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweXMin'
        SubmitOnAsyncEvent = True
        TabOrder = 38
        Text = '0.0'
      end
      object iweYMin: TIWEdit
        AlignWithMargins = False
        Left = 16
        Top = 520
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweYMin'
        SubmitOnAsyncEvent = True
        TabOrder = 35
        Text = '0.0'
      end
      object IWLabel25: TIWLabel
        AlignWithMargins = False
        Left = 99
        Top = 550
        Width = 119
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= Grain Age <='
      end
      object IWLabel26: TIWLabel
        AlignWithMargins = False
        Left = 81
        Top = 522
        Width = 158
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = '<= Deposition Age <='
      end
      object iweXMax: TIWEdit
        AlignWithMargins = False
        Left = 241
        Top = 547
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweXMax'
        SubmitOnAsyncEvent = True
        TabOrder = 39
        Text = '4500.0'
      end
      object iweYMax: TIWEdit
        AlignWithMargins = False
        Left = 241
        Top = 520
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweYMax'
        SubmitOnAsyncEvent = True
        TabOrder = 36
        Text = '4500.0'
      end
      object IWLabel12: TIWLabel
        AlignWithMargins = False
        Left = 323
        Top = 522
        Width = 73
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = 'Increment'
      end
      object IWLabel14: TIWLabel
        AlignWithMargins = False
        Left = 323
        Top = 550
        Width = 73
        Height = 16
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = 'Increment'
      end
      object iweYIncrement: TIWEdit
        AlignWithMargins = False
        Left = 400
        Top = 520
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweYMax'
        SubmitOnAsyncEvent = True
        TabOrder = 37
        Text = '400.0'
      end
      object iweXIncrement: TIWEdit
        AlignWithMargins = False
        Left = 400
        Top = 547
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweXMax'
        SubmitOnAsyncEvent = True
        TabOrder = 40
        Text = '400.0'
      end
      object IWLabel15: TIWLabel
        AlignWithMargins = False
        Left = 6
        Top = 486
        Width = 138
        Height = 18
        Font.FontName = 'Verdana'
        Font.Size = 12
        Font.Style = [fsBold]
        Font.PxSize = 16
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'Graph Options'
      end
      object iwcbShow1: TIWCheckBox
        AlignWithMargins = False
        Left = 211
        Top = 636
        Width = 30
        Height = 21
        Editable = True
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 48
        OnClick = iwcbShow1Click
        Checked = True
        FriendlyName = 'iwcbShow1'
      end
      object iwcbShow2: TIWCheckBox
        AlignWithMargins = False
        Left = 339
        Top = 636
        Width = 30
        Height = 21
        Editable = True
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 49
        OnClick = iwcbShow1Click
        Checked = True
        FriendlyName = 'iwcbShow2'
      end
      object iwcbShow3: TIWCheckBox
        AlignWithMargins = False
        Left = 467
        Top = 636
        Width = 30
        Height = 21
        Editable = True
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 50
        OnClick = iwcbShow1Click
        Checked = True
        FriendlyName = 'iwcbShow3'
      end
      object iwcbShow4: TIWCheckBox
        AlignWithMargins = False
        Left = 599
        Top = 636
        Width = 30
        Height = 21
        Editable = True
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 51
        OnClick = iwcbShow1Click
        Checked = True
        FriendlyName = 'iwcbShow4'
      end
      object iwcbShow5: TIWCheckBox
        AlignWithMargins = False
        Left = 729
        Top = 636
        Width = 30
        Height = 21
        Editable = True
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 52
        OnClick = iwcbShow1Click
        Checked = True
        FriendlyName = 'iwcbShow5'
      end
      object iwbDeleteUserGrainAgePDF: TIWButton
        AlignWithMargins = False
        Left = 266
        Top = 409
        Width = 230
        Height = 25
        Caption = 'Delete User Project PDF Records'
        Enabled = False
        Color = clWebLIGHTCORAL
        FriendlyName = 'iwbDeleteUserGrainAgePDF'
        TabOrder = 30
        OnClick = iwbDeleteUserGrainAgePDFClick
      end
      object iwbGraphExistingProbabilityCurves: TIWButton
        AlignWithMargins = False
        Left = 516
        Top = 409
        Width = 230
        Height = 25
        Caption = 'Graph Existing Probability Curves'
        Color = clWebLIGHTSKYBLUE
        FriendlyName = 'iwbGraphExistingProbabilityCurves'
        TabOrder = 32
        OnClick = iwbGraphExistingProbabilityCurvesClick
      end
      object iweVar1Cutoff: TIWEdit
        AlignWithMargins = False
        Left = 766
        Top = 520
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweVar1Cutoff'
        SubmitOnAsyncEvent = True
        TabOrder = 53
        Text = '0.1'
      end
      object iweVar2Cutoff: TIWEdit
        AlignWithMargins = False
        Left = 766
        Top = 544
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweVar2Cutoff'
        SubmitOnAsyncEvent = True
        TabOrder = 54
        Text = '600.0'
      end
      object iweVar3Cutoff: TIWEdit
        AlignWithMargins = False
        Left = 766
        Top = 568
        Width = 59
        Height = 21
        StyleRenderOptions.RenderBorder = False
        Alignment = taRightJustify
        NonEditableAsLabel = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        FriendlyName = 'iweVar3Cutoff'
        SubmitOnAsyncEvent = True
        TabOrder = 55
        Text = '10.0'
      end
      object IWLabel19: TIWLabel
        AlignWithMargins = False
        Left = 766
        Top = 498
        Width = 198
        Height = 16
        Font.FontName = 'Verdana'
        Font.Style = [fsBold]
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = 'Zircon Chemistry Cutoffs'
      end
      object iwcbVar1: TIWCheckBox
        AlignWithMargins = False
        Left = 831
        Top = 520
        Width = 154
        Height = 21
        Caption = 'Th/U'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 56
        OnClick = iwcbVar1Click
        Checked = True
        FriendlyName = 'iwcbVar1'
      end
      object iwcbVar2: TIWCheckBox
        AlignWithMargins = False
        Left = 831
        Top = 544
        Width = 154
        Height = 21
        Caption = 'T from Ti in zircon'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 57
        Checked = False
        FriendlyName = 'iwcbVar2'
      end
      object iwcbVar3: TIWCheckBox
        AlignWithMargins = False
        Left = 831
        Top = 568
        Width = 154
        Height = 21
        Caption = 'delta 18 Oxygen'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 58
        Checked = False
        FriendlyName = 'iwcbVar3'
      end
      object iwrectCutoffs: TIWRectangle
        AlignWithMargins = False
        Left = 754
        Top = 496
        Width = 6
        Height = 161
        BorderOptions.Width = 0
        FriendlyName = 'iwrectCutoffs'
        Color = clMoneyGreen
        Alignment = taLeftJustify
        VAlign = vaMiddle
      end
      object iwcbShowBelowCutoff: TIWCheckBox
        AlignWithMargins = False
        Left = 768
        Top = 636
        Width = 177
        Height = 21
        Caption = 'Show <= cutoff'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 60
        OnClick = iwcbShowBelowCutoffClick
        Checked = True
        FriendlyName = 'iwcbShowBelowCutoff'
      end
      object iwcbShowAboveCutoff: TIWCheckBox
        AlignWithMargins = False
        Left = 768
        Top = 618
        Width = 177
        Height = 21
        Caption = 'Show > cutoff'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 59
        OnClick = iwcbShowAboveCutoffClick
        Checked = True
        FriendlyName = 'iwcbShowAboveCutoff'
      end
      object IWLabel16: TIWLabel
        AlignWithMargins = False
        Left = 6
        Top = 592
        Width = 172
        Height = 16
        Font.FontName = 'Verdana'
        Font.Style = [fsBold]
        Font.PxSize = 13
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel5'
        Caption = 'Age Probability Graph'
      end
      object iwbPopulateChemistryGraph: TIWButton
        AlignWithMargins = False
        Left = 766
        Top = 409
        Width = 230
        Height = 25
        Caption = 'Populate Chemistry Graph'
        Color = clWebLIGHTSKYBLUE
        FriendlyName = 'iwbPopulateChemistryGraph'
        TabOrder = 34
        OnClick = iwbPopulateChemistryGraphClick
      end
      object iwbGetChemistryAgeData: TIWButton
        AlignWithMargins = False
        Left = 766
        Top = 383
        Width = 230
        Height = 25
        Caption = 'Get Chemistry Age Data'
        Color = clWebLIGHTSKYBLUE
        FriendlyName = 'iwbGetChemistryAgeData'
        TabOrder = 33
        OnClick = iwbGetChemistryAgeDataClick
      end
      object iwlSampleZones: TIWListbox
        AlignWithMargins = False
        Left = 16
        Top = 152
        Width = 284
        Height = 233
        TabOrder = 65
        FriendlyName = 'iwlSampleZones'
      end
      object iwcbIncludeSampleZones: TIWCheckBox
        AlignWithMargins = False
        Left = 16
        Top = 125
        Width = 202
        Height = 21
        Caption = 'Include Grain Zones'
        Editable = True
        Font.FontName = 'Verdana'
        Font.PxSize = 13
        SubmitOnAsyncEvent = True
        Style = stNormal
        TabOrder = 66
        Checked = False
        FriendlyName = 'iwcbIncludeSampleZones'
      end
    end
    object iwrGraphDownloadPDF: TIWRegion
      Left = 0
      Top = 3468
      Width = 991
      Height = 101
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwbDownloadGrainCurves: TIWButton
        AlignWithMargins = False
        Left = 16
        Top = 14
        Width = 249
        Height = 25
        Caption = 'Download Probability Curves to Excel'
        Enabled = False
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbDownloadGrainCurves'
        TabOrder = 62
        OnClick = iwbDownloadGrainCurvesClick
      end
      object iwmGraphExplanation: TIWMemo
        AlignWithMargins = False
        Left = 505
        Top = 6
        Width = 467
        Height = 87
        StyleRenderOptions.RenderBorder = False
        BGColor = clNone
        Editable = False
        Font.FontName = 'Verdana'
        Font.Size = 8
        Font.PxSize = 10
        Font.Color = clWebGRAY
        InvisibleBorder = True
        HorizScrollBar = False
        VertScrollBar = False
        Required = False
        TabOrder = 61
        SubmitOnAsyncEvent = True
        FriendlyName = 'iwmGraphExplanation'
        Lines.Strings = (
          
            'Graph illustrates the probability distribution for data from ind' +
            'ividual lithostratigraphic units. Larger symbol sizes denote hig' +
            'her probabilities. Red and orange colours further emphasize the ' +
            'highest probabilities. Diagonal line delineates where grain ages' +
            ' are equivalent to the interpreted minimum unit age, as captured' +
            ' in the StratDB database.')
      end
    end
    object iwrGraphProbabilityGraph: TIWRegion
      Left = 0
      Top = 2768
      Width = 991
      Height = 700
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwChartPDF: TIWChart
        AlignWithMargins = False
        Left = 0
        Top = 0
        Width = 991
        Height = 700
        Align = alClient
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        BorderOptions.Width = 0
        UseSize = False
        Chart = ChartPDF
        ExplicitLeft = 156
        ExplicitTop = 168
        ExplicitWidth = 453
        ExplicitHeight = 201
      end
      object ChartPDF: TChart
        Left = 0
        Top = 0
        Width = 991
        Height = 700
        BackWall.Brush.Gradient.Direction = gdBottomTop
        BackWall.Brush.Gradient.EndColor = clWhite
        BackWall.Brush.Gradient.StartColor = 15395562
        BackWall.Brush.Gradient.Visible = True
        BackWall.Transparent = False
        Foot.Alignment = taLeftJustify
        Foot.Font.Color = clGray
        Foot.Font.Name = 'Verdana'
        Foot.Text.Strings = (
          
            'Data from StratDB Lithostratigraphy and DateView Geochronology D' +
            'atabases'
          'Bruce Eglington (2015)')
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = clWhite
        Gradient.MidColor = 15395562
        Gradient.StartColor = 15395562
        Gradient.Visible = True
        LeftWall.Color = clLightyellow
        Legend.Alignment = laBottom
        Legend.CheckBoxes = True
        Legend.Font.Name = 'Verdana'
        Legend.Shadow.Transparency = 0
        RightWall.Color = clLightyellow
        SubFoot.Alignment = taRightJustify
        SubFoot.Font.Color = clGray
        SubFoot.Font.Name = 'Verdana'
        SubFoot.Text.Strings = (
          'Gaussian '#39'AND'#39
          'Minimum age uncertainty = 5 Ma')
        SubTitle.Font.Name = 'Verdana'
        Title.Font.Color = clBlack
        Title.Font.Height = -17
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'Age Probabilities')
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMaximum = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.Axis.Color = 4210752
        BottomAxis.ExactDateTime = False
        BottomAxis.Grid.Color = clDarkgray
        BottomAxis.Increment = 400.000000000000000000
        BottomAxis.LabelsFormat.Font.Name = 'Verdana'
        BottomAxis.Maximum = 4500.000000000000000000
        BottomAxis.TicksInner.Color = clDarkgray
        BottomAxis.Title.Caption = 'Grain Age (Ma)'
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Verdana'
        BottomAxis.Title.Font.Style = [fsBold]
        DepthAxis.Axis.Color = 4210752
        DepthAxis.Grid.Color = clDarkgray
        DepthAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthAxis.TicksInner.Color = clDarkgray
        DepthAxis.Title.Font.Name = 'Verdana'
        DepthTopAxis.Axis.Color = 4210752
        DepthTopAxis.Grid.Color = clDarkgray
        DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthTopAxis.TicksInner.Color = clDarkgray
        DepthTopAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Axis.Color = 4210752
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clDarkgray
        LeftAxis.Increment = 200.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.LabelsFormat.Font.Name = 'Verdana'
        LeftAxis.Maximum = 3600.000000000000000000
        LeftAxis.TicksInner.Color = clDarkgray
        LeftAxis.Title.Caption = 'Deposition Age (Ma)'
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = [fsBold]
        RightAxis.Axis.Color = 4210752
        RightAxis.Grid.Color = clDarkgray
        RightAxis.LabelsFormat.Font.Name = 'Verdana'
        RightAxis.TicksInner.Color = clDarkgray
        RightAxis.Title.Font.Name = 'Verdana'
        TopAxis.Axis.Color = 4210752
        TopAxis.Grid.Color = clDarkgray
        TopAxis.LabelsFormat.Font.Name = 'Verdana'
        TopAxis.TicksInner.Color = clDarkgray
        TopAxis.Title.Font.Name = 'Verdana'
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabStop = False
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          19
          15
          19)
        ColorPaletteIndex = 13
        object Series1: TPointSeries
          Title = '1'
          ClickableLine = False
          Pointer.Brush.Color = clBlack
          Pointer.Brush.Gradient.EndColor = 10708548
          Pointer.Gradient.EndColor = 10708548
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psDiamond
          Pointer.VertSize = 1
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series2: TPointSeries
          Title = '2'
          ClickableLine = False
          Pointer.Brush.Color = clBlack
          Pointer.Brush.Gradient.EndColor = 3513587
          Pointer.Gradient.EndColor = 3513587
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Style = psDiamond
          Pointer.VertSize = 2
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series3: TPointSeries
          Title = '3'
          ClickableLine = False
          Pointer.Brush.Color = clBlack
          Pointer.Brush.Gradient.EndColor = 1330417
          Pointer.Gradient.EndColor = 1330417
          Pointer.HorizSize = 3
          Pointer.InflateMargins = False
          Pointer.Style = psDiamond
          Pointer.VertSize = 3
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series4: TPointSeries
          Title = '4'
          ClickableLine = False
          Pointer.Brush.Color = 4227327
          Pointer.Brush.Gradient.EndColor = 11048782
          Pointer.Gradient.EndColor = 11048782
          Pointer.InflateMargins = False
          Pointer.Pen.Color = 4227327
          Pointer.Style = psHexagon
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series5: TPointSeries
          Title = '5'
          ClickableLine = False
          Pointer.Brush.Color = clRed
          Pointer.Brush.Gradient.EndColor = 7028779
          Pointer.Gradient.EndColor = 7028779
          Pointer.HorizSize = 5
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clRed
          Pointer.Style = psRectangle
          Pointer.VertSize = 5
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series6: TLineSeries
          ColorEachLine = False
          SeriesColor = 4227200
          Title = 'Equal age'
          Brush.BackColor = clDefault
          ClickableLine = False
          Dark3D = False
          LinePen.Color = 4227200
          Pointer.Brush.Gradient.EndColor = 4227200
          Pointer.Gradient.EndColor = 4227200
          Pointer.HorizSize = 1
          Pointer.InflateMargins = False
          Pointer.Style = psRectangle
          Pointer.VertSize = 1
          TreatNulls = tnIgnore
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
    end
    object iwrGraphChemistry: TIWRegion
      Left = 0
      Top = 3569
      Width = 991
      Height = 600
      RenderInvisibleControls = True
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwChartChem: TIWChart
        AlignWithMargins = False
        Left = 0
        Top = 0
        Width = 991
        Height = 600
        Align = alClient
        RenderSize = False
        StyleRenderOptions.RenderSize = False
        BorderOptions.Width = 0
        UseSize = False
        Chart = ChartChem
        ExplicitLeft = 156
        ExplicitTop = 168
        ExplicitWidth = 453
        ExplicitHeight = 201
      end
      object ChartChem: TChart
        Left = 0
        Top = 0
        Width = 991
        Height = 600
        BackWall.Brush.Gradient.Direction = gdBottomTop
        BackWall.Brush.Gradient.EndColor = clWhite
        BackWall.Brush.Gradient.StartColor = 15395562
        BackWall.Brush.Gradient.Visible = True
        BackWall.Transparent = False
        Foot.Alignment = taLeftJustify
        Foot.Color = clSilver
        Foot.Font.Color = clGray
        Foot.Font.Name = 'Verdana'
        Foot.Text.Strings = (
          
            'Data from StratDB Lithostratigraphy and DateView Geochronology D' +
            'atabases'
          'Bruce Eglington (2015)')
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = clWhite
        Gradient.MidColor = 15395562
        Gradient.StartColor = 15395562
        Gradient.Visible = True
        LeftWall.Color = clLightyellow
        Legend.Alignment = laBottom
        Legend.CheckBoxes = True
        Legend.Font.Name = 'Verdana'
        Legend.Shadow.Transparency = 0
        RightWall.Color = clLightyellow
        SubFoot.Alignment = taRightJustify
        SubFoot.Font.Color = clGray
        SubFoot.Font.Name = 'Verdana'
        SubTitle.Font.Name = 'Verdana'
        Title.Font.Color = clBlack
        Title.Font.Height = -17
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'Zircon Chemistry')
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMaximum = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.Axis.Color = 4210752
        BottomAxis.ExactDateTime = False
        BottomAxis.Grid.Color = clDarkgray
        BottomAxis.Increment = 400.000000000000000000
        BottomAxis.LabelsFormat.Font.Name = 'Verdana'
        BottomAxis.Maximum = 4500.000000000000000000
        BottomAxis.TicksInner.Color = clDarkgray
        BottomAxis.Title.Caption = 'Grain Age (Ma)'
        BottomAxis.Title.Font.Height = -13
        BottomAxis.Title.Font.Name = 'Verdana'
        BottomAxis.Title.Font.Style = [fsBold]
        DepthAxis.Axis.Color = 4210752
        DepthAxis.Grid.Color = clDarkgray
        DepthAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthAxis.TicksInner.Color = clDarkgray
        DepthAxis.Title.Font.Name = 'Verdana'
        DepthTopAxis.Axis.Color = 4210752
        DepthTopAxis.Grid.Color = clDarkgray
        DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthTopAxis.TicksInner.Color = clDarkgray
        DepthTopAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Axis.Color = 4210752
        LeftAxis.ExactDateTime = False
        LeftAxis.Grid.Color = clDarkgray
        LeftAxis.Increment = 200.000000000000000000
        LeftAxis.Inverted = True
        LeftAxis.LabelsFormat.Font.Name = 'Verdana'
        LeftAxis.Maximum = 3600.000000000000000000
        LeftAxis.TicksInner.Color = clDarkgray
        LeftAxis.Title.Caption = 'Deposition Age (Ma)'
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = [fsBold]
        RightAxis.Axis.Color = 4210752
        RightAxis.Grid.Color = clDarkgray
        RightAxis.LabelsFormat.Font.Name = 'Verdana'
        RightAxis.TicksInner.Color = clDarkgray
        RightAxis.Title.Font.Name = 'Verdana'
        TopAxis.Axis.Color = 4210752
        TopAxis.Grid.Color = clDarkgray
        TopAxis.LabelsFormat.Font.Name = 'Verdana'
        TopAxis.TicksInner.Color = clDarkgray
        TopAxis.Title.Font.Name = 'Verdana'
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabStop = False
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          19
          15
          19)
        ColorPaletteIndex = 13
        object PointSeries5: TPointSeries
          Title = 'Th/U > Chosen value'
          ClickableLine = False
          Pointer.Brush.Color = clRed
          Pointer.Brush.Gradient.EndColor = 7028779
          Pointer.Gradient.EndColor = 7028779
          Pointer.HorizSize = 2
          Pointer.InflateMargins = False
          Pointer.Pen.Color = clRed
          Pointer.Style = psRectangle
          Pointer.VertSize = 2
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series7: TPointSeries
          Title = 'Th/U <= Chosen value'
          ClickableLine = False
          Pointer.Brush.Color = clBlue
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 8404992
          Pointer.Style = psDiamond
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series8: TLineSeries
          SeriesColor = 4227200
          Title = 'Equal Age'
          Brush.Color = 4227200
          Brush.BackColor = clDefault
          LinePen.Color = 4227200
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
    end
    object iwrGraphDownloadChem: TIWRegion
      Left = 0
      Top = 4169
      Width = 991
      Height = 101
      HorzScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object IWMemo1: TIWMemo
        AlignWithMargins = False
        Left = 505
        Top = 6
        Width = 467
        Height = 87
        StyleRenderOptions.RenderBorder = False
        BGColor = clNone
        Editable = False
        Font.FontName = 'Verdana'
        Font.Size = 8
        Font.PxSize = 10
        Font.Color = clWebGRAY
        InvisibleBorder = True
        HorizScrollBar = False
        VertScrollBar = False
        Required = False
        TabOrder = 64
        SubmitOnAsyncEvent = True
        FriendlyName = 'iwmGraphExplanation'
        Lines.Strings = (
          
            'Graph illustrates the distribution for data from individual lith' +
            'ostratigraphic units. Red symbols show grains with values greate' +
            'r than the cutoff for the plotted variable whereas blue symbols ' +
            'reflect values less than the cutoff.')
      end
      object iwbDownloadGrainAgeData: TIWButton
        AlignWithMargins = False
        Left = 16
        Top = 14
        Width = 249
        Height = 25
        Caption = 'Download Grain Age Data to Excel'
        Enabled = False
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbDownloadGrainAgeData'
        TabOrder = 63
        OnClick = iwbDownloadGrainAgeDataClick
      end
      object iwbDownloadData: TIWButton
        AlignWithMargins = False
        Left = 16
        Top = 45
        Width = 249
        Height = 25
        Caption = 'Download Data'
        Enabled = False
        Color = clBtnFace
        Font.Size = 9
        Font.PxSize = 12
        FriendlyName = 'iwbDownloadData'
        TabOrder = 68
        OnClick = iwbDownloadDataClick
      end
    end
  end
  inline TopBar: TISFTopBarStrat
    Left = 0
    Top = 0
    Width = 1079
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
    ExplicitWidth = 1079
    inherited IWFrameRegion: TIWRegion
      Width = 1079
      TabOrder = 22
      ExplicitWidth = 1079
      inherited iwrHeader: TIWRegion
        Width = 1079
        ExplicitWidth = 1079
        inherited iwrWelcome: TIWRegion
          Width = 1079
          ExplicitWidth = 1079
          inherited iwrDisplayUserName: TIWRegion
            Width = 879
            ExplicitWidth = 879
            inherited lblWelcome: TIWLabel
              Left = 606
              Font.Color = clWebDARKSLATEGRAY
              ExplicitLeft = 606
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1079
          ExplicitWidth = 1079
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
  object iwrRight: TIWRegion
    Left = 1064
    Top = 55
    Width = 15
    Height = 4245
    RenderInvisibleControls = False
    TabOrder = 5
    Align = alRight
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
  end
end
