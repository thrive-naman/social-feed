import 'dart:convert';
import 'package:http/http.dart' as http;

String clientId = 'your-client-id';
String clientSecret = 'your-client-secret';
String redirectUri = 'your-redirect-uri';

String authorizationCode = 'the-authorization-code-you-received';

String tokenEndpoint = 'https://accounts.spotify.com/api/token';

Map<String, String> body = {
  'grant_type': 'authorization_code',
  'code': authorizationCode,
  'redirect_uri': redirectUri,
};

String basicAuth =
    'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret'));

Map<String, String> headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': basicAuth,
};

