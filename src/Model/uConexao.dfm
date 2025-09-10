object dmConexao: TdmConexao
  Height = 276
  Width = 418
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica' +
      '-Odontologica\Delphi\Win32\Debug\libpq.dll'
    Left = 296
    Top = 88
  end
  object FDQueryUsuario: TFDQuery
    Connection = FDConnection
    Left = 224
    Top = 160
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database = clinica_odontologica'
      'Server = localhost'
      'Port = 5432'
      'User_Name=postgres')
    LoginPrompt = False
    Left = 160
    Top = 88
  end
end
