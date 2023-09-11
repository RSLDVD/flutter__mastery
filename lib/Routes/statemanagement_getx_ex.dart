import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetxEx());
}

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
  }
}

class AuthController extends GetxController {
  var isAuthenticated = false.obs;

  void toggleAuthentication() {
    isAuthenticated.value = !isAuthenticated.value;
  }
}

class GetxEx extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterController = Get.find<CounterController>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => Text(
                'Counter Value: ${counterController.counter.value}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Text(
                'Authentication Status: ${authController.isAuthenticated.value ? 'Logged In' : 'Logged Out'}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            CounterIncrementer(),
            AuthToggler(),
          ],
        ),
      ),
    );
  }
}

class CounterIncrementer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterController = Get.find<CounterController>();

    return ElevatedButton(
      onPressed: () {
        counterController.increment();
      },
      child: Text('Increment Counter'),
    );
  }
}

class AuthToggler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return ElevatedButton(
      onPressed: () {
        authController.toggleAuthentication();
      },
      child: Obx(
        () => Text(authController.isAuthenticated.value ? 'Log Out' : 'Log In'),
      ),
    );
  }
}
