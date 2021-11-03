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
            backgroundColor: Theme.of(context).backgroundColor,
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${viewModel.getCounter} ",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: MaterialButton(
                      color: Colors.blue[100],
                      onPressed: () {
                        viewModel.incrementCounter();
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10.0)),
                          side: BorderSide(color: Colors.grey, width: 1.0)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Click Me!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
