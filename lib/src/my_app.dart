import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/quiz_screen.dart';
import 'ui/screens/result_screen.dart';
import 'core/providers/app_provider.dart';
import 'core/providers/quiz_provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuizProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Dev Quiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
          QuizScreen.routeName: (context) => QuizScreen(),
          ResultScreen.routeName: (context) => ResultScreen(),
        },
      ),
    );
  }
}