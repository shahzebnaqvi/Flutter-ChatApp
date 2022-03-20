class Chatmessage {
  String? id;
  String? createTime;
  String? person;
  String? message;

  Chatmessage({this.id, this.createTime, this.person, this.message});

  // Chatmessage.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   createTime = json['create_time'];
  //   person = json['person'];
  //   message = json['message'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['create_time'] = this.createTime;
  //   data['person'] = this.person;
  //   data['message'] = this.message;
  //   return data;
  // }
}
