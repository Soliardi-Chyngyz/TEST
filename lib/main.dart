import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test/ui/screens/auth/auth_page.dart';
import 'package:test/ui/screens/auth/bloc/bloc_auth.dart';
import 'package:test/ui/screens/details/ski_detail_page.dart';
import 'package:test/ui/screens/ski/bloc/bloc_ski.dart';
import 'package:test/ui/screens/ski/ski_page.dart';

import 'configs/di/injector.dart';
import 'configs/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  await initializeDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<BlocAuth>(create: (_) => injector.get()),
    BlocProvider<BlocSki>(create: (_) => injector.get()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test task',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AuthPage(),
      routes: {
        SkiListPage.routeName: (ctx) => const SkiListPage(),
        SkiDetailPage.routeName: (ctx) => const SkiDetailPage(),
      },
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en'), Locale('ru', 'RU')],
    );
  }
}