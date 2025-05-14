object frmLoader: TfrmLoader
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Loader'
  ClientHeight = 208
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoad: TButton
    Left = 68
    Top = 47
    Width = 249
    Height = 113
    Caption = 'Load Application'
    TabOrder = 0
    OnClick = btnLoadClick
  end
end
