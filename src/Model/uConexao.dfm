object DataModule1: TDataModule1
  Height = 506
  Width = 650
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database = clinica_odontologica'
      'User_Name = postgres'
      'Password = root'
      'Server = localhost'
      'Port = 5432'
      'User_Name=postgres')
    Left = 168
    Top = 88
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica' +
      '-Odontologica\Delphi\Win32\Debug\libpq.dll'
    Left = 296
    Top = 88
  end
end
