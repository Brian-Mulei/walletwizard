import 'package:flutter/material.dart';
import 'package:walletwizard/views/auth/login.dart';
import 'package:walletwizard/views/categories/categories_home.dart';
import 'package:walletwizard/views/home/home_screen.dart';
import 'package:walletwizard/views/transactions/transaction_home.dart';
import 'package:walletwizard/widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Wizard',
      theme: ThemeData(
        colorScheme: lightThemeColors(context)
       ),
      darkTheme: ThemeData(

        colorScheme: darkThemeColors(context)
       ),
      debugShowCheckedModeBanner: false,
      initialRoute:  'login',
      routes: {
        '/' : (context) => const HomeScreen(),
        'login' : (context) =>const LoginPage(),
        'Category':(context) => const Categories(),
        'Expense':(context) => const Transactions()
      },
    );
  }
}
