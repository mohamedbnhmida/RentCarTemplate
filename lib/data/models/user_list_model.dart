// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
    List<User> data;
    List<dynamic> messages;
    bool succeeded;

    UserListModel({
        required this.data,
        required this.messages,
        required this.succeeded,
    });

    factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        succeeded: json["succeeded"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "succeeded": succeeded,
    };
}

class User {
    String id;
    String userName;
    String firstName;
    String lastName;
    String email;
    bool isActive;
    bool emailConfirmed;
    String? phoneNumber;

    User({
        required this.id,
        required this.userName,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.isActive,
        required this.emailConfirmed,
        required this.phoneNumber,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        isActive: json["isActive"],
        emailConfirmed: json["emailConfirmed"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "isActive": isActive,
        "emailConfirmed": emailConfirmed,
        "phoneNumber": phoneNumber,
    };
}
