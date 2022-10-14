import 'package:cible_controlleur/constants/local_path.dart';
import 'package:flutter/material.dart';

backgroundDecoration() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('$imagesPath/fond.jpg'), fit: BoxFit.cover),
  );
}
