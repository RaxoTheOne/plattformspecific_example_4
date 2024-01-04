import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform-specific Dialogs'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showPlatformDialog(context);
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }

  void _showPlatformDialog(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Cupertino Design für iOS
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('iOS Dialog'),
            content: const Text('This is a Cupertino-style dialog.'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Material Design für andere Plattformen (Android)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Android Dialog'),
            content: const Text('This is a Material-style dialog.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }
}
