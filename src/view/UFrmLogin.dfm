object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 161
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 161
    Align = alClient
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 0
    ExplicitLeft = 64
    ExplicitTop = 40
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      334
      161)
    object lblUsuario: TLabel
      Left = 16
      Top = 16
      Width = 43
      Height = 15
      Caption = 'Usu'#225'rio:'
    end
    object lblSenha: TLabel
      Left = 16
      Top = 73
      Width = 35
      Height = 15
      Caption = 'Senha:'
    end
    object edtUsuario: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 16
      Top = 94
      Width = 121
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 160
      Top = 93
      Width = 65
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnCancelar: TBitBtn
      Left = 231
      Top = 93
      Width = 66
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      Default = True
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
end
