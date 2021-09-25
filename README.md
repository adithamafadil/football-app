# football_app

A new Flutter project for Ruangguru Tech-home test
This project was developed using Flutter 2.5.1

## Getting Started
To run this project to your own device, you have to:
- Clone this repository
- Open it with your text editor/IDE
- You have to run `flutter pub get` on your CLI
- Make your own HeaderConfig to `/lib/data/config/header_config.dart`:
 ```dart
import 'package:injectable/injectable.dart';

abstract class HeaderConfig {
  late String header;
}

@LazySingleton(as: HeaderConfig)
class YourHeader implements HeaderConfig {
  @override
  String header = 'YOUR_X-AUTH-TOKEN_GOES_HERE';
}
 ```
- Then run `flutter pub run build_runner build --delete-conflicting-outputs` on your CLI
- Wait until the build_runner finish
- Run the project to your emulator or device

