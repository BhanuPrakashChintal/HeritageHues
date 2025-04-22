import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://faogvlojjhurzeeudvom.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZhb2d2bG9qamh1cnplZXVkdm9tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUyOTUxNTQsImV4cCI6MjA2MDg3MTE1NH0.dK9gj2ck8u6m0DuPyuu0taPGYl06M50pPK1kNSc8sgE';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        headers: {
          'X-Client-Info': 'flutterflow',
        },
        anonKey: _kSupabaseAnonKey,
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
