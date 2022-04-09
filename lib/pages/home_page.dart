import 'package:flutter/material.dart';
import 'package:pattern_provider/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../views/item_of_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 HomeViewModel viewModel = HomeViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pattern - provider"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, model, index) => Stack(
            children: [
              ListView.builder(
                itemCount: viewModel.items.length,
                itemBuilder: (context, index) {
                  return itemOfPost(viewModel, viewModel.items[index]);
                },
              ),
              viewModel.isLoading ? const Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

}
