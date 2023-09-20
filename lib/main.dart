import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/componen/tournament/provider_tournament.dart';
import 'package:provider/provider.dart';

import 'package:mobile/routes/page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TournamentDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.pages,
      theme: ThemeData.light(),
      defaultTransition: Transition.cupertino,
    );
  }
}
