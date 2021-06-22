import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'title_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(TitleScreenRoot());
  });
}
