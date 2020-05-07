[![style: effective dart][https://img.shields.io/badge/style-effective_dart-40c4ff.svg]](https://github.com/tenhobi/effective_dart)
[![Flutter Responsive](https://img.shields.io/badge/flutter-responsive-brightgreen.svg?style=flat-square)](https://github.com/Codelessly/ResponsiveFramework)

# project_sample_base

&#x27;A new Flutter project. Created by Slidy&#x27;

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

https://material.io/design/typography/the-type-system.html#type-scale

Shift + Alt + O  ->  Organize imports

https://medium.com/flutterando/qual-a-forma-f%C3%A1cil-de-traduzir-seu-app-flutter-para-outros-idiomas-ab5178cf0336
https://pub.dev/packages/i18n_extension#-readme-tab-
https://medium.com/flutter-community/handling-network-calls-like-a-pro-in-flutter-31bd30c86be1
https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
https://medium.com/flutter-community/handling-flutter-errors-with-catcher-efce74397862
https://medium.com/flutter-community/flutter-2019-real-splash-screens-tutorial-16078660c7a1
https://iiro.dev/2018/03/02/separating-build-environments/

*Sempre divida os widgets em arquivos, e não em métodos dentro do widget*
https://iiro.dev/2018/12/11/splitting-widgets-to-methods-performance-antipattern/
https://iiro.dev/2018/06/18/putting-build-methods-on-a-diet/
Exemplo: https://github.com/roughike/inKino/blob/development/mobile/lib/ui/event_details/event_backdrop_photo.dart


WidgetTesting: https://iiro.dev/2018/08/22/writing-widget-tests-for-navigation-events/


#### Running each flavor on DEBUG mode:<br>
`flutter run –-flavor qa -t lib/main_qa.dart`<br>
`flutter run –-flavor dev -t lib/main_dev.dart`<br>
`flutter run –-flavor prod -t lib/main_production.dart`<br>
#### Running each flavor on PROFILE mode:<br>
`flutter run -–profile –-flavor qa -t lib/main_qa.dart`<br>
`flutter run -–profile –-flavor dev -t lib/main_dev.dart`<br>
`flutter run -–profile –-flavor prod -t lib/main_production.dart`<br>
#### Running each flavor on RELEASE mode:<br>
`flutter run -–release –-flavor qa -t lib/main_qa.dart`<br>
`flutter run -–release –-flavor dev -t lib/main_dev.dart`<br>
`flutter run -–release –-flavor prod -t lib/main_production.dart`<br>

*Sometimes between changing flavors is necessary a flutter clean to clean our app build files.*

#### Mobx:<br>
`flutter pub run build_runner watch --delete-conflicting-outputs`