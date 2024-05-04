import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListExample extends StatefulWidget {
  const ListExample({Key? key}) : super(key: key);

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  List<String> itemList = ['Hi', 'Hello', 'By', 'Hey', 'Hmm'];
  List<String> selectedItemList = [];
  FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: favoriteController.itemList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    if (favoriteController.selectedItemList.contains(
                        favoriteController.itemList[index].toString())) {
                      favoriteController.removeFromFav(
                          favoriteController.itemList[index].toString());
                    } else {
                      favoriteController.addToFav(
                          favoriteController.itemList[index].toString());
                    }
                  },
                  title: Text(favoriteController.itemList[index].toString()),
                  trailing: Obx(
                    () => Icon(
                      Icons.favorite,
                      color: favoriteController.selectedItemList.contains(
                              favoriteController.itemList[index].toString())
                          ? Colors.red
                          : Colors.black12,
                    ),
                  )),
            );
          },
        ));
  }
}

class FavoriteController extends GetxController {
  RxList<String> itemList = ['Hi', 'Hello', 'By', 'Hey', 'Hmm'].obs;
  RxList<dynamic> selectedItemList = [].obs;

  addToFav(String item) {
    selectedItemList.add(item);
  }

  removeFromFav(String item) {
    selectedItemList.remove(item);
  }
}
