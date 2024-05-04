import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: const Text('Dialog box'),
            subtitle: const Text('Sub Title '),
            onTap: () {
              Get.defaultDialog(
                title: 'Delete',
                middleText: 'Are You sure ?',
                textConfirm: 'Yes',
                textCancel: 'No',
                onCancel: () {
                  Get.back();
                },
              );
            },
          ),
          ListTile(
            title: const Text('Bottom Sheet'),
            subtitle: const Text('Changing Theme '),
            onTap: () {
              Get.bottomSheet(Container(
                color: Colors.red,
                child: Column(
                  children: [
                    ListTile(  
                      title: Text('Light Theme'),
                      subtitle: Text('Theme'),
                      onTap: () {
                        Get.changeTheme(
                          ThemeData.light(),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Dark Theme'),
                      subtitle: Text('Theme'),
                      onTap: () {
                        Get.changeTheme(
                          ThemeData.dark(),
                        );
                      },
                    ),
                  ],
                ),
              ));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('Title', 'Description');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
