import 'package:crud_api/Screen/ProductCreateScreen.dart';
import 'package:crud_api/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Crud App",
      home: ProductGridViewScreen(),
    );
  }
}
