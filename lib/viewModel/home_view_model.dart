import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> items = [];

//Funksiyani yozish uchun homeviewModel

//post
  void apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }

//delete
  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    apiPostList();
    return response != null;
  }
}
