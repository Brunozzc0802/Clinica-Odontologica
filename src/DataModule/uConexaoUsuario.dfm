object DataModule1: TDataModule1
  Height = 196
  Width = 425
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database = clinica_odontologica '
      'Server = localhost '
      'Port = 5432 '
      'User_Name=postgres '
      'Password = root')
    Connected = True
    Left = 56
    Top = 40
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica' +
      '-Odontologica\Delphi\Win32\Debug\libpq.dll'
    Left = 336
    Top = 40
  end
end
