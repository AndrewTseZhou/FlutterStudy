class UserBean {
  String name;
  String email;
  List<String> pics;

  UserBean.fromJson(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        pics = List<String>.from(map['pics']);
}
