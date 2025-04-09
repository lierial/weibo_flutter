import 'package:bot_toast/bot_toast.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Views/LoginViews/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'App/Routes.dart';

void main() {
  UserViewModel userViewModel = UserViewModel();
  runApp(ChangeNotifierProvider<UserViewModel>.value(
      value: userViewModel,
      builder: (context,child){
        return const MyApp();
      }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      navigatorKey: Routes.navigatorKey,
      onGenerateRoute: Routes.generatePage,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 14),
          displayMedium: TextStyle(fontSize: 12),
          displaySmall: TextStyle(fontSize: 10),
          labelLarge: TextStyle(fontSize: 14),
          labelMedium: TextStyle(fontSize: 12),
          labelSmall: TextStyle(fontSize: 10),
          headlineLarge: TextStyle(fontSize: 14),
          headlineMedium: TextStyle(fontSize: 12),
          headlineSmall: TextStyle(fontSize: 10),
          titleLarge: TextStyle(fontSize: 14),
          titleMedium: TextStyle(fontSize: 12),
          titleSmall: TextStyle(fontSize: 10),
          bodyLarge: TextStyle(fontSize: 14),
          bodyMedium: TextStyle(fontSize: 12),
          bodySmall: TextStyle(fontSize: 10)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 32
        )
      ),
      home: LoginView(),
    );
  }
}
