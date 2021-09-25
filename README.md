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

## Important Notes (Issues)
- Championship image for [Huddersfield Town AFC Image](https://crests.football-data.org/394.svg) that got `Bad state: Expected to find Drawable with id none.` This caused [Blackpool FC Image](https://crests.football-data.org/336.svg) will be not loaded for the first time. But when you back to the detail, the [Blackpool FC Image](https://crests.football-data.org/336.svg) will be loaded well

Refs issues: [#549](https://github.com/dnfield/flutter_svg/issues/549), [#102](https://github.com/dnfield/flutter_svg/issues/102), and [#564](https://github.com/dnfield/flutter_svg/issues/564)

- Ligue 1 images for [FC Lorient](https://crests.football-data.org/525.svg) and [AS Saint-Étienne](https://crests.football-data.org/527.svg) cannot be rendered because failed to find definition for url(#pattern).

Ref issues: [#329](https://github.com/dnfield/flutter_svg/issues/329) and [#289](https://github.com/dnfield/flutter_svg/issues/289)