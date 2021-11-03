import 'package:flutter/material.dart';
import '../../core/base/view_model_provider.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        onModelReady: (model) => model.setInit(),
        onPageBuilder: (context, viewModel, child) {
          return buildScaffold(context, viewModel);
        },
        viewModelBuilder: () => HomeViewModel());
  }

  Widget buildScaffold(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: buildBody(viewModel),
    );
  }

  Widget buildBody(HomeViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            viewModel.githubUser!.email ?? "Lütfen Bekleyiniz...",
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: MaterialButton(
              color: Colors.blue[100],
              onPressed: () {},
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10.0)),
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
    );
  }
}
