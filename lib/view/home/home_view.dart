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
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(.4),
      body: buildBody(viewModel),
    );
  }

  Widget buildBody(HomeViewModel viewModel) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            viewModel.isLoading!
                ? const Center(child: CircularProgressIndicator())
                : userCardWidget(viewModel),
            // fetchUserWidget(),
          ],
        ),
      ),
    );
  }

  // Widget fetchUserWidget() => Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 30.0),
  //       child: MaterialButton(
  //         color: Colors.blue[100],
  //         onPressed: () async {},
  //         shape: const RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.vertical(bottom: Radius.circular(10.0)),
  //             side: BorderSide(color: Colors.grey, width: 1.0)),
  //         child: const Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             "Click Me!",
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       ),
  //     );

  Widget userCardWidget(HomeViewModel viewModel) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Card(
          elevation: 10.0,
          child: ListTile(
            title: Text(viewModel.githubUser!.email ?? "Lütfen Bekleyiniz..."),
            subtitle:
                Text(viewModel.githubUser!.loginName ?? "Lütfen Bekleyiniz..."),
            leading: CircleAvatar(
                radius: 30.0,
                child: Center(
                    child: Text(viewModel.githubUser!.following.toString()))),
          ),
        ),
      );
}
