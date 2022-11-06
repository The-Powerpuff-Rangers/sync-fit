import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_fit/pages/error_screen.dart';
import 'package:sync_fit/pages/home/home_page.dart';
import 'package:sync_fit/pages/login/screens/login_screen.dart';
import 'package:sync_fit/pages/splash/splash_screen.dart';
import 'package:sync_fit/providers/providers.dart';
import 'package:sync_fit/utils/routes.dart';
import 'package:sync_fit/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the secure shared preferences instance before launching the app
  const FlutterSecureStorage instance = FlutterSecureStorage();

  // Get the shared preferences instance before launching the app
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        secureStorageProvider.overrideWithValue(instance),
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const SyncFit(),
    ),
  );
}

class SyncFit extends ConsumerWidget {
  const SyncFit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Sync Fit',
      debugShowCheckedModeBanner: false,
      theme: SyncFitTheme.appTheme,
    );
  }
}

/// Auth Provider
///
/// Gets the current authenticated status. It fetches the [AppData]
/// from the Secured Shared preferences and checks if it is null or not.
/// If it is null, then the device wasn't registered at all.
/// In that case it will return false and will redirect your to register screen.
/// The [AppData] is encrypted and varies according to the platform being used
final authProvider = Provider<AsyncValue<bool>>((ref) {
  return ref.watch(futureTokensProvider).whenData((value) => value != null ? true : false);
});

class AuthChecker extends ConsumerWidget {
  static const routename = '/auth-checker';
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authChecker = ref.watch(authProvider);
    return authChecker.when(
      data: (data) {
        if (data) {
          return HomePage();
        }
        return const LoginScreen();
      },
      error: (error, stackTrace) {
        return ErrorScreen(error: error, stackTrace: stackTrace);
      },
      loading: () => const SplashScreen(),
    );
  }
}
