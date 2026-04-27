object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 142
  Height = 492
  TabOrder = 0
  TabStop = True
  object MainMenu1: TMainMenu
    Left = 244
    Top = 12
    object D1: TMenuItem
      Caption = 'Define Query'
      object byUnit1: TMenuItem
        Caption = 'by Unit'
      end
      object byDomain1: TMenuItem
        Caption = 'by Domain'
      end
      object byLIP1: TMenuItem
        Caption = 'by LIP'
      end
    end
    object Select1: TMenuItem
      Caption = 'Select'
      object Chart1: TMenuItem
        Caption = 'Chart'
      end
      object Graph1: TMenuItem
        Caption = 'Graph'
        Enabled = False
      end
    end
    object Lookups1: TMenuItem
      Caption = 'Lookups'
      object Charts1: TMenuItem
        Caption = 'Charts'
      end
      object Domains1: TMenuItem
        Caption = 'Domains'
      end
      object DomainTypes1: TMenuItem
        Caption = 'Domain Types'
      end
      object LIPs1: TMenuItem
        Caption = 'LIPs'
      end
      object Maps1: TMenuItem
        Caption = 'Maps'
      end
      object MetamorphicGrades1: TMenuItem
        Caption = 'Metamorphic Grades'
      end
      object Orogenies1: TMenuItem
        Caption = 'Orogenies'
      end
      object OrogenyTypes1: TMenuItem
        Caption = 'Orogeny Types'
      end
      object DuctilityTypes1: TMenuItem
        Caption = 'Ductility Types'
      end
      object VergenceDirections1: TMenuItem
        Caption = 'Vergence Directions'
      end
    end
    object imescale1: TMenuItem
      Caption = 'Timescale'
    end
    object Options1: TMenuItem
      Caption = 'Options'
    end
    object MainPage1: TMenuItem
      Caption = 'Main Page'
    end
  end
end
