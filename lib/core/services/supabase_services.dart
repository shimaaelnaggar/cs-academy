import 'package:supabase_flutter/supabase_flutter.dart';
class SupabaseServices{
  static const String supabaseUrl = 'https://jfiswhdpwlhxkgfhvryl.supabase.co';
  static const String supabaseKey = 'sb_publishable_Qsj7qLcUOQP8l-sviBuVmg_UhCp38hP';

  static Future<void> initSupabase() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }
}