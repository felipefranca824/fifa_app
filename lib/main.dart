import 'package:fifa_book_app/app/core/config/env/env.dart';
import 'package:flutter/material.dart';

import 'app/fwc_app.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const FwcApp());
}
