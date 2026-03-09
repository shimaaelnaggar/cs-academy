import 'package:cs_academy/core/routing/app_router.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/services/supabase_services.dart';
import 'package:cs_academy/features/home/presentation/views/home.dart';
import 'package:cs_academy/features/layout/presentation/views/layout_bottom_nav_bar_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.initSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CS Academy',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // initialRoute: Routes.splash,
      home: Home(),
      // onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
