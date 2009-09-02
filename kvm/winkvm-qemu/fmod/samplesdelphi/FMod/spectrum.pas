unit spectrum;

interface

uses
  Windows, Classes, Controls, Messages, Graphics;

type
  TSpectrumStyle = (ssSmooth, ssBlock);

  TMiniSpectrum = class(TGraphicControl)
  private
    FGradient: TBitmap;
    FBuffer: TBitmap;
    FScale: Single;
    FStyle: TSpectrumStyle;
    FValues: array [0..127] of Single;
    procedure SetStyle(const Value: TSpectrumStyle);
  protected
    procedure Paint; override;
    procedure Resize; override;
    procedure SetEnabled(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Draw;
  published
    property Align;
    property Scale: Single read FScale write FScale;
    property Style: TSpectrumStyle read FStyle write SetStyle;
    property OnClick;
  end;

implementation

uses
  fmod, fmodtypes;

{ TMiniSpectrum }

constructor TMiniSpectrum.Create(AOwner: TComponent);
var
  X, Y: Integer;
  R, G, B: Integer;
  C: TColor;
begin
  inherited;
  Color := clBlack;
  Width := 80;
  Height := 32;
  FScale := 4.0;
  FStyle := ssSmooth;
  Enabled := False;

  // Create draw buffer
  FBuffer := TBitmap.Create;
  FBuffer.PixelFormat := pf32bit;
  FBuffer.Width := Width;
  FBuffer.Height := Height;

  // Create gradient bitmap
  FGradient := TBitmap.Create;
  FGradient.PixelFormat := pf32bit;
  FGradient.Width := 4;
  FGradient.Height := 32;

  R := 255;
  G := 0;
  B := 0;

  for Y := 0 to 31 do
  begin
    if Y > 15 then
      Dec(R, 16)
    else
      Inc(G, 16);
    if R < 0 then
      R := 0;
    if G > 255 then
      G := 255;
    C := TColor(RGB(R, G, B));
    for X := 0 to 2 do
      FGradient.Canvas.Pixels[X, Y] := C;
    FGradient.Canvas.Pixels[3, Y] := TColor(0);
  end;
end;

destructor TMiniSpectrum.Destroy;
begin
  FGradient.Free;
  FBuffer.Free;
  inherited;
end;

type
  PSingleArray = ^TSingleArray;
  TSingleArray = array [0..0] of Single;

procedure TMiniSpectrum.Draw;
var
  Data: PSingleArray;
  PeakData: Single;
  W, X, Y: Integer;
  ARect: TRect;
begin
  FBuffer.Canvas.Brush.Color := Color;
  FBuffer.Canvas.FillRect(BoundsRect);

  if Enabled then
  begin
    Data := PSingleArray(FSOUND_DSP_GetSpectrum);

    // Get the peak value of each block of four values
    for X := 0 to 127 do
    begin
      W := X * 4;
      FValues[X] := Data^[W];
      if Data^[W + 1] > FValues[X] then
        FValues[X] := Data^[W + 1];
      if Data^[W + 2] > FValues[X] then
        FValues[X] := Data^[W + 2];
      if Data^[W + 3] > FValues[X] then
        FValues[X] := Data^[W + 3];
      FValues[X] := FValues[X] * FScale;
      if FValues[X] > 1.0 then
        FValues[X] := 1.0;
    end;

    W := Width;
    if W > 128 then
      W := 128;

    case FStyle of
    ssSmooth:
      begin
        X := 0;
        while X < W do
        begin
          if FValues[X] > 0.0 then
          begin
            Y := Height - Trunc(FValues[X] * 1.0 * Height);
            FBuffer.Canvas.CopyRect(Rect(X, Y, X + 1, Height), FGradient.Canvas, Rect(0, Y, 1, FGradient.Height));
          end;
          Inc(X);
        end;
      end;
    ssBlock:
      begin
        // Sixteen values for every column
        PeakData := 0;
        X := 0;
        while X < W do
        begin
          if PeakData < FValues[X] then
            PeakData := FValues[X];
          if (X and 3 = 3) and (PeakData > 0.0) then
          begin
            Y := Height - Trunc(PeakData * 1.0 * Height);
            PeakData := 0;
            FBuffer.Canvas.CopyRect(Rect(X, Y, X + 4, Height), FGradient.Canvas, Rect(0, Y, 4, FGradient.Height));
          end;
          Inc(X);
        end;
      end;
    end;
  end
  else
  begin
    FBuffer.Canvas.Font.Color := clWhite;
    ARect := BoundsRect;
    DrawText(FBuffer.Canvas.Handle, 'Click for spectrum', -1, ARect, DT_WORDBREAK or DT_NOPREFIX or DT_VCENTER or DT_CENTER);
  end;

  // Copy the buffer to the control
  Canvas.Draw(0, 0, FBuffer);
end;

procedure TMiniSpectrum.Paint;
begin
  Draw;
end;

procedure TMiniSpectrum.Resize;
begin
  inherited;
  if Assigned(FBuffer) then
  begin
    FBuffer.Width := Width;
    FBuffer.Height := Height;
  end;
end;

procedure TMiniSpectrum.SetEnabled(Value: Boolean);
begin
  inherited;
  FSOUND_DSP_SetActive(FSOUND_DSP_GetFFTUnit, Value);
end;

procedure TMiniSpectrum.SetStyle(const Value: TSpectrumStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    ZeroMemory(@FValues, SizeOf(FValues));
  end;
end;

end.
