import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/manager.provider.dart';
import 'screens/home.screen.dart';
import 'screens/start.screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManagerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        initialRoute: '/start-screen',
        routes: {
          '/start-screen': (context) => const StartScreen(),
          '/home-screen': (context) => const HomeScreen(),
        },
      ),
    ),
  );
}
