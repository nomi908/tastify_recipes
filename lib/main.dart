import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/screens/recipe_main_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ],child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RecipeMainScreen(),
    );
  }
}
