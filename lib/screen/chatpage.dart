// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chatapp/model/chat_model.dart';
import '../service/chat_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({
    Key? key,
    required this.chatman,
  }) : super(key: key);
  final String chatman;
  @override
  _ChatpageState createState() => _ChatpageState();
}

bool selectuser = true;

class _ChatpageState extends State<Chatpage> {
  double lefts = 0;
  double rights = 0;
  Color fieldColor = Color(0xFF39304d);
  Color textColor = Color(0xFF1F1A30);
  Color dateColor = Colors.black87;
  double blurRadius2 = 0;
  final myControllerMsg = TextEditingController();
  DateTime _now = DateTime.now();
  // @overrid
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      getdata();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Row(
            children: [
              Text(
                "${widget.chatman}",
              ),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: getdata(),
                  builder: (context, AsyncSnapshot snap) {
                    if (snap.hasError) {
                      return Text("Error");
                    } else if (snap.connectionState == ConnectionState.done &&
                        snap.hasData) {
                      return ListView.builder(
                          reverse: true,
                          itemCount: snap.data.length,
                          itemBuilder: (context, index) {
                            if ('${snap.data[index].person}' ==
                                "${widget.chatman}") {
                              selectuser = true;
                            } else {
                              selectuser = false;
                            }
                            return Column(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width *
                                        0.05,
                                    left: selectuser
                                        ? MediaQuery.of(context).size.width *
                                            0.25
                                        : MediaQuery.of(context).size.width *
                                            0.05,
                                    right: selectuser
                                        ? MediaQuery.of(context).size.width *
                                            0.05
                                        : MediaQuery.of(context).size.width *
                                            0.25,
                                  ),
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                      right: MediaQuery.of(context).size.width *
                                          0.01,
                                      top: MediaQuery.of(context).size.width *
                                          0.05),
                                  decoration: BoxDecoration(
                                    color:
                                        selectuser ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.90,
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    '${snap.data[index].message}',
                                                style: TextStyle(
                                                    color: selectuser
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 18.0),
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      " ${snap.data[index].createTime}",
                                                      style: TextStyle(
                                                          color: selectuser
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 13.0)),
                                                ])
                                          ])))
                            ]);
                          });
                    }
                    if (snap.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF39304d),
                      blurRadius: 10,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    // borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF39304d),
                        // blurRadius: blurRadius1,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: myControllerMsg,
                    cursorColor: Colors.white,
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      // fillColor: field1Color,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      suffixIcon: InkWell(
                        onTap: () {
                          // addData();
                          print("test");
                          fetchUsers(
                              myControllerMsg.value.text, widget.chatman);
                          Timer.periodic(Duration(milliseconds: 1), (timer) {
                            getdata();
                          });
                          myControllerMsg.clear();
                        },
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white70,
                        ),
                      ),
                      hintText: 'Message...',
                      hintStyle: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
              // ),
            ],
          ),
        ));
  }
}
