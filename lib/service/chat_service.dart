import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp/model/chat_model.dart';

Stream getdata() async* {
  var response = await http
      .get(Uri.parse('http://waleeddeevloopers.9am.website/message.php'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);

  List<Chatmessage> users = [];
  for (var i = 0; i < jsonData.length; i++) {
    Chatmessage user = Chatmessage(
        id: jsonData[i]['id'],
        createTime: jsonData[i]['create_time'],
        person: jsonData[i]['person'],
        message: jsonData[i]['message']);
    users.add(user);
    // print(user);
    // yield user;
  }

  yield users;
  // print(user)
}

Future fetchUsers(message, perosnname) async {
  final response = await http.post(
      Uri.parse('http://waleeddeevloopers.9am.website/messagesend.php'),
      body: jsonEncode({'person': '$perosnname', 'message': '$message'}));
  print("as");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return (jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Users');
  }
}
