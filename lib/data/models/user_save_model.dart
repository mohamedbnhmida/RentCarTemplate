// To parse this JSON data, do
//
//     final userSaveModel = userSaveModelFromJson(jsonString);

import 'dart:convert';

UserSaveModel userSaveModelFromJson(String str) => UserSaveModel.fromJson(json.decode(str));

String userSaveModelToJson(UserSaveModel data) => json.encode(data.toJson());

class UserSaveModel {
    String firstName;
    String lastName;
    String email;
    String userName;
    String password;
    String confirmPassword;
    String phoneNumber;
    bool activateUser;
    bool autoConfirmEmail;

    UserSaveModel({
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.userName,
        required this.password,
        required this.confirmPassword,
        required this.phoneNumber,
        required this.activateUser,
        required this.autoConfirmEmail,
    });

    factory UserSaveModel.fromJson(Map<String, dynamic> json) => UserSaveModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        phoneNumber: json["phoneNumber"],
        activateUser: json["activateUser"],
        autoConfirmEmail: json["autoConfirmEmail"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "userName": userName,
        "password": password,
        "confirmPassword": confirmPassword,
        "phoneNumber": phoneNumber,
        "activateUser": activateUser,
        "autoConfirmEmail": autoConfirmEmail,
    };
}
