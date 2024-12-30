import 'package:flutter/material.dart';
import 'package:quick_social/pages/user_list_page.dart';
import 'package:quick_social/pages/post_list_page.dart';
import 'package:quick_social/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/users': (context) => const UserListPage(),
        '/posts': (context) => const PostListPage(),
      },
    );
  }
}
