import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
              TextFormField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  controller.logInApi();
                },
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text('Log In'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void logInApi() async {
    try {
      final response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': 'eve.holt@reqres.in',
          'password':'cityslicka',
        },
      );
      print(
          '/////////////////////////////////////////////////////////////////////////////');

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);

      if (response.statusCode == 200) {
        Get.snackbar('Login SuccessFull', 'Congratulations');
      } else {
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
}
