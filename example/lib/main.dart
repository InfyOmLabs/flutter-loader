import 'package:flutter/material.dart';
import 'package:show_loader_dialog/show_loader_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plugin Example"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CommonDialog.showLoader(true);
              Future.delayed(
                const Duration(seconds: 5),
                () {
                  CommonDialog.showLoader(false);
                },
              );
            },
            child: const Text("show loader")),
      ),
    );
  }
}
