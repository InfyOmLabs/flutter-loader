import 'package:flutter/material.dart';
import 'package:show_loader_dialog/show_loader_dialog.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Flutter Loader Dialog"),
          centerTitle: true,
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
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Show Loader Dialog"),
          ),
        ),
      ),
    );
  }
}
