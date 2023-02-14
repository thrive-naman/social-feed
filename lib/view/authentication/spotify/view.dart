import 'dart:convert';
import 'package:http/http.dart' as http;

// set the access token obtained from the authentication flow
String accessToken = "your-access-token-here";

// set the endpoint url
String url = "https://api.spotify.com/v1/me/player/recently-played";

// set the headers with the access token
Map<String, String> headers = {
  "Authorization": "Bearer $accessToken",
};
gettData(){
  // make the GET request to the endpoint
http.get(Uri.parse(url), headers: headers).then((response) {
  // parse the JSON response
  var recentlyPlayedTracks = jsonDecode(response.body);

  // print the response
  print(recentlyPlayedTracks);
}).catchError((error) {
  // handle any errors that occur
  print(error);
});


}
