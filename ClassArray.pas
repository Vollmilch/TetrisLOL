unit ClassArray;

interface

uses
 SysUtils;

{$pointermath on}

type
  TMyArray = record
  private
    FData: array of integer;
  public
    class function New(Size1, Size2: cardinal): TMyArray; static;
    function GetItem(x,y: Integer): Integer;
    procedure SetItem(x,y,Value: Integer);
    //property Item[x, y: integer]: integer read GetItem write SetItem default;
  end;

implementation

{ TArrayClass }

function TMyArray.GetItem(x,y: integer): integer;
begin
  Inc(x,3); Dec(y,1);
  Result := FData[x+y];
end;

class function TMyArray.New(Size1, Size2: cardinal): TMyArray;
begin
  //SetLength(FData, Size1 * Size2);
end;

procedure TMyArray.SetItem(x,y: Integer; Value: Integer);
begin
  Inc(x,3); Dec(y,1);
  FData[x+y] := Value;
end;

end.
