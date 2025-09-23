object dmUsuarios: TdmUsuarios
  Height = 240
  Width = 497
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Server=localhost'
      'Port=5432'
      'Database=clinica_odontologica'
      'User_Name=postgres'
      'Password=root')
    Left = 88
    Top = 88
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\bruno\OneDrive\Desktop\Projeto empresa\Clinica-Odontolo' +
      'gica\lib\lib\lib\libpq.dll'
    Left = 217
    Top = 88
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 336
    Top = 88
  end
end
