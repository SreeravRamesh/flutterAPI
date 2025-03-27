import 'package:api/UsingGet/GetUsingTheme/themeController.dart';
import 'package:api/UsingGet/GetUsingTheme/themeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme:  CustomTheme.lightTheme,
    darkTheme: CustomTheme.darkTheme,
    themeMode: ThemeMode.system,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Obx(
            () => Text(_controller.currentTheme.value == ThemeMode.dark
            ? "Dark Theme"
            : "Light Theme"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tap on the switch to change the Theme",
              style: TextStyle(fontSize: size.height * 0.02),
            ),
            Obx(
                () => Switch(
                    value: _controller.currentTheme.value == ThemeMode.dark,
                    onChanged: (value){
                      _controller.switchTheme();
                      Get.changeThemeMode(_controller.currentTheme.value);
                    },
                  activeColor: CustomTheme.white,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
