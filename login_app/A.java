import 'package:flutter/material.dart';
void main() {
 runApp(const LoginApp());
}
class LoginApp extends StatelessWidget {
 const LoginApp({super.key});
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Application de Connexion',
 theme: ThemeData(
 colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
 useMaterial3: true,
 ),
 home: const LoginScreen(title: 'Page de Connexion'),
 debugShowCheckedModeBanner: false,
 );
 }
}