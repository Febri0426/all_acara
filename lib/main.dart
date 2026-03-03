import 'package:all_acara/acara22/acara22_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:all_acara/acara15/acara15_page.dart';
import 'acara16/telegram.dart';
import 'acara17/acara17_page.dart';
import 'package:all_acara/acara18/acara18_home.dart';
import 'package:all_acara/acara19/routes.dart';
import 'package:all_acara/acara20/acara20_main.dart';
import 'package:all_acara/acara21/acara21_page.dart';
import 'package:all_acara/acara23/acara23_page.dart';
import 'package:all_acara/acara25/form_page.dart';
import 'package:all_acara/acara27/acara27_page.dart';
import 'package:all_acara/acara28/form_register_modern.dart';
import 'package:all_acara/acara29/view/home.dart';
import 'package:get/get.dart';
import 'package:all_acara/acara29/controller/demoController.dart';
import 'package:all_acara/acara34/get_data.dart';
import 'package:all_acara/acara35/movie_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Tambahkan controller global sesuai modul acara 32
  final DemoController ctrl = Get.put(DemoController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      themeMode:
      ctrl.isDark.value ? ThemeMode.dark : ThemeMode.light,

      home: HomePage(),
    ));
  }
  }

class Acara19Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Praktikum Flutter"),
        actions: [
          Obx(() {
            final DemoController ctrl = Get.find();
            return Switch(
              value: ctrl.isDark.value,
              onChanged: ctrl.changeTheme,
            );
          }),
        ],
      ),

      // ================= BODY =================
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            menuButton(context, "ACARA 15 - Core Widgets", Acara15Page()),
            SizedBox(height: 15),

            menuButton(context, "ACARA 16 - Telegram UI", telegram()),
            SizedBox(height: 15),

            menuButton(context, "ACARA 17 - Styling & Layout", Acara17Page()),
            SizedBox(height: 15),

            menuButton(context, "ACARA 18 - Routing & Navigation", Acara18Home()),
            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 19 - Named Routing",
              Acara19Wrapper(),
            ),
            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 20 - BottomNav + Drawer",
              Acara20Main(),
            ),
            SizedBox(height: 15),

            // ACARA 21
            menuButton(
              context,
              "ACARA 21 - Gradient, PageView & Dropdown",
              Acara21Page(),
            ),

            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 22 - Gradient & PageView",
              Acara22Page(),
            ),
            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 23 - Popup Menu & Hero",
              Acara23Page(),
            ),
            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 25 & 26 - Form Flutter",
              FormPage(),
            ),

            SizedBox(height: 15),

            // acara27
            menuButton(
              context,
              "ACARA 27 - Form Input Lengkap",
              Acara27Page(),
            ),
            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 28 - Form Registrasi Modern",
              FormRegisterModern(),
            ),

            SizedBox(height: 15),


            menuButton(
              context,
              "ACARA 29, 30, 31 & 32 - GetX & GetStorage",
              Acara29Page(),
            ),

            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 33 & 34 - GET API REQRES",
              GetDataScreen(),
            ),

            SizedBox(height: 15),

            menuButton(
              context,
              "ACARA 35 - REST API MOVIE DB",
              MovieList(), // Memanggil class MovieList dari file yang Anda buat sebelumnya
            ),
            SizedBox(height: 15),


          ],
        ),
      ),
    );
  }

  // ================= WIDGET TOMBOL =================
  Widget menuButton(BuildContext context, String text, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(text),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}
