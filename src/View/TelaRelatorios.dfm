object PagRelatorios: TPagRelatorios
  Left = 613
  Top = 249
  BorderStyle = bsNone
  Caption = 'PagRelatorios'
  ClientHeight = 555
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object cabecalho: TPanel
    Left = -306
    Top = 0
    Width = 1116
    Height = 41
    BevelOuter = bvNone
    Caption = 'cabecalho'
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlCabecalho: TPanel
      AlignWithMargins = True
      Left = 308
      Top = 2
      Width = 806
      Height = 38
      Margins.Left = 308
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 1
      Align = alClient
      BevelOuter = bvNone
      Color = 11293958
      ParentBackground = False
      TabOrder = 0
      object lblTitulo: TLabel
        Left = 44
        Top = 8
        Width = 89
        Height = 23
        Caption = 'Relat'#243'rios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object iconRelatorios: TImage
        Left = 6
        Top = 3
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000000097048597300000EC300000EC301C76FA864
          0000001974455874536F667477617265007777772E696E6B73636170652E6F72
          679BEE3C1A000003964944415478DADD977B684E611CC79F8318D246C38C5C6A
          935B2E2525FE98924B6D6112FF082F66CB3F137F60EE53CC5D4A23738B24EC22
          4DE49AA1DCD7CC6692ADB0269AD9A4DC5E9F5FE7379D1D677B673BA59CFAF67D
          BFCFF33BCFF37D9FCBEF798E65FEF1633555190C06A7401B406CA8D8BF786A40
          3E586959566DA38DD2F920E83A98071E829F3E1908079BC0770C04FE3040C7ED
          A06920190C0657D5C0195EA8F4C3017D4440E5B41761B92AC643474105C803A9
          E018E8ADA6F6822DBC18F4C144D092C75130093A0E0214E76BD9236821FA31BF
          A3F97D0A94A117FB6A80DFDDA142308BA2DB8EA0DF065477820AC02ECA4E38E2
          D61A7B5E433DAF415F1941B7818D502472A9CB6503035A361692CE635A33156E
          034FA024E4BD5006B4BC149A4D79A15F063E433D909F3D0C482755AEF713C12A
          E2CF79342CDB777E23FD7E32BA88DD066AA168490CAEC6D640EB4006A8735449
          6E48233EC7C3407F199D460CD4F04EA6D7083C805291051E0D1E80A4D178EABF
          69D94B2801FDCCAF29580DC522177804B685CE02999EB940B6EB1E620737B3A3
          70626B421990CC5404165174C923B8237419C8624D00CBBC86DFE3BD346822B1
          139A34A005E3A06CB01C9C746F31EAE3A02BFAEF5734A3F37468BA1AA8F2A86F
          68400B47424754E68257C63E3CE41F88014938FBEBCD111F061D04F1C64ED999
          D43DA77C9B742CD3857E1F720DB82A2CED50768064C81BC63E8C7209FFE8888B
          8272D4A46441591F01506DEC1D3399F8EA2646C8DB8023401AFD4648BA47DD08
          631F565960B36344DA4BC7E026980A7680CED20ED84DDCD6561BD013531290A4
          ED5BA08FB1EF0A65CE44469C644F5984774157F054CC38CCB6D8C000FD573DC1
          69500E64AB468251F5734E5C0994882E512DA31086FED1EA29D0FAEDD087FA61
          455F84F6398E72FF0D5036041AAA720EB843FD4EAD933521E786E413E9648FB1
          17A23F06D0A38D7D99BCA1217120C36520061403598C92B086F9692059E77889
          EA5DD01B9781C3E83CD57264CFF0D3400A341C9DA25AB658A5CB4016FABC6A39
          A866FE570692A031E845AAE586FC169DA15AD6C72174B6EA17BA0B8AF4AAFF05
          7440FF6CA901B9E948E2A9D010C9079254CA411B63DF19BE1AFBE2298BB09FB1
          BF82DE812EC64E54098EF6431A90132FCA79F251D64D3B366A443AEAA5BACCD8
          6787643D19E6528D959BB40C7FB163F8BD3F4C5C06E4C2710DC825E5BEF1F7D3
          2C5D473710EAE3540E96F560A00EB31F8F4CCB05635F6AEBFCFAE26DF1F30BA5
          516D3FBA7D7ACD0000000049454E44AE426082}
      end
      object btnX: TImage
        Left = 781
        Top = 10
        Width = 16
        Height = 16
        Cursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF61000000097048597300000EC300000EC301C76FA864
          0000001974455874536F667477617265007777772E696E6B73636170652E6F72
          679BEE3C1A000001014944415478DA8D92210B0241108577B22282560D163169
          B52A88184C16FFA141934550412C16412CB62BD74550C42078BE394618CE9DD5
          81C7CDEDECFB766FE6284992AA736E0AE5A131111D5D20B0BF89C704BA4123C2
          C201494BEA67A86B41C4BC864AB27460408CA4A2F679211E3347CC8036920554
          B02086F90AF54936F82017A8073DA1155456B53B34C0015B5257F441F8941754
          F499F98554C18238CBFC0550902594CB941EE9372BB305E0866D32D7E6E0B977
          00D89B0031671BA6236DAC86D00FF3439A98B3201430A70D93317A47CC100A99
          3F0D0BFD270C8890D454E12ADDDEFD31E2880127248D9039003931A08E642E8D
          1A59E60C6426631DBE013A6F900B7B89246D0000000049454E44AE426082}
        OnClick = btnXClick
      end
    end
  end
  object pnlPrincipal: TPanel
    Left = 1
    Top = 41
    Width = 807
    Height = 512
    Color = 13204758
    ParentBackground = False
    TabOrder = 1
    object Shape1: TShape
      Left = 24
      Top = 31
      Width = 369
      Height = 76
      Brush.Color = clBtnFace
      Pen.Color = clBtnFace
      Shape = stRoundRect
    end
    object Shape2: TShape
      Left = 24
      Top = 430
      Width = 369
      Height = 50
      Brush.Color = clBtnFace
      Pen.Color = clBtnFace
      Shape = stRoundRect
    end
    object Shape3: TShape
      Left = 24
      Top = 78
      Width = 369
      Height = 379
      Brush.Color = clBtnFace
      Pen.Color = clBtnFace
    end
    object Bevel1: TBevel
      Left = 41
      Top = 83
      Width = 335
      Height = 9
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 98
      Top = 43
      Width = 211
      Height = 29
      Alignment = taCenter
      Caption = 'Selecione o Relat'#243'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Bevel2: TBevel
      Left = 41
      Top = 142
      Width = 335
      Height = 9
      Shape = bsTopLine
    end
    object Shape7: TShape
      Left = 448
      Top = 43
      Width = 313
      Height = 94
      Brush.Color = 11293958
      Pen.Color = 16293454
      Pen.Width = 2
      Shape = stRoundRect
    end
    object Label10: TLabel
      Left = 499
      Top = 48
      Width = 209
      Height = 29
      Alignment = taCenter
      Caption = 'Consultas Conclu'#237'das'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblConsulConclu: TLabel
      Left = 589
      Top = 92
      Width = 24
      Height = 29
      Alignment = taCenter
      Caption = '12'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Image1: TImage
      Left = 499
      Top = 89
      Width = 33
      Height = 32
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000EC300000EC301C76FA864
        0000001974455874536F667477617265007777772E696E6B73636170652E6F72
        679BEE3C1A000003E14944415478DABD976948554114C7E7B512952D449BB460
        DB8732FB501A1141FBBE47591452685612ED1FCAB0228CC8C2C2A2482CDA286D
        C328D1765AB0249090B48D283F6429ED56B4D0EB779C7974B95EDFBBE8CB0B3F
        E6DE3B3367FE77E69C33733D5EAFD7A3940A87C62A3857B1C7E3F9EEB6B10701
        2B29D7C0DB200C1E0A15301211156E05A45296D221B5AEA3632B99622E7C8511
        6E44FC0F01DF945ECE39301CBB6FEA53C026F972C887F9F01E0661FB477D09E8
        48314FFD7368F1AD61D87E1C5000A4C37A6868B509FB31505A4B41251433E85F
        E246C075C885DD967AF99A6D700556432317E36630E0B3DA0A380AA3CC2CEC85
        103168842D86062E046432E0CBBA08780EA36127F483B318C8A45D886D799C0D
        7A3C1FEAB2042760220C805B70084E418121A000AE6806BC5C1B01E7E081C320
        B33070DDC5C0D52E6C5FA288A3FFEB8002821186B6C19B5374804A6C97BB9901
        F17E59F32696FA3F508481DF2E076D41B142E974DC1D64E0964A877336ECF045
        8893803CB304C596FA308885F3D04D39474139462BB13384FB2CA57D691F14F0
        DE6B8449DFF9465C0AEF539C045445019511BC9381E260121C87FB4A87A2D396
        2DFD1FC21958E073C01A6628D4CC441EED121D054021F4805FF0194E4A18FA31
        DA9AE211C4D0EEAA9F76E2DC72F668A574442DA77D8E93801898095BE198D2D1
        71170EDA6640FC632D44433B8CC5FB197CB059C6A6301DC4417740B85580A8BF
        0DD629948E6BCCB40D75F0817BE6EBC7F9621D7BCDAC27229EA3282EC042E80B
        BDA98FE3FD13EEE75A05A4299D84EC5120EB5559C39775A5C8A73E947B99DA3B
        D04B668F77C9BC1BC4FD4533F80BF391B1D4E552278EFAA44E7980BE91147BE9
        1BC9FD04EE379A29BE6A6667B2D251F414AE41226D8F9ABEB2F386586720D3AC
        933D132EA353410D02644AB3A8EF6B9CB1D0ACAD4484A4F03D5062FC2B897687
        2D7DAB4E4F76273CAD741291AB2DAC537A3794AFC9B28993A3D7147805A12617
        84193BDB793EC0734FF3BC85E70C9B78599A234E5120BBA064B4CD4AC7778611
        D6DF26E03B468BE99F235F6B995A117143E9BC31DEF843BA6DF0F66659BA3A09
        1012609AAC99D261986D1CD41E051FE1A7D2BB6684CF59B1D9996291CC9C536E
        A05E047DA16EB55D40B69976DFB5CAACA36CCDBB54F51351054612B07180FB4E
        30DBDF01D40CBE54E9941C45DB4F5601F2E569B641BC66FD8A031895042529BB
        0BC4D3BEC8A14D1BA593DB1898401B39F8046F3B36BF784B204969CFBF09654A
        EF860361ACD28EBCC17A6A0AFA794032A1D2E74AC980721EF8A274B6BCE4F493
        F2DF0E2446CC548ADC403F26E210B2A904E3E7D47E75873E0878E74F80AC9DFD
        2414ACABCCDF7950AEBF5E5EFD212114C7CB0000000049454E44AE426082}
    end
    object Shape8: TShape
      Left = 448
      Top = 206
      Width = 313
      Height = 94
      Brush.Color = 11293958
      Pen.Color = 16293454
      Pen.Width = 2
      Shape = stRoundRect
    end
    object Shape9: TShape
      Left = 448
      Top = 363
      Width = 313
      Height = 94
      Brush.Color = 11293958
      Pen.Color = 16293454
      Pen.Width = 2
      Shape = stRoundRect
    end
    object Image2: TImage
      Left = 499
      Top = 255
      Width = 33
      Height = 32
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000EC300000EC301C76FA864
        0000001974455874536F667477617265007777772E696E6B73636170652E6F72
        679BEE3C1A0000030E4944415478DAE5975948545118C7CF6D83AC2CF2492C82
        162AE8A1A869235FA285B007A3C48428A134A8D0A01D0A8AE849C5A81E7A90A4
        A005F2A185A23DB01DA2058B165A0CAC07495223D764FAFDB967E0324E33CECC
        757AE8C08FEF9C73CFF7DDFF9CFB9D659C6030D8648C196D122F9720CF719CAE
        449C1D040471761271C6F506663CBC847CC2FCFE17020EC32668830242F5A45A
        4019DC872B500FEB09174CA900DC6F524FA37E0D5ED02E49B900DB1E89B905B5
        F46D4B950065FF574F7706AC8412C21E8D4B00D50198721816C5A791E1FBECF8
        F9986911C64C874CC6AD887B0668AEC6A4C7107021C6CCE462D62524C08FF2FF
        08C07510A60AD2C21E65C138781823C48F483930C5444FC216867FB0634761BE
        E9D726A05F097F36D22AD03A8E96840D0CCFF508D639F013DAE314A077B4259D
        03B80FC71CB2537EAC8F6EBBE191FC7C4942422CC36C25CCD2B0FEC118CDD66C
        F80CD58C69A7FF29F5CDD49FF82540F709E5858EE64CC88609B0063EC2455805
        EF612F3C8731BCB6C3B76548983398675007578D7B4CEB17BFE259967D26119A
        AD74FAB7C82F9124F4964E05C4BD15DFC9D4EF410036400E14C208380927EC4C
        DC8199F834F4126045C45A86DED2856B9DC7B71453048B8CFBEDF7836E493B8D
        BB27DC8603F89C0AF9F8BE13126E0F46E7C95CE3667BB3FDF54ABC0A5E75DC3B
        BEBFB6E2071809A937EE713D4733C36B96878FED8F19D092D3B79E011BED0CE8
        BA560B8B79D5EBA8026816183771FA523AE074E8228AAFA65D47B50EA2EBF69A
        D643BD93BA56C01158A2951151805D0515A6F7E1F2B7A2E9DD857B1BBE4A5C25
        6429EDCB369EF6846EDADF6D7B2D663BCC0AFD8FF0731F3888194BA8424F9FB6
        E866FACA3C7DFA237397BE4ADF04D82DF70B2C24D45B4F9F36A75628F67CA679
        986A98AAEBBB5F0216602A0913B0ED4998F356943EA70EACBCD0E6C3F34F981C
        DA6FFC12508C0910A6C85ECD1F1B77CD57D9E73B30F9906D0FA31AEAE7A8D7F8
        711CEB5B6AF71B68DC3BC110180A2D61437579F905DD76569484E5C95EC994F9
        8D30D1B84B329EA2F3E69D0468896424F30992284D7F00EEF4C1DBD630A3EC00
        00000049454E44AE426082}
    end
    object Label12: TLabel
      Left = 499
      Top = 216
      Width = 215
      Height = 29
      Alignment = taCenter
      Caption = 'Consultas Agendadas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblConsulAgend: TLabel
      Left = 589
      Top = 256
      Width = 24
      Height = 29
      Alignment = taCenter
      Caption = '12'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Image3: TImage
      Left = 499
      Top = 409
      Width = 33
      Height = 32
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000EC300000EC301C76FA864
        0000001974455874536F667477617265007777772E696E6B73636170652E6F72
        679BEE3C1A0000034A4944415478DAD5974B4855511486F7C91E68299524480D
        8A02A3371114614479834A437B285683B246D5A4970D1AE52822B206120D248B
        C892A2B7BDACA0108A1AF4B02C07515C23E92165644AA9B76F7156703DD7FB3A
        C72BB4E167EDB5F6DA6BFD67EF7DD63EC732515A201058842807D3C0E068FE61
        5A93CCB72CABCB396045493E16F11AA4023FE832F1B5A1609CF6DF82C94E12D1
        086C409C008799B833DEC766FE2CC4D320D37B9045ACDFB112D82EC9C10E261D
        F140E0A53CBDB1B7B0D74A0C14814BE020B8AF24FCBA129D034680F92BD1E787
        901820025FC073358F0793B4DF98680299C6DEF3E4302EDD0925A031462346F6
        31242B1348388108B1BF89FCFF0860DB8398E822670FA820CE2BD704D0E5F5F9
        0E86BB7CF0BDC4D9EF7505E4E927B848FE0B3C21CE1F4F04FAAB8525C0C02044
        2EC8078BF569DF81BBC62EA93720D39310025A2A8F81E911E64A45DB028987FD
        4A00C35A44151866EC7A7D14D41BBB8C8E01D9602B58E83267372881F8A91002
        280B1077D4711B4E9511981F4094AADA023A632420DB2667E95A2F02FA6A3518
        FBBEDE844395D6F0CFF4BB8312272132B0B5D0DF4C5F48368219C17E716F019D
        22640DB845A0A5E8591A580E5D3EB60E6C72995C0639600AB6266C75F47DA010
        FDBC17026790C5208F40B5E8526464EFE52AADD3B1B360097806B2F16BC76F05
        FD2BA01A7DBD1702F2B93415A412E8A70E8E42DC067380388A2EA7DF87CF57F5
        4943B4818FA02C869C1D4298F96D4E029F902318E8555EF51CBC0192A85D97DE
        EFF0918365C590FC5FDB478C322701F9EC967D4F916F341D4CD6E5953D96129A
        021E80E5B2FC413E32D66AEC0319AD49EC4AE67F7012B8882C00390CDE431F42
        BF56F75C96BD109C0333F54CE44A3DC7CFA7FA05F4D55ECE4009F238A8215031
        BA54C1179A5C48B5624B37F65B2124E4B56BC026A4D6808DE827BD1090A5945F
        27F9839137E13AB679463E182DEB47D084343D078FE8E7E916351BFDBC764D40
        15B978642BE42D2822E0CD08139719BB6EC8A12DC0F76ABCC94308A86197B17F
        1E02E0B4B1EF82C772F3E90D39D7D877C13A9DB79BB17297C9331072189B9DB7
        E12A4405C85493FCC349F2A420B25276A516B4BB49AE4D2E37F9E13DD4D7F780
        2CADFC94CA9B311BA47B4814AEC9F25783D2BF7FC6DBC6F56A8D800000000049
        454E44AE426082}
    end
    object Label14: TLabel
      Left = 499
      Top = 368
      Width = 215
      Height = 29
      Alignment = taCenter
      Caption = 'Consultas Canceladas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lblConsulCance: TLabel
      Left = 589
      Top = 411
      Width = 24
      Height = 29
      Alignment = taCenter
      Caption = '12'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 98
      Top = 100
      Width = 209
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csDropDownList
      TabOrder = 0
      TextHint = 'Exemplo: Relat'#243'rio de Consulta'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Relat'#243'rio de Consultas'
        'Relat'#243'rio Por Profissional'
        'Relat'#243'rio Por Tratamento')
    end
    object pnlConsulta: TPanel
      Left = 41
      Top = 208
      Width = 335
      Height = 249
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object Bevel3: TBevel
        Left = 0
        Top = 56
        Width = 335
        Height = 9
        Shape = bsTopLine
      end
      object Label2: TLabel
        Left = 21
        Top = 11
        Width = 290
        Height = 29
        Alignment = taCenter
        Caption = 'Selecione a Data da Consulta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Calibri'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Shape4: TShape
        Left = 28
        Top = 192
        Width = 277
        Height = 41
        Brush.Color = 13204758
        Pen.Color = 13224393
        Shape = stRoundRect
        OnMouseEnter = lblGerarConsulMouseEnter
        OnMouseLeave = lblGerarConsulMouseLeave
      end
      object DateTimePicker1: TDateTimePicker
        Left = 57
        Top = 112
        Width = 211
        Height = 41
        Date = 45962.000000000000000000
        Time = 0.661162210650218200
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 30
        Top = 195
        Width = 272
        Height = 34
        BevelOuter = bvNone
        Color = 13204758
        ParentBackground = False
        TabOrder = 1
        OnMouseEnter = lblGerarConsulMouseEnter
        OnMouseLeave = lblGerarConsulMouseLeave
        object lblGerarConsul: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 8
          Width = 99
          Height = 17
          Margins.Top = 8
          Align = alClient
          Alignment = taCenter
          Caption = 'Gerar Relat'#243'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = lblGerarConsulClick
          OnMouseEnter = lblGerarConsulMouseEnter
          OnMouseLeave = lblGerarConsulMouseLeave
        end
      end
    end
    object pnlProf: TPanel
      Left = 41
      Top = 208
      Width = 335
      Height = 249
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object Bevel4: TBevel
        Left = 0
        Top = 56
        Width = 335
        Height = 9
        Shape = bsTopLine
      end
      object Label4: TLabel
        Left = 57
        Top = 11
        Width = 234
        Height = 29
        Alignment = taCenter
        Caption = 'Selecione o Profissional'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Calibri'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Shape5: TShape
        Left = 28
        Top = 192
        Width = 277
        Height = 41
        Brush.Color = 13204758
        Pen.Color = 13224393
        Shape = stRoundRect
        OnMouseEnter = lblGerarProfMouseEnter
        OnMouseLeave = lblGerarProfMouseLeave
      end
      object Panel3: TPanel
        Left = 30
        Top = 195
        Width = 272
        Height = 34
        BevelOuter = bvNone
        Color = 13204758
        ParentBackground = False
        TabOrder = 0
        OnMouseEnter = lblGerarProfMouseEnter
        OnMouseLeave = lblGerarProfMouseLeave
        object lblGerarProf: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 8
          Width = 99
          Height = 17
          Margins.Top = 8
          Align = alClient
          Alignment = taCenter
          Caption = 'Gerar Relat'#243'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = lblGerarRelaProfClick
          OnMouseEnter = lblGerarProfMouseEnter
          OnMouseLeave = lblGerarProfMouseLeave
        end
      end
      object cbProf: TComboBox
        Left = 57
        Top = 112
        Width = 209
        Height = 23
        Style = csDropDownList
        TabOrder = 1
        TextHint = 'Selecione o Profissional:'
        OnDropDown = cbProfDropDown
      end
    end
    object pnlProcedimento: TPanel
      Left = 41
      Top = 206
      Width = 335
      Height = 249
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      object Bevel5: TBevel
        Left = 0
        Top = 56
        Width = 335
        Height = 9
        Shape = bsTopLine
      end
      object Label7: TLabel
        Left = 39
        Top = 11
        Width = 258
        Height = 29
        Alignment = taCenter
        Caption = 'Selecione o Procedimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Calibri'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Shape6: TShape
        Left = 28
        Top = 192
        Width = 277
        Height = 41
        Brush.Color = 13204758
        Pen.Color = 13224393
        Shape = stRoundRect
        OnMouseEnter = lblGerarProcMouseEnter
        OnMouseLeave = lblGerarProcMouseLeave
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 28
        Top = 192
        Width = 276
        Height = 40
        Margins.Top = 8
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 30
        Top = 195
        Width = 272
        Height = 34
        BevelOuter = bvNone
        Color = 13204758
        ParentBackground = False
        TabOrder = 0
        OnMouseEnter = lblGerarProcMouseEnter
        OnMouseLeave = lblGerarProcMouseLeave
        object lblGerarProc: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 8
          Width = 99
          Height = 17
          Margins.Top = 8
          Align = alClient
          Alignment = taCenter
          Caption = 'Gerar Relat'#243'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnMouseEnter = lblGerarProcMouseEnter
          OnMouseLeave = lblGerarProcMouseLeave
        end
      end
      object cbProc: TComboBox
        Left = 57
        Top = 112
        Width = 209
        Height = 23
        Style = csDropDownList
        TabOrder = 1
        TextHint = 'Selecione o Procedimento'
        OnDropDown = cbProcDropDown
      end
    end
  end
end
