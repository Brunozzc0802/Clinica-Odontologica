object dmUsuarios: TdmUsuarios
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database = clinica_odontologica'
      'Password = root'
      'Server = localhost'
      'Port = 5432'
      'User_Name=postgres')
    Left = 88
    Top = 88
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica' +
      '-Odontologica\Delphi\Win32\Debug\libpq.dll'
    Left = 217
    Top = 88
  end
end
