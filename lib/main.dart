import 'package:flutter/material.dart';
import 'package:game_news/app/app_widget.dart';
import 'package:game_news/app/util/inject/inject_dependecies.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  InjectDependecies.init();
  runApp(const AppWidget());
}
