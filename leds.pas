unit leds;

interface
uses ExtCtrls, Graphics, SysUtils ;
type
  TLED = class
  private
    Fstate:boolean;
    FOnColor: TColor;
    FOffColor: TColor;
    ChangeColor:boolean;
    Image: TImage;
    procedure ShowLed(Color: TColor);
    procedure SetOnColor(value: TColor);
    procedure SetOffColor(value: TColor);
    function GetVisible: boolean;
    procedure SetVisible(value: boolean);
    function GetLeft: integer;
    procedure SetLeft(value: integer);
    procedure SetState(value: boolean);
    function GetHint: string;
    procedure SetHint(value: string);
  public
    RePaintChangeColor: boolean;  // заставл€ет перерисовать при изменении цвета
    AutoOff: boolean;
    AutoOffTime: TDateTime;
    constructor Create(vImage: TImage; vOnColor,vOffColor: TColor);
    procedure OnSwich;
    procedure OffSwich;
    function AutoOffTest(CurTime: TDateTime): boolean;
    procedure Flash(color: TColor; delay: integer); // delay - ms
    property State: boolean read Fstate write SetState;
    property OnColor: TColor read FOnColor write SetOnColor;
    property OffColor: TColor read FOffColor write SetOffColor;
    property Visible: boolean read GetVisible write SetVisible;
    property Left: integer read GetLeft write SetLeft;
    property Hint: string read GetHint write SetHint;
  end;

implementation
//******************************************************************************
constructor TLED.Create(vImage: TImage; vOnColor,vOffColor: TColor);
begin
  inherited Create;
  Image:=vImage;
  OnColor:=vOnColor;
  OffColor:=vOffColor;
  ChangeColor:=false;
  RePaintChangeColor:=true;
  FState:=false;
  ShowLed(OffColor);
  AutoOff:=false;
end;
//------------------------------------------------------------------------------
procedure TLED.OnSwich;
begin
  if (not FState)or(ChangeColor) then
  begin
    ShowLed(OnColor);
    FState:=true;
  end;
end;
//------------------------------------------------------------------------------
procedure TLED.OffSwich;
begin
  if (FState)or(ChangeColor) then
  begin
    ShowLed(OffColor);
    FState:=false;
  end;
end;
//------------------------------------------------------------------------------
function TLED.AutoOffTest(CurTime: TDateTime): boolean;
begin
  result:=false;
  if (FState)and(AutoOff) then
  begin
    if CurTime>AutoOffTime then
    begin
      OffSwich;
      AutoOff:=false;
      result:=true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TLED.Flash(color: TColor; delay: integer); // delay - ms
begin
  AutoOffTime:=now+delay/(24000*3600);
  AutoOff:=true;
  FState:=true;
  OnColor:=color;
  OnSwich;
//  ShowLed(color);
end;

//------------------------------------------------------------------------------
procedure TLED.ShowLed(Color: TColor);
begin
  if Image=nil then exit;
  Image.Canvas.Brush.Color:=Color;
  Image.Canvas.Ellipse(3,3,12,12);
  Image.Repaint;
  ChangeColor:=false;
end;
//------------------------------------------------------------------------------
procedure TLED.SetOnColor(value: TColor);
begin
  if FOnColor<>value then ChangeColor:=true;
  FOnColor:=value;
  if (RePaintChangeColor)and(FState)and(ChangeColor) then ShowLed(FOnColor);
end;
//------------------------------------------------------------------------------
procedure TLED.SetOffColor(value: TColor);
begin
  if FOffColor<>value then ChangeColor:=true;
  FOffColor:=value;
  if (RePaintChangeColor)and(not FState)and(ChangeColor) then ShowLed(FOffColor);
end;
//------------------------------------------------------------------------------
function TLED.GetVisible: boolean;
begin
  result:=Image.Visible;
end;
//------------------------------------------------------------------------------
procedure TLED.SetVisible(value: boolean);
begin
  Image.Visible:=value;
end;
//------------------------------------------------------------------------------
function TLED.GetLeft: integer;
begin
  result:=Image.Left;
end;
//------------------------------------------------------------------------------
procedure TLED.SetLeft(value: integer);
begin
  Image.Left:=value;
end;
//------------------------------------------------------------------------------
procedure TLED.SetState(value: boolean);
begin
  if value then OnSwich else OffSwich;

end;
//------------------------------------------------------------------------------
function TLED.GetHint: string;
begin
  result:=Image.Hint;

end;
//------------------------------------------------------------------------------
procedure TLED.SetHint(value: string);
begin
  Image.Hint:=value;
  Image.ShowHint:=value<>'';
end;
//------------------------------------------------------------------------------

end.
