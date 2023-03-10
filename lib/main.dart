import 'package:flutter/material.dart';

import 'package:starter/ui/app.dart';
import 'package:starter/ui/styles/themes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:on_screen_ruler/on_screen_ruler.dart';
import 'package:starter/ui/router/route_generator.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:starter/ui/screens/onboarding/onboarding_screen.dart';

import 'package:starter/logic/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starter/logic/cubit/settings/setting_cubit.dart';
import 'package:starter/logic/cubit/navigation/navigation_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // HydratedBloc.storage.clear();

  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingCubit>(create: (_) => SettingCubit()),
        BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (BuildContext context, SettingState state) {
          return MaterialApp(
            builder: (context, child) {
              return OnScreenRulerWidget(
                gridSize: 29.4,
                gridColor: Colors.red.withOpacity(0.05),
                activateBgColor: Colors.transparent,
                activateIcon: null,
                // show: true,
                child: ResponsiveWrapper.builder(
                  ClampingScrollWrapper.builder(context, child!),
                  maxWidth: 1400,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(480, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                  ],
                ),
              );
            },
            home: state.onboarding ? const OnboardingScreen() : const App(),
            initialRoute: '/',
            title: 'PersianSDA Starter',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            supportedLocales: L10n.all,
            locale: Locale(state.locale),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoutes,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
