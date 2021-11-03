import 'package:flutter/material.dart';
import 'package:github_app/core/base/view_model_provider.dart';
import 'package:github_app/view/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  // late HomeViewModel viewModel;
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        onModelReady: (model) => model.setInit(),
        onPageBuilder: (context, viewModel, child) {
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${viewModel.getCounter} ",
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
