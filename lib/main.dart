import 'package:cs_academy/core/routing/app_router.dart';
import 'package:cs_academy/core/routing/routes.dart';
import 'package:cs_academy/core/services/supabase_services.dart';
import 'package:cs_academy/core/widgets/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.initSupabase();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CS Academy',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: Routes.signUp,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
