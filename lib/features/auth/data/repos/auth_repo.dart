import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  SupabaseClient supabase = Supabase.instance.client;

  Future<Either<String, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
