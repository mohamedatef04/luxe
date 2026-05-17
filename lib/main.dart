import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxe/core/cubits/languge_toggle_cubit.dart';
import 'package:luxe/core/cubits/theme_toggle_cubit.dart';
import 'package:luxe/core/di/get_it_.dart';
import 'package:luxe/core/services/shared_pref_service.dart';
import 'package:luxe/generated/l10n.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceService.initSharedPref();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  setupLocator();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeToggleCubit(),
            ),
            BlocProvider(
              create: (context) => LanguageToggleCubit(),
            ),
          ],
          child: BlocBuilder<ThemeToggleCubit, ThemeData>(
            builder: (context, theme) {
              return BlocBuilder<LanguageToggleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: theme,

                    initialRoute: Routes.splash,
                    onGenerateRoute: AppRouter.generateRoute,

                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: locale,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
