unit ClassArray;

interface

uses
 SysUtils;

{$pointermath on}

type
  TMyArray = record
  private
    FData: array of array of integer;
    function GetItem(x, y: integer): integer;
    procedure SetItem(x, y, Value: Integer);
  public
    class function New(Size1, Size2: cardinal): TMyArray; static;
    property Item[x, y: integer]: integer read GetItem write SetItem;
  end;
implementation

{ TArrayClass }

function TMyArray.GetItem(x,y: integer): integer;
begin
  Inc(x,3); Dec(y,1);
  Result := Item[x, y];
end;

class function TMyArray.New(Size1, Size2: cardinal): TMyArray;
begin
end;

procedure TMyArray.SetItem(x,y: Integer; Value: Integer);
begin
  Inc(x,3); Dec(y,1);
  Item[x,y] := Value;
end;

end.
