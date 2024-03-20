import 'package:druid_pamigo_flutter/generated/json/base/json_convert_content.dart';
import 'package:druid_pamigo_flutter/models/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
	final LoginEntity loginEntity = LoginEntity();
	final User userInfo = $UserFromJson(json);//jsonConvert.convert<User>(json['userInfo']);
	if (userInfo != null) {
		loginEntity.userInfo = userInfo;
	}
	return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userInfo'] = entity.userInfo?.toJson();
	return data;
}

User $UserFromJson(Map<String, dynamic> json) {
	final User user = User();
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		user.nickname = nickname;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		user.username = username;
	}
	final String? userId = jsonConvert.convert<String>(json['id']);
	if (userId != null) {
		user.userId = userId;
	}
	final String? userPhone = jsonConvert.convert<String>(json['phone']);
	if (userPhone != null) {
		user.userPhone = userPhone;
	}
	return user;
}

Map<String, dynamic> $UserToJson(User entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['nickname'] = entity.nickname;
	data['userId'] = entity.userId;
	data['userPhone'] = entity.userPhone;
	return data;
}