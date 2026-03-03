import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/demoController.dart';

class DemoPage extends StatelessWidget {
  final DemoController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Get.arguments ?? "No Arguments"),
            ),

            Obx(() => SwitchListTile(
              value: ctrl.isDark.value,
              title: Text("Touch to change ThemeMode"),
              onChanged: ctrl.changeTheme,
            )),

            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Snackbar",
                  "Hello this is the Snackbar message",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.black87,
                );
              },
              child: Text("Snackbar"),
            ),

            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Dialogue",
                  content: Text("Hey From Dialogue"),
                );
              },
              child: Text("Dialogue"),
            ),

            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 150,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "Hello From Bottom Sheet",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
              child: Text("Bottom Sheet"),
            ),

            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/');
              },
              child: Text("Back To Home"),
            ),

          ],
        ),
      ),
    );
  }
}