import 'package:flutter/material.dart';
import 'package:pedra_papel_tesoura/pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Pedra, papel e tesoura",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Minecraftia'),
    home: HomePage(),
  ));
}
