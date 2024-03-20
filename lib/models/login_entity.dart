import 'package:druid_pamigo_flutter/generated/json/base/json_field.dart';
import 'package:druid_pamigo_flutter/generated/json/login_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginEntity {
	String?token;
	String?password;
	User? userInfo;

	LoginEntity();

	factory LoginEntity.fromJson(Map<String, dynamic> json) =>
			$LoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class User {
	String? nickname;
	String? username;
	String? userId;
	String? userPhone;

	User();

	factory User.fromJson(Map<String, dynamic> json) => $UserFromJson(json);

	Map<String, dynamic> toJson() => $UserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}