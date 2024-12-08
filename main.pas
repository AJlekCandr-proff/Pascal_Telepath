uses System.IO, System.Net;


const
  BOT_API_TOKEN = '';
  BASE_URL = 'https://api.telegram.org/bot';


function sendMessage(url: string; token: string; chat_id: integer; text: string): WebResponse;
begin
  var request := HttpWebRequest(WebRequest.Create($'{url}{token}/sendMessage?chat_id=5166406299&text=Привет!'));
  request.Method := 'GET';
  
  var response := request.GetResponse();
  
  result := HttpWebResponse(response);
end;


begin
  System.Net.ServicePointManager.SecurityProtocol := SecurityProtocolType.Tls12;
  
  print(sendMessage(BASE_URL, BOT_API_TOKEN, 12345, 'Привет!'));
end.


begin
  print(sendMessage(BASE_URL, BOT_API_TOKEN));
end.