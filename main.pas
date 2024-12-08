uses settings;

uses System.IO, System.Net;


const
  BASE_URL = 'https://api.telegram.org/bot';


function sendMessage(url: string; token: string; chat_id: string; text: string): WebResponse;
begin
  var request := HttpWebRequest(WebRequest.Create($'{url}{token}/sendMessage?chat_id=chat_id&text=text'));
  request.Method := 'GET';
  
  var response := request.GetResponse();
  
  result := HttpWebResponse(response);
end;


begin
  var secrets := LoadEnvFile('.env');
  
  System.Net.ServicePointManager.SecurityProtocol := SecurityProtocolType.Tls12;
  
  sendMessage(BASE_URL, secrets['TELEGRAM_API_TOKEN'], secrets['CHAT_ID'], 'Привет!');
end.
