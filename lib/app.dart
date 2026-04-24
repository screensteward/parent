import 'package:flutter/material.dart';

class ScreenStewardParentApp extends StatelessWidget {
  const ScreenStewardParentApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'ScreenSteward (parent)',
    theme: ThemeData(useMaterial3: true),
    home: const Scaffold(body: Center(child: Text('App parent — Phase 1'))),
  );
}
