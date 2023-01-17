import 'dart:convert';
import 'package:http/http.dart' as http;

class ListUser {
  String id;
  String name;

  ListUser({required this.id, required this.name});

  factory ListUser.createListUser(Map<String, dynamic> object) {
    return ListUser(
      id: object["id"].toString(),
      name: object["first_name"] + " " + object["last_name"],
    );
  }

  static Future<List<ListUser>> getUser(String page) async {
    String apiURL = "https://reqres.in/api/users?page=$page";

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)["data"];

    List<ListUser> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(ListUser.createListUser(listUser[i]));
    }
    return users;
  }
}
