object dmLIP: TdmLIP
  Height = 654
  Width = 1290
  object qLIPSizes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM LIPSIZES'
      'ORDER BY LIPSIZEID')
    SQLConnection = sqlcLIP
    Left = 30
    Top = 58
  end
  object dspLIPSizes: TDataSetProvider
    DataSet = qLIPSizes
    Left = 58
    Top = 58
  end
  object cdsLIPSizes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPSizes'
    Left = 86
    Top = 58
    object cdsLIPSizesLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPSizesLIPSIZEDESCRIPTION: TWideStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object qLIPRatings: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM LIPRATINGS')
    SQLConnection = sqlcLIP
    Left = 28
    Top = 104
  end
  object dspLIPRatings: TDataSetProvider
    DataSet = qLIPRatings
    Left = 56
    Top = 104
  end
  object cdsLIPRatings: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPRatings'
    Left = 84
    Top = 104
    object cdsLIPRatingsLIPRATINGID: TWideStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLIPRatingsLIPRATINGDESCRIPTION: TWideStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object qLIPForms: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM LIPFORMS')
    SQLConnection = sqlcLIP
    Left = 30
    Top = 146
  end
  object dspLIPForms: TDataSetProvider
    DataSet = qLIPForms
    Left = 60
    Top = 148
  end
  object cdsLIPForms: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPForms'
    Left = 88
    Top = 148
    object cdsLIPFormsLIPFORMID: TIntegerField
      FieldName = 'LIPFORMID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPFormsLIPFORMTYPE: TWideStringField
      FieldName = 'LIPFORMTYPE'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object dspRefFull: TDataSetProvider
    Options = [poCascadeUpdates, poAutoRefresh, poPropogateChanges]
    Left = 36
    Top = 330
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 64
    Top = 330
    object cdsRefFullREFNUM: TIntegerField
      FieldName = 'REFNUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRefFullSOURCEDES: TBlobField
      DisplayLabel = 'Reference'
      FieldName = 'SOURCEDES'
      Size = 1
    end
  end
  object dsLIPSizes: TDataSource
    AutoEdit = False
    DataSet = cdsLIPSizes
    Left = 114
    Top = 58
  end
  object dsLIPRatings: TDataSource
    DataSet = cdsLIPRatings
    Left = 120
    Top = 128
  end
  object dsLIPForms: TDataSource
    DataSet = cdsLIPForms
    Left = 116
    Top = 148
  end
  object dsRefFull: TDataSource
    DataSet = cdsRefFull
    Left = 90
    Top = 330
  end
  object qLIPs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT LIPS.LIPID, LIPS.LIPNAME,'
      'LIPS.LIPNAME || '#39'  '#39' || LIPS.LIPID AS LIPNAMELIPID,'
      'LIPS.LIPPARENTID,LIPS.CONTINENTID'
      'FROM LIPS,LIPFOR,USERSWHOFOR'
      'WHERE USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'ORDER BY LIPS.LIPNAME')
    SQLConnection = sqlcLIP
    Left = 32
    Top = 191
  end
  object dspLIPs: TDataSetProvider
    DataSet = qLIPs
    Left = 62
    Top = 192
  end
  object cdsLIPs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPs'
    Left = 90
    Top = 192
    object cdsLIPsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPsLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsLIPsLIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsLIPsLIPNAMELIPID: TWideStringField
      FieldName = 'LIPNAMELIPID'
      FixedChar = True
      Size = 63
    end
    object cdsLIPsCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dsLIPs: TDataSource
    DataSet = cdsLIPs
    Left = 118
    Top = 190
  end
  object qValidFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPVALID.LIPID, LIPVALID.VALIDSTATUSID,'
      '  LIPVALID.DATEDONE, LIPVALID.DONEBY,'
      '  LIPVALID.COMMENTS'
      'from LIPVALID'
      'where LIPVALID.LIPID = :LIPID')
    SQLConnection = sqlcLIP
    Left = 40
    Top = 380
  end
  object dspValidFull: TDataSetProvider
    DataSet = qValidFull
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 68
    Top = 380
  end
  object cdsValidFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValidFull'
    Left = 96
    Top = 380
    object cdsValidFullLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsValidFullDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
      DisplayFormat = 'ddddd'
    end
    object cdsValidFullCOMMENTS: TBlobField
      FieldName = 'COMMENTS'
    end
    object cdsValidFullVALIDSTATUSID: TWideStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsValidFullDONEBY: TWideStringField
      FieldName = 'DONEBY'
      Required = True
      FixedChar = True
    end
  end
  object dsValidFull: TDataSource
    DataSet = cdsValidFull
    Left = 124
    Top = 380
  end
  object qRep2: TSQLQuery
    DataSource = dsqRep1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID, LIPS.CONTINENTID,'
      '  LIPS.SPOTLATITUDE,  LIPS.SPOTLONGITUDE,'
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.LIPPARENTID,LIPS.AREALEXTENT,'
      '  LIPS.VOLUMEESTIMATE,LIPS.PLOTBARCODE,'
      '  LIPS.BARCODEAGE,LIPS.LIPHEADING,'
      '  LIPSIZES.LIPSIZEDESCRIPTION,'
      '  LIPRATINGS.LIPRATINGDESCRIPTION,'
      '  DOMINANTCOMPOSITION.DOMINANTCOMPOSITION,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL'
      
        'from LIPS, LIPSIZES,LIPRATINGS,CONSTRAINTS,LIPCOMPOSITIONS,DOMIN' +
        'ANTCOMPOSITION,USERSWHOFOR,LIPFOR'
      'where LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPPARENTID=:LIPID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'ORDER BY LIPS.LIPID,LIPS.MINPLOTAGE, LIPS.LIPNAME'
      '')
    SQLConnection = sqlcLIP
    Left = 248
    Top = 117
  end
  object qRep3: TSQLQuery
    DataSource = dsqRep2
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID,LIPS.CONTINENTID, '
      '  LIPS.SPOTLATITUDE,  LIPS.SPOTLONGITUDE,'
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.LIPPARENTID,LIPS.AREALEXTENT,'
      '  LIPS.VOLUMEESTIMATE,LIPS.PLOTBARCODE,'
      '  LIPS.BARCODEAGE,LIPS.LIPHEADING,'
      '  LIPSIZES.LIPSIZEDESCRIPTION,'
      '  LIPRATINGS.LIPRATINGDESCRIPTION,'
      '  DOMINANTCOMPOSITION.DOMINANTCOMPOSITION,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL'
      
        'from LIPS, LIPSIZES,LIPRATINGS,CONSTRAINTS,LIPCOMPOSITIONS,DOMIN' +
        'ANTCOMPOSITION,USERSWHOFOR,LIPFOR'
      'where LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPPARENTID=:LIPID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'ORDER BY LIPS.LIPID,LIPS.MINPLOTAGE, LIPS.LIPNAME'
      '')
    SQLConnection = sqlcLIP
    Left = 248
    Top = 161
  end
  object qRep4: TSQLQuery
    DataSource = dsqRep3
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID,LIPS.CONTINENTID, '
      '  LIPS.SPOTLATITUDE,  LIPS.SPOTLONGITUDE,'
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.LIPPARENTID,LIPS.AREALEXTENT,'
      '  LIPS.VOLUMEESTIMATE,LIPS.PLOTBARCODE,'
      '  LIPS.BARCODEAGE,LIPS.LIPHEADING,'
      '  LIPSIZES.LIPSIZEDESCRIPTION,'
      '  LIPRATINGS.LIPRATINGDESCRIPTION,'
      '  DOMINANTCOMPOSITION.DOMINANTCOMPOSITION,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL'
      
        'from LIPS, LIPSIZES,LIPRATINGS,CONSTRAINTS,LIPCOMPOSITIONS,DOMIN' +
        'ANTCOMPOSITION,USERSWHOFOR,LIPFOR'
      'where LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID'
      'AND LIPS.LIPPARENTID=:LIPID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'ORDER BY LIPS.LIPID,LIPS.MINPLOTAGE, LIPS.LIPNAME'
      '')
    SQLConnection = sqlcLIP
    Left = 248
    Top = 205
  end
  object dsqRep2: TDataSource
    DataSet = qRep2
    Left = 276
    Top = 117
  end
  object dsqRep3: TDataSource
    DataSet = qRep3
    Left = 276
    Top = 161
  end
  object dsqRep4: TDataSource
    DataSet = qRep4
    Left = 276
    Top = 205
  end
  object cdsRep2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRep1qRep2
    Params = <>
    Left = 304
    Top = 117
    object cdsRep2LIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsRep2LIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsRep2SPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object cdsRep2SPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object cdsRep2MINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsRep2MAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsRep2LIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsRep2AREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsRep2VOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object cdsRep2BARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsRep2qRep3: TDataSetField
      FieldName = 'qRep3'
    end
    object cdsRep2LIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep2LIPHEADING: TWideStringField
      FieldName = 'LIPHEADING'
      FixedChar = True
      Size = 25
    end
    object cdsRep2LIPSIZEDESCRIPTION: TWideStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep2LIPRATINGDESCRIPTION: TWideStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsRep2DOMINANTCOMPOSITION: TWideStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep2AGECONSTRAINTLEVEL: TWideStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      FixedChar = True
      Size = 35
    end
  end
  object cdsRep3: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRep2qRep3
    Params = <>
    Left = 304
    Top = 161
    object cdsRep3LIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsRep3LIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsRep3SPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object cdsRep3SPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object cdsRep3MINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsRep3MAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsRep3LIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsRep3AREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsRep3VOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object cdsRep3BARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsRep3qRep4: TDataSetField
      FieldName = 'qRep4'
    end
    object cdsRep3LIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep3LIPHEADING: TWideStringField
      FieldName = 'LIPHEADING'
      FixedChar = True
      Size = 25
    end
    object cdsRep3LIPSIZEDESCRIPTION: TWideStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep3LIPRATINGDESCRIPTION: TWideStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsRep3DOMINANTCOMPOSITION: TWideStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep3AGECONSTRAINTLEVEL: TWideStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      FixedChar = True
      Size = 35
    end
  end
  object cdsRep4: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRep3qRep4
    Params = <>
    Left = 304
    Top = 205
    object cdsRep4LIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsRep4LIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsRep4SPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object cdsRep4SPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object cdsRep4MINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsRep4MAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsRep4LIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsRep4AREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsRep4VOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object cdsRep4BARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsRep4LIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep4LIPHEADING: TWideStringField
      FieldName = 'LIPHEADING'
      FixedChar = True
      Size = 25
    end
    object cdsRep4LIPSIZEDESCRIPTION: TWideStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep4LIPRATINGDESCRIPTION: TWideStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsRep4DOMINANTCOMPOSITION: TWideStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep4AGECONSTRAINTLEVEL: TWideStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      FixedChar = True
      Size = 35
    end
  end
  object dsRep2: TDataSource
    DataSet = cdsRep2
    Left = 332
    Top = 117
  end
  object dsRep3: TDataSource
    DataSet = cdsRep3
    Left = 332
    Top = 161
  end
  object dsRep4: TDataSource
    DataSet = cdsRep4
    Left = 332
    Top = 205
  end
  object qLIPQ: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID, LIPS.LIPPARENTID, '
      '  LIPS.LIPRATINGID,LIPS.CONTINENTID,'
      '  LIPS.SPOTLATITUDE, LIPS.SPOTLONGITUDE,'
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.CONSTRAINTLEVELID,LIPS.BARCODEAGE,'
      '  LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,'
      '  LIPS.LIPHEADING,LIPS.PLOTBARCODE'
      'from LIPS, USERSWHOFOR,LIPFOR'
      'where LIPS.LIPID = :LIPID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      '')
    SQLConnection = sqlcLIP
    Left = 416
    Top = 73
  end
  object dsqLIPQ: TDataSource
    DataSet = qLIPQ
    Left = 444
    Top = 73
  end
  object dspLIPQ: TDataSetProvider
    DataSet = qLIPQ
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 472
    Top = 73
  end
  object dsLIPQ: TDataSource
    AutoEdit = False
    DataSet = cdsLipQ
    Left = 528
    Top = 73
  end
  object qLIPParent: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPParentID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.LIPPARENTID'
      'from LIPS,USERSWHOFOR,LIPFOR'
      'where LIPS.LIPID = :LIPParentID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 121
  end
  object cdsLIPParent: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPParent
    Params = <>
    Left = 468
    Top = 121
    object cdsLIPParentLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPParentLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      ProviderFlags = []
    end
    object cdsLIPParentLIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object dsLIPParent: TDataSource
    DataSet = cdsLIPParent
    Left = 496
    Top = 121
  end
  object qSubLIPs: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.LIPPARENTID, LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE'
      'from LIPS,USERSWHOFOR,LIPFOR'
      'where LIPS.LIPPARENTID = :LIPID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'order by LIPS.LIPNAME')
    SQLConnection = sqlcLIP
    Left = 444
    Top = 169
  end
  object cdsSubLIPs: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqSubLIPs
    Params = <>
    Left = 472
    Top = 169
    object cdsSubLIPsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSubLIPsLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      ProviderFlags = []
    end
    object cdsSubLIPsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      ProviderFlags = []
      DisplayFormat = '###0.00'
    end
    object cdsSubLIPsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsSubLIPsLIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object dsSubLIPs: TDataSource
    DataSet = cdsSubLIPs
    Left = 500
    Top = 169
  end
  object LIPQuery: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.LIPNAME || '#39'  '#39' || LIPS.LIPID AS LIPNAMELIPID,'
      '  LIPS.LIPSIZEID, LIPS.CONTINENTID,'
      '  LIPS.SPOTLATITUDE,  LIPS.SPOTLONGITUDE,'
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.LIPPARENTID,LIPS.CONTOCEANID,'
      '  LIPS.BARCODEAGE,LIPS.PLOTBARCODE,'
      '  LIPSIZES.LIPSIZEDESCRIPTION'
      'from LIPS, LIPSIZES, LIPFOR, USERSWHOFOR'
      'where LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'and LIPS.LIPID=LIPFOR.LIPID'
      '')
    SQLConnection = sqlcLIP
    Left = 248
    Top = 6
    object LIPQueryLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LIPQueryLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object LIPQuerySPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object LIPQuerySPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      ReadOnly = True
      Required = True
    end
    object LIPQueryMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object LIPQueryMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object LIPQueryLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object LIPQueryBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
  end
  object dspLIPQuery: TDataSetProvider
    DataSet = LIPQuery
    Left = 278
    Top = 6
  end
  object cdsLIPQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPQuery'
    Left = 306
    Top = 6
    object cdsLIPQueryLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPQueryLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsLIPQuerySPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object cdsLIPQuerySPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object cdsLIPQueryMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsLIPQueryMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsLIPQueryLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsLIPQueryBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsLIPQuery: TDataSource
    DataSet = cdsLIPQuery
    Left = 334
    Top = 6
  end
  object qLIPForm: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT LIPFORM.LIPID,LIPFORM.LIPFORMORDER, '
      '  LIPFORM.LIPFORMID,LIPFORMS.LIPFORMTYPE'
      'FROM LIPFORM,LIPFORMS'
      'WHERE LIPFORM.LIPID=:LIPID'
      'AND LIPFORM.LIPFORMID=LIPFORMS.LIPFORMID'
      '')
    SQLConnection = sqlcLIP
    Left = 444
    Top = 217
  end
  object cdsLIPForm: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPForm
    Params = <>
    Left = 472
    Top = 217
    object cdsLIPFormLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPFormLIPFORMORDER: TIntegerField
      FieldName = 'LIPFORMORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPFormLIPFORMID: TIntegerField
      FieldName = 'LIPFORMID'
      Required = True
    end
    object cdsLIPFormLIPFORMTYPE: TWideStringField
      FieldName = 'LIPFORMTYPE'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object dsLIPForm: TDataSource
    AutoEdit = False
    DataSet = cdsLIPForm
    Left = 500
    Top = 217
  end
  object qLIPComposition: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT LIPCOMPOSITIONS.LIPID,LIPCOMPOSITIONS.COMPOSITIONID'
      'FROM LIPCOMPOSITIONS'
      'WHERE LIPCOMPOSITIONS.LIPID=:LIPID')
    SQLConnection = sqlcLIP
    Left = 444
    Top = 265
  end
  object cdsLIPComposition: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPComposition
    Params = <>
    Left = 472
    Top = 265
    object cdsLIPCompositionLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPCompositionCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      Required = True
    end
  end
  object dsLIPComposition: TDataSource
    DataSet = cdsLIPComposition
    Left = 500
    Top = 265
  end
  object LIPQueryRec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPS.LIPID'
      'from LIPS, USERSWHOFOR,LIPFOR'
      'WHERE USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID')
    SQLConnection = sqlcLIP
    Left = 240
    Top = 306
  end
  object dspLIPQueryRec: TDataSetProvider
    DataSet = LIPQueryRec
    Options = [poReadOnly]
    Left = 268
    Top = 306
  end
  object cdsLIPQueryRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPQueryRec'
    Left = 296
    Top = 306
    object cdsLIPQueryRecLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qLIPValid: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPVALID.LIPID, LIPVALID.VALIDSTATUSID,'
      '  LIPVALID.DATEDONE, LIPVALID.DONEBY,'
      '  VALIDATIONSTATUS.VALIDSTATUSID,'
      '  VALIDATIONSTATUS.VALIDATIONSTATUS'
      'from LIPVALID, VALIDATIONSTATUS'
      'where LIPVALID.LIPID = :LIPID'
      'and LIPVALID.VALIDSTATUSID=VALIDATIONSTATUS.VALIDSTATUSID'
      'order by LIPVALID.VALIDSTATUSID')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 313
  end
  object cdsLIPValid: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPValid
    Params = <>
    Left = 468
    Top = 313
    object cdsLIPValidLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPValidDATEDONE: TSQLTimeStampField
      FieldName = 'DATEDONE'
      Required = True
    end
    object cdsLIPValidVALIDSTATUSID: TWideStringField
      FieldName = 'VALIDSTATUSID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsLIPValidDONEBY: TWideStringField
      FieldName = 'DONEBY'
      Required = True
      FixedChar = True
    end
    object cdsLIPValidVALIDATIONSTATUS: TWideStringField
      FieldName = 'VALIDATIONSTATUS'
      Required = True
      FixedChar = True
      Size = 30
    end
  end
  object dsLIPValid: TDataSource
    DataSet = cdsLIPValid
    Left = 496
    Top = 313
  end
  object qLIPUnits: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select STRATLIP.LIPID,STRATLIP.UNITID,'
      '  STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME,'
      '  STRATUNITS.RANKID, STRATUNITS.AGEYEARS,'
      '  RANKS.UNITRANK'
      'from STRATLIP,STRATUNITS,RANKS,USERSWHOFOR,UNITFOR'
      'where STRATLIP.LIPID = :LIPID'
      'and STRATLIP.UNITID=STRATUNITS.UNITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND UNITFOR.UNITID = STRATUNITS.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'order by STRATUNITS.COUNTRYID,STRATUNITS.UNITNAME')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 357
  end
  object cdsLIPUnits: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPUnits
    Params = <>
    Left = 468
    Top = 357
    object cdsLIPUnitsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPUnitsUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPUnitsAGEYEARS: TFloatField
      FieldName = 'AGEYEARS'
      Required = True
      DisplayFormat = '########0'
    end
    object cdsLIPUnitsCOUNTRYID: TWideStringField
      FieldName = 'COUNTRYID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsLIPUnitsUNITNAME: TWideStringField
      FieldName = 'UNITNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsLIPUnitsRANKID: TWideStringField
      FieldName = 'RANKID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsLIPUnitsUNITRANK: TWideStringField
      FieldName = 'UNITRANK'
      Required = True
      FixedChar = True
    end
  end
  object dsLIPUnits: TDataSource
    DataSet = cdsLIPUnits
    Left = 496
    Top = 357
  end
  object qLIPRefs: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPREFS.LIPID, '
      '  LIPREFS.SOURCENUM,'
      '  SOURCELIST.SOURCENUM,'
      '  SOURCELIST.SOURCESHORT, SOURCELIST.SOURCEYEAR'
      'from LIPREFS,SOURCELIST'
      'where LIPREFS.LIPID = :LIPID'
      'and LIPREFS.SOURCENUM=SOURCELIST.SOURCENUM'
      'order by SOURCELIST.SOURCESHORT')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 402
  end
  object cdsLIPRefs: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPRefs
    Params = <>
    Left = 468
    Top = 402
    object cdsLIPRefsLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPRefsSOURCENUM: TIntegerField
      FieldName = 'SOURCENUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPRefsSOURCEYEAR: TSmallintField
      FieldName = 'SOURCEYEAR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsLIPRefsSOURCESHORT: TWideStringField
      FieldName = 'SOURCESHORT'
      Required = True
      FixedChar = True
      Size = 100
    end
  end
  object dsLIPRefs: TDataSource
    DataSet = cdsLIPRefs
    Left = 496
    Top = 402
  end
  object qCompositions: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DOMINANTCOMPOSITION'
      'ORDER BY DOMINANTCOMPOSITION.COMPOSITIONID')
    SQLConnection = sqlcLIP
    Left = 32
    Top = 239
  end
  object dspCompositions: TDataSetProvider
    DataSet = qCompositions
    Left = 62
    Top = 240
  end
  object cdsCompositions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompositions'
    Left = 90
    Top = 240
    object cdsCompositionsCOMPOSITIONID: TIntegerField
      FieldName = 'COMPOSITIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompositionsDOMINANTCOMPOSITION: TWideStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object dsCompositions: TDataSource
    DataSet = cdsCompositions
    Left = 118
    Top = 238
  end
  object qLIPDescription: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM LIPDESCRIPTION'
      'where LIPDESCRIPTION.LIPID = :LIPID')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 450
  end
  object cdsLIPDescription: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPDescription
    Params = <>
    Left = 468
    Top = 450
    object cdsLIPDescriptionLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPDescriptionDESCRIPTION: TBlobField
      FieldName = 'DESCRIPTION'
    end
  end
  object dsLIPDescription: TDataSource
    DataSet = cdsLIPDescription
    Left = 496
    Top = 450
  end
  object qContOceans: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CONTOCEANS'
      '')
    SQLConnection = sqlcLIP
    Left = 32
    Top = 287
  end
  object dspContOceans: TDataSetProvider
    DataSet = qContOceans
    Left = 62
    Top = 288
  end
  object cdsContOceans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContOceans'
    Left = 90
    Top = 288
    object cdsContOceansCONTOCEANID: TWideStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContOceansCONTOCEAN: TWideStringField
      FieldName = 'CONTOCEAN'
      FixedChar = True
      Size = 15
    end
  end
  object dsContOceans: TDataSource
    DataSet = cdsContOceans
    Left = 118
    Top = 286
  end
  object sqlcLIP: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=fbclient.dll'
      'DataBase=c:\data\firebird\stratdb2025v50_UTF8.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      'DriverUnit=DbxDevartInterBase'
      'UseUnicode=true'
      'Charset=UTF8')
    Left = 36
    Top = 12
  end
  object qUserLIPAccess: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPFOR.LIPID'
      'from LIPFOR,USERSWHOFOR'
      'where LIPFOR.LIPID = :LIPID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      '')
    SQLConnection = sqlcLIP
    Left = 28
    Top = 494
  end
  object dspUserLIPAccess: TDataSetProvider
    DataSet = qUserLIPAccess
    Left = 58
    Top = 494
  end
  object cdsUserLIPAccess: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserLIPAccess'
    Left = 86
    Top = 494
    object cdsUserLIPAccessLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
  end
  object dsUserLIPAccess: TDataSource
    DataSet = cdsUserLIPAccess
    Left = 114
    Top = 494
  end
  object qLIPFor: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM LIPFOR,FORLIST'
      'where LIPFOR.LIPID = :LIPID'
      'AND LIPFOR.WHOFORID = FORLIST.WHOFORID')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 494
  end
  object cdsLIPFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPFor
    Params = <>
    Left = 468
    Top = 494
    object cdsLIPForLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPForWHOFORID: TWideStringField
      FieldName = 'WHOFORID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsLIPForNEEDSCHANGE: TWideStringField
      FieldName = 'NEEDSCHANGE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLIPForWHOFOR: TWideStringField
      FieldName = 'WHOFOR'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsLIPForOWNER: TWideStringField
      FieldName = 'OWNER'
      Required = True
      FixedChar = True
    end
  end
  object dsLIPFor: TDataSource
    DataSet = cdsLIPFor
    Left = 496
    Top = 494
  end
  object qWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT FORLIST.WHOFORID,FORLIST.WHOFOR,FORLIST.OWNER'
      'FROM FORLIST, USERSWHOFOR'
      'WHERE FORLIST.WHOFORID=USERSWHOFOR.WHOFORID'
      'AND USERSWHOFOR.USERID=:UserID'
      'ORDER BY FORLIST.WHOFOR')
    SQLConnection = sqlcLIP
    Left = 32
    Top = 427
  end
  object dspWhoFor: TDataSetProvider
    DataSet = qWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 60
    Top = 427
  end
  object cdsWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspWhoFor'
    Left = 86
    Top = 427
    object cdsWhoForWHOFORID: TWideStringField
      FieldName = 'WHOFORID'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsWhoForWHOFOR: TWideStringField
      FieldName = 'WHOFOR'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsWhoForOWNER: TWideStringField
      FieldName = 'OWNER'
      Required = True
      FixedChar = True
    end
  end
  object dsWhoFor: TDataSource
    DataSet = cdsWhoFor
    Left = 114
    Top = 427
  end
  object qDomainLIP: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPDOMAIN.LIPID, '
      '  LIPDOMAIN.DOMAINID,LIPDOMAIN.INC4CHTYN,'
      '  LIPS.CONTINENTID, '
      '  LIPS.MINPLOTAGE,LIPS.MAXPLOTAGE,'
      '  LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID,LIPS.LIPRATINGID,'
      '  LIPS.CONSTRAINTLEVELID,LIPS.AREALEXTENT,LIPS.VOLUMEESTIMATE,'
      '  LIPS.LIPPARENTID,DOMAINS.DOMAINNAME'
      'from LIPDOMAIN, LIPS,DOMAINS'
      'where LIPDOMAIN.LIPID = :LIPID'
      'and LIPDOMAIN.LIPID=LIPS.LIPID'
      'and LIPDOMAIN.DOMAINID=DOMAINS.DOMAINID'
      'order by  LIPS.LIPNAME,LIPS.MINPLOTAGE')
    SQLConnection = sqlcLIP
    Left = 440
    Top = 542
  end
  object cdsDomainLIP: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqDomainLIP
    Params = <>
    Left = 468
    Top = 542
    object cdsDomainLIPLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainLIPDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainLIPMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainLIPMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainLIPLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainLIPCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainLIPAREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainLIPVOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '####0.0'
    end
    object cdsDomainLIPLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDomainLIPINC4CHTYN: TWideStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainLIPCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsDomainLIPLIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsDomainLIPCONTOCEANID: TWideStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainLIPLIPRATINGID: TWideStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDomainLIPDOMAINNAME: TWideStringField
      FieldName = 'DOMAINNAME'
      Required = True
      FixedChar = True
      Size = 65
    end
  end
  object dsDomainLIP: TDataSource
    DataSet = cdsDomainLIP
    Left = 496
    Top = 542
  end
  object qInsertLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(UnitID, DomainIDID)'
      'Values (:UnitID, :DomainID)')
    SQLConnection = sqlcLIP
    Left = 300
    Top = 424
  end
  object qLIPMap: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT LIPMAPS2.LIPID, LIPMAPS2.MAPID2, '
      '  LIPMAPS2.DISPLAYORDER,'
      '  LIPMAPS2.GISINT,'
      '  LIPMAPS2.GISSTR,'
      '  MAPS2.MAPID2, MAPS2.MAPNAME'
      'FROM LIPMAPS2, MAPS2'
      'WHERE LIPMAPS2.LIPID = :LIPID'
      'and LIPMAPS2.MAPID2 = MAPS2.MAPID2'
      'ORDER BY LIPMAPS2.MAPID2, LIPMAPS2.DISPLAYORDER')
    SQLConnection = sqlcLIP
    Left = 560
    Top = 169
    object qLIPMapLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLIPMapDISPLAYORDER: TIntegerField
      FieldName = 'DISPLAYORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLIPMapGISINT: TIntegerField
      FieldName = 'GISINT'
      Required = True
    end
  end
  object cdsLIPMap: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPMap
    Params = <>
    Left = 588
    Top = 169
    object cdsLIPMapLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPMapDISPLAYORDER: TIntegerField
      FieldName = 'DISPLAYORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPMapGISINT: TIntegerField
      FieldName = 'GISINT'
      Required = True
    end
  end
  object dsLIPMap: TDataSource
    DataSet = cdsLIPMap
    Left = 616
    Top = 169
  end
  object qLIPCorrelative: TSQLQuery
    DataSource = dsqLIPQ
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LIPCORRELATIVES.LIPID, LIPCORRELATIVES.CORRELATIVEID,'
      '  LIPCORRELATIVES.COMMENTS, LIPS.LIPID,'
      '  LIPS.LIPNAME, '
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.CONTINENTID, CONTINENTS.CONTINENTID,'
      '  CONTINENTS.CONTINENT'
      'from LIPCORRELATIVES,LIPS,CONTINENTS,USERSWHOFOR,LIPFOR'
      'where LIPCORRELATIVES.LIPID=:LIPID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'and LIPCORRELATIVES.CORRELATIVEID=LIPS.LIPID'
      'AND LIPS.CONTINENTID=CONTINENTS.CONTINENTID')
    SQLConnection = sqlcLIP
    Left = 560
    Top = 217
    object qLIPCorrelativeLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLIPCorrelativeCORRELATIVEID: TIntegerField
      FieldName = 'CORRELATIVEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLIPCorrelativeCOMMENTS: TBlobField
      FieldName = 'COMMENTS'
      Size = -1
    end
    object qLIPCorrelativeMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qLIPCorrelativeMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdsLIPCorrelative: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLipQqLIPCorrelative
    Params = <>
    Left = 588
    Top = 217
    object cdsLIPCorrelativeLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPCorrelativeCORRELATIVEID: TIntegerField
      FieldName = 'CORRELATIVEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLIPCorrelativeCOMMENTS: TBlobField
      FieldName = 'COMMENTS'
    end
    object cdsLIPCorrelativeMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsLIPCorrelativeMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsLIPCorrelative: TDataSource
    DataSet = cdsLIPCorrelative
    Left = 616
    Top = 217
  end
  object qYesNo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM YESNO')
    SQLConnection = sqlcLIP
    Left = 742
    Top = 8
  end
  object dspYesNo: TDataSetProvider
    DataSet = qYesNo
    Left = 770
    Top = 8
  end
  object cdsYesNo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspYesNo'
    Left = 798
    Top = 8
  end
  object dsYesNo: TDataSource
    DataSet = cdsYesNo
    Left = 826
    Top = 8
  end
  object cdsLipQ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIPQ'
    Left = 504
    Top = 72
    object cdsLipQLIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsLipQLIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsLipQLIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsLipQSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsLipQSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsLipQMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '####0.000'
    end
    object cdsLipQMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '####0.000'
    end
    object cdsLipQCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsLipQBARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
      DisplayFormat = '####0.000'
    end
    object cdsLipQAREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
      DisplayFormat = '#####0.0'
    end
    object cdsLipQVOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
      DisplayFormat = '#####0.0'
    end
    object cdsLipQqLIPCorrelative: TDataSetField
      FieldName = 'qLIPCorrelative'
    end
    object cdsLipQqLIPMap: TDataSetField
      FieldName = 'qLIPMap'
    end
    object cdsLipQqDomainLIP: TDataSetField
      FieldName = 'qDomainLIP'
    end
    object cdsLipQqLIPFor: TDataSetField
      FieldName = 'qLIPFor'
    end
    object cdsLipQqLIPDescription: TDataSetField
      FieldName = 'qLIPDescription'
    end
    object cdsLipQqLIPRefs: TDataSetField
      FieldName = 'qLIPRefs'
    end
    object cdsLipQqLIPUnits: TDataSetField
      FieldName = 'qLIPUnits'
    end
    object cdsLipQqLIPValid: TDataSetField
      FieldName = 'qLIPValid'
    end
    object cdsLipQqLIPComposition: TDataSetField
      FieldName = 'qLIPComposition'
    end
    object cdsLipQqLIPForm: TDataSetField
      FieldName = 'qLIPForm'
    end
    object cdsLipQqSubLIPs: TDataSetField
      FieldName = 'qSubLIPs'
    end
    object cdsLipQqLIPParent: TDataSetField
      FieldName = 'qLIPParent'
    end
    object cdsLipQLIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsLipQLIPHEADING: TWideStringField
      FieldName = 'LIPHEADING'
      FixedChar = True
      Size = 25
    end
    object cdsLipQCONTOCEANID: TWideStringField
      FieldName = 'CONTOCEANID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLipQLIPRATINGID: TWideStringField
      FieldName = 'LIPRATINGID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsLipQCONTINENTID: TWideStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsLipQPLOTBARCODE: TWideStringField
      FieldName = 'PLOTBARCODE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qInsertLIP: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LIPName'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LIPParentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO LIPS'
      '(LIPID, ContinentID, LIPName, LIPParentID)'
      'Values (:LIPID, :ContinentID, :LIPName, :LIPParentID)'
      '')
    SQLConnection = sqlcLIP
    Left = 736
    Top = 396
  end
  object qNewLIPName: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NewLIPName'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT LIPS.LIPID, LIPS.CONTINENTID,'
      '  LIPS.LIPNAME'
      'FROM LIPS'
      'WHERE LIPS.LIPNAME = :NewLIPName ')
    SQLConnection = sqlcLIP
    Left = 662
    Top = 442
  end
  object dspNewLIPName: TDataSetProvider
    DataSet = qNewLIPName
    Left = 690
    Top = 442
  end
  object cdsNewLIPName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNewLIPName'
    Left = 718
    Top = 442
    object cdsNewLIPNameLIPID: TIntegerField
      FieldName = 'LIPID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsNewLIPName: TDataSource
    AutoEdit = False
    DataSet = cdsNewLIPName
    Left = 746
    Top = 442
  end
  object qDeleteLIP: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LIPID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM LIPDOMAIN'
      'WHERE LIPDOMAIN.LIPID = :LIPID'
      'and LIPDOMAIN.DOMAINID = :DomainID'
      '')
    SQLConnection = sqlcLIP
    Left = 664
    Top = 396
  end
  object qRep1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT LIPS.LIPID, LIPS.LIPNAME,'
      '  LIPS.CONTOCEANID,LIPS.LIPSIZEID, LIPS.CONTINENTID,'
      '  LIPS.SPOTLATITUDE,  LIPS.SPOTLONGITUDE,'
      '  LIPS.MINPLOTAGE, LIPS.MAXPLOTAGE,'
      '  LIPS.LIPPARENTID,LIPS.AREALEXTENT,'
      '  LIPS.VOLUMEESTIMATE,'
      '  LIPSIZES.LIPSIZEDESCRIPTION,LIPS.PLOTBARCODE,'
      '  LIPS.BARCODEAGE,LIPS.LIPHEADING,'
      '  LIPRATINGS.LIPRATINGDESCRIPTION,'
      '  DOMINANTCOMPOSITION.DOMINANTCOMPOSITION,'
      '  CONSTRAINTS.AGECONSTRAINTLEVEL'
      
        'from LIPS, LIPSIZES,LIPRATINGS,CONSTRAINTS,LIPCOMPOSITIONS,DOMIN' +
        'ANTCOMPOSITION,'
      '  USERSWHOFOR,LIPFOR'
      'where LIPS.LIPSIZEID=LIPSIZES.LIPSIZEID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID'
      'AND LIPFOR.LIPID = LIPS.LIPID'
      'AND LIPS.LIPID=LIPCOMPOSITIONS.LIPID'
      
        'AND LIPCOMPOSITIONS.COMPOSITIONID=DOMINANTCOMPOSITION.COMPOSITIO' +
        'NID'
      'AND LIPS.LIPRATINGID=LIPRATINGS.LIPRATINGID'
      'AND LIPS.CONSTRAINTLEVELID=CONSTRAINTS.AGECONSTRAINTLEVELID')
    SQLConnection = sqlcLIP
    Left = 248
    Top = 80
  end
  object dsqRep1: TDataSource
    DataSet = qRep1
    Left = 280
    Top = 80
  end
  object dspRep1: TDataSetProvider
    DataSet = qRep1
    Options = []
    Left = 312
    Top = 80
  end
  object cdsRep1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRep1'
    Left = 344
    Top = 80
    object cdsRep1LIPID: TIntegerField
      FieldName = 'LIPID'
      Required = True
    end
    object cdsRep1LIPSIZEID: TIntegerField
      FieldName = 'LIPSIZEID'
      Required = True
    end
    object cdsRep1SPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
    end
    object cdsRep1SPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
    end
    object cdsRep1MINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
    end
    object cdsRep1MAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
    end
    object cdsRep1LIPPARENTID: TIntegerField
      FieldName = 'LIPPARENTID'
      Required = True
    end
    object cdsRep1AREALEXTENT: TFloatField
      FieldName = 'AREALEXTENT'
    end
    object cdsRep1VOLUMEESTIMATE: TFloatField
      FieldName = 'VOLUMEESTIMATE'
    end
    object cdsRep1BARCODEAGE: TFloatField
      FieldName = 'BARCODEAGE'
      Required = True
    end
    object cdsRep1qRep2: TDataSetField
      FieldName = 'qRep2'
    end
    object cdsRep1LIPNAME: TWideStringField
      FieldName = 'LIPNAME'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep1LIPSIZEDESCRIPTION: TWideStringField
      FieldName = 'LIPSIZEDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep1LIPHEADING: TWideStringField
      FieldName = 'LIPHEADING'
      FixedChar = True
      Size = 25
    end
    object cdsRep1LIPRATINGDESCRIPTION: TWideStringField
      FieldName = 'LIPRATINGDESCRIPTION'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsRep1DOMINANTCOMPOSITION: TWideStringField
      FieldName = 'DOMINANTCOMPOSITION'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsRep1AGECONSTRAINTLEVEL: TWideStringField
      FieldName = 'AGECONSTRAINTLEVEL'
      Required = True
      FixedChar = True
      Size = 35
    end
  end
  object dsRep1: TDataSource
    DataSet = cdsRep1
    Left = 376
    Top = 80
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcLIP
    Left = 120
    Top = 16
  end
end
