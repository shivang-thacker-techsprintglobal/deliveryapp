import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'blocs/auth/auth_cubit.dart';
import 'blocs/cart/cart_cubit.dart';
import 'blocs/menu/menu_cubit.dart';
import 'blocs/favorites/favorites_cubit.dart';
import 'blocs/orders/orders_cubit.dart';
import 'blocs/settings/settings_cubit.dart';
import 'screens/splash_screen.dart';

void main() async {
  // 1. Initialize bindings immediately
  WidgetsFlutterBinding.ensureInitialized();

  // Keep system nav/status bars reserved so bottom buttons are not covered.
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  // 2. Start Firebase initialization in parallel (non-blocking)
  final Future<FirebaseApp> firebaseInit = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthService())),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => MenuCubit()),
        BlocProvider(create: (_) => FavoritesCubit()),
        BlocProvider(create: (_) => OrdersCubit()),
        BlocProvider(create: (_) => SettingsCubit()),
      ],
      child: MyApp(firebaseInit: firebaseInit),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp>? firebaseInit;
  
  const MyApp({super.key, this.firebaseInit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Sushi App',
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          locale: state.locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          theme: ThemeData(
            primaryColor: const Color(0xFFF4A73D),
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: const Color(0xFFF4A73D),
            scaffoldBackgroundColor: const Color(0xFF121212),
          ),
          // Apply system bottom inset globally (Android gesture / 3-button nav).
          builder: (context, child) {
            final media = MediaQuery.of(context);
            final bottomInset = media.viewPadding.bottom;
            return MediaQuery(
              data: media.copyWith(
                padding: media.padding.copyWith(
                  bottom: media.padding.bottom > 0
                      ? media.padding.bottom
                      : bottomInset,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: media.padding.bottom > 0 ? 0 : bottomInset,
                ),
                child: child ?? const SizedBox.shrink(),
              ),
            );
          },
          home: SplashScreen(firebaseInit: firebaseInit),
        );
      },
    );
  }
}
