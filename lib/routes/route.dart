// ignore_for_file: prefer_const_constructors

part of 'page.dart';

class AppRoutes {
  // ignore: constant_identifier_names
  static const INITIAL = AppPages.HOME;

  static final pages = [
    GetPage(
      name: _Paths.HOME,
      page: () => BottomNavigasion(),
      binding: NavigationBinding(),
    ),
  ];
}
