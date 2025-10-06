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
      'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica' +
      '-Odontologica\lib\lib\libpq.dll'
    Left = 89
    Top = 32
  end
  object queryUsu: TFDQuery
    Connection = FDConnection1
    Left = 320
    Top = 24
  end
  object queryPacientes: TFDQuery
    Connection = FDConnection1
    Left = 408
    Top = 24
  end
  object queryProfissionais: TFDQuery
    Connection = FDConnection1
    Left = 320
    Top = 88
  end
end
