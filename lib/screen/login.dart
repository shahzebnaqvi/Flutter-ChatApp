import 'package:chatapp/screen/chatpage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _dropDownValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width * 0.3,
              child: DropdownButton<String>(
                hint: _dropDownValue == ""
                    ? Text('Select')
                    : Text(
                        _dropDownValue,
                        style: TextStyle(),
                      ), // Not necessary for Option 1

                items: <String>['Person 1', 'Person 2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _dropDownValue = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_dropDownValue != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chatpage(
                                chatman: "$_dropDownValue",
                              )),
                    );
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
