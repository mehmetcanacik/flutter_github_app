// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUser _$GithubUserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'login'],
  );
  return GithubUser(
    userId: json['id'] as int?,
    loginName: json['login'] as String?,
    avatarUrl: json['avatar_url'] as String? ?? "assets/images/githubUser.png",
    userName: json['name'] as String?,
    email: json['blog'] as String?,
    followers: json['followers'] as int?,
    following: json['following'] as int?,
  );
}

Map<String, dynamic> _$GithubUserToJson(GithubUser instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'login': instance.loginName,
      'avatar_url': instance.avatarUrl,
      'name': instance.userName,
      'blog': instance.email,
      'followers': instance.followers,
      'following': instance.following,
    };
