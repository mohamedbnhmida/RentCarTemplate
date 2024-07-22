
import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    Token data;
    List<dynamic> messages;
    bool succeeded;

    TokenModel({
        required this.data,
        required this.messages,
        required this.succeeded,
    });

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        data: Token.fromJson(json["data"]),
        messages: List<dynamic>.from(json["messages"].map((x) => x)),
        succeeded: json["succeeded"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "messages": List<dynamic>.from(messages.map((x) => x)),
        "succeeded": succeeded,
    };
}

class Token {
    String token;
    String refreshToken;
    DateTime refreshTokenExpiryTime;

    Token({
        required this.token,
        required this.refreshToken,
        required this.refreshTokenExpiryTime,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        refreshToken: json["refreshToken"],
        refreshTokenExpiryTime: DateTime.parse(json["refreshTokenExpiryTime"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "refreshTokenExpiryTime": refreshTokenExpiryTime.toIso8601String(),
    };
}