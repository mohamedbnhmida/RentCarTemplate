import 'dart:convert';

UserbyEmailModel userbyEmailModelFromJson(String str) => UserbyEmailModel.fromJson(json.decode(str));

String userbyEmailModelToJson(UserbyEmailModel data) => json.encode(data.toJson());

class UserbyEmailModel {
    User data;
    List<dynamic> messages;
    bool succeeded;

    UserbyEmailModel({
        required this.data,
        required this.messages,
        required this.succeeded,
    });

    factory UserbyEmailModel.fromJson(Map<String, dynamic> json) => UserbyEmailModel(
        data: User.fromJson(json["data"]),
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        succeeded: json["succeeded"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
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
    dynamic phoneNumber;

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
