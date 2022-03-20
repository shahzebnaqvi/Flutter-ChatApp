// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/model/chat_model.dart';
import '../service/chat_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({
    Key? key,
    required this.chatman,
    // required this.chatmanname,
    // required this.imgaelink
  }) : super(key: key);
  final String chatman;
  // final String chatmanname;
  // final String imgaelink;

  @override
  _ChatpageState createState() => _ChatpageState();
}

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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Color(0xFF1F1A30),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * 0.02),
                child: CircleAvatar(
                    // backgroundImage: NetworkImage(widget.imgaelink),
                    ),
              ),
              Text("${widget.chatman}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFF1F1A30),
          child: Column(
            children: [
              // FutureBuilder(builder: builder)
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       bottom: MediaQuery.of(context).size.height * 0,
              //       top: MediaQuery.of(context).size.height * 0.005),
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //       padding: EdgeInsets.only(
              //           top: MediaQuery.of(context).size.width * 0.06,
              //           left: MediaQuery.of(context).size.width * 0.06),
              //       // child: Text("${widget.chatmanname}",
              //       //     style: TextStyle(
              //       //         color: Colors.white,
              //       //         fontWeight: FontWeight.bold,
              //       //         fontSize: 30)),
              //     ),
              //   ),
              // ),
              Expanded(
                child: StreamBuilder(
                  stream: getdata(),
                  builder: (context, AsyncSnapshot snap) {
                    if (snap.hasError) {
                      return Text("Error");
                    } else if (snap.connectionState == ConnectionState.done &&
                        snap.hasData) {
                      return InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.pink,
                        ),
                      );
                      //Container(width: 300,height: 450,
                      // child: Image.network(snap.data!,
                      // fit: BoxFit.cover,),

                    }
                    if (snap.connectionState == ConnectionState.waiting) {
                      return CircleAvatar(
                        backgroundColor: Colors.yellow,
                      );
                    }
                    return Container();
                  },
                ),
              ),

              // Expanded(
              //   child: StreamBuilder<Chatmessage>(
              //     stream: getdata(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<Chatmessage> snapshot) {
              //       if (snapshot.hasError) {
              //         return Text("Error");
              //       }
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }

              //       // var kk ;

              //       return Padding(
              //         padding: EdgeInsets.only(
              //             left: MediaQuery.of(context).size.width * 0.06,
              //             right: MediaQuery.of(context).size.width * 0.06),
              //         child: ListView(
              //           reverse: true,
              // children: snapshot.data!.docs
              //     .map((DocumentSnapshot document) {
              //   Map<String, dynamic> data =
              //       document.data()! as Map<String, dynamic>;
              //   if (1==1) {
              //     lefts = 0;
              //     rights = 0.2;
              //     fieldColor = Color(0xFF39304d);
              //     textColor = Colors.white;
              //     dateColor = Colors.white70;
              //   } else {
              //     lefts = 0.2;
              //     rights = 0;
              //     fieldColor = Color(0xFF0CF6E3);
              //     textColor = Color(0xFF1F1A30);
              //     dateColor = Colors.black87;
              //   }
              //   DateTime myDateTime = (data['time2']).toDate();

              //   return Container(
              //     margin: EdgeInsets.only(
              //         top: MediaQuery.of(context).size.height * 0.02,
              //         left: MediaQuery.of(context).size.width * lefts,
              //         right:
              //             MediaQuery.of(context).size.width * rights),
              //     decoration: BoxDecoration(
              //       color: fieldColor,
              //       borderRadius: BorderRadius.circular(20),
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Color(0xFF39304d),
              //       //     blurRadius: 10,
              //       //     offset: Offset(0, 0), // Shadow position
              //       //   ),
              //       // ],
              //     ),
              //     child: ListTile(
              //       title: Text(
              //         data['message'],
              //         style: TextStyle(color: textColor),
              //       ),
              //       trailing: Padding(
              //         padding: EdgeInsets.only(
              //             bottom: MediaQuery.of(context).size.height *
              //                 0.008),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             Text(
              //               // DateTime.parse(timestamp.toDate().toString()),
              //               "ooo",
              //               style: TextStyle(color: dateColor),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   );
              // }).toList(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFF39304d),
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
                    color: Color(0xFF1F1A30),
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
                          print(getdata());
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
