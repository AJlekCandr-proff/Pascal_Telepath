unit settings;


uses System.IO, System.Collections.Generic;


function LoadEnvFile(const filePath: string): Dictionary<string, string>;
begin
  var envVars := new Dictionary<string, string>;
  var envFile := StreamReader.Create(filePath);
  
  try
    while not envFile.EndOfStream do
    begin
      var line := envFile.ReadLine();
      
      if (line <> '') and (line[1] <> '#') then
      begin
        var key := Copy(line, 1, Pos('=', line) - 1);
        var value := Copy(line, Pos('=', line) + 1, Length(line));
        key := Trim(key);
        value := Trim(value);
        
        envVars.Add(key, value);
      end;
    end;
  finally
    envFile.Close;
    
    result := envVars;
  end;    
end;


end.
