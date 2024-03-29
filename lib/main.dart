import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_nadetdev_blog/home_page.dart';
import 'constants.dart' as app_constants;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('lemans_blog');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 180, 247),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              app_constants.loginPageHeaderFirstTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              app_constants.loginPageHeaderSecondTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(app_constants.loginPageImagePath,
                height: 350, width: 350),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const HomePage();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue.shade600,
                minimumSize: const Size(300, 40),
              ),
              child: const Text(
                app_constants.loginPageButtonLoginLabel,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade200,
                foregroundColor: Colors.white,
                minimumSize: const Size(300, 40),
              ),
              child: const Text(
                app_constants.loginPageButtonRegisterLabel,
                style: TextStyle(fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
