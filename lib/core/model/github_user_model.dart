import 'package:github_app/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_user_model.g.dart';

@JsonSerializable()
class GithubUser extends BaseModel<GithubUser> {
  @JsonKey(name: 'id', required: true)
  final int userId;
  @JsonKey(name: 'login', required: true)
  final String? loginName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'name')
  final String? userName;
  @JsonKey(name: 'blog')
  final String? email;
  final int? followers;
  final int? following;

  GithubUser(
      {required this.userId,
      this.loginName,
      this.avatarUrl,
      this.userName,
      this.email,
      this.followers,
      this.following});

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);

  @override
  GithubUser fromJson(Map<String, dynamic> json) => GithubUser.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GithubUserToJson(this);
}
