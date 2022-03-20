import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chatapp/model/chat_model.dart';

Stream getdata() async* {
  var response = await http
      .get(Uri.parse('https://waleeddeevloopers.9am.website/message.php'));
  var jsonData = jsonDecode(response.body);
  // print(jsonData);
  List<Chatmessage> users = [];
  Chatmessage user = Chatmessage(
      id: jsonData['id'],
      createTime: jsonData['create_time'],
      person: jsonData['person'],
      message: jsonData['message']);
  users.add(user);
  print(user);
  yield user;
  // print(user)
}
