import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_app/core/base/base_view_model.dart';
import 'package:github_app/core/model/github_user_model.dart';
import 'package:github_app/core/web_service/export_library.dart';

class HomeViewModel with ChangeNotifier, BaseViewModel {
  GithubUser? githubUser;
  bool? isLoading;
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  Future setInit() async {
    isLoading = false;
    githubUser = GithubUser();
    await fetchUsers();
  }

  Future fetchUsers() async {
    final responseData = await coreDio.fetchData<GithubUser, GithubUser>(
        path: "mehmetcanacik", parseModel: GithubUser(), type: HttpTypes.get);

    if (responseData.data != null ||
        responseData.data is Map<String, dynamic>) {
      githubUser = responseData.data!;
      notifyListeners();
    }
  }
}
