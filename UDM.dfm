object DM: TDM
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object Connection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 328
    Top = 136
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 352
    Top = 264
  end
end
