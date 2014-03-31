unit WindowsVersion;

interface

uses
  SysUtils;

  function GetWinVersion(const ShowServicePackInfo: Boolean = false): string;
  function GetWinSPVersion: string;

implementation

function GetWinVersion(const ShowServicePackInfo: Boolean = false): string;
//print Windows version
begin
  result:='';
  case Win32Platform of
    1:// 9x
      if Win32MajorVersion=4 then
        begin
          case Win32MinorVersion of
            0: result:='Windows 95';
            10: result:='Windows 98';
            90: result:='Windows ME';
          end;
        end;
  2: // NT
     case Win32MajorVersion of
         3:if Win32MinorVersion=51 then
              result:='Windows NT 3.51';
         4:if Win32MinorVersion=0 then
             result:='Windows NT 4';
         5:case Win32MinorVersion of
              0: result:='Windows 2000';
              1: result:='Windows XP';
              2: result:='Windows Server 2003';
           end;
         6:case Win32MinorVersion of
              0: result := 'Windows Vista';
           end;
     End;
  end;
  //Servicepacks
  if ShowServicePackInfo=true then
    result:=result+' '+GetWinSPVersion;
end;

function GetWinSPVersion: string;
//print Windows Service Pack version
begin
  result:='';
  if (Win32CSDVersion<>'') then
    result:=Win32CSDVersion;
end;

end.
