import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';

class AppProvider with ChangeNotifier {
  final _box = Hive.box(QUIZ_BOX);


  static of(BuildContext context, {bool listen: true}) {
    return Provider.of<AppProvider>(context, listen: listen);
  }
}