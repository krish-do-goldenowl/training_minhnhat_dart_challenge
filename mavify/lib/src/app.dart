import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mavify/src/features/account/logic/account_bloc.dart';
import 'package:mavify/src/features/settings/logic/setting_bloc.dart';
import 'package:mavify/src/router/router.dart';
import 'package:mavify/src/theme/screen.dart';
import 'package:mavify/src/theme/themes.dart';
import 'package:mavify/src/localization/localization_utils.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = GetIt.I<AppRouter>();
  @override
  Widget build(BuildContext context) {
    AppScreens.mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
        BlocProvider(create: (_) => GetIt.I<AccountBloc>()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              S.of(context).common_appTitle,
          builder: BotToastInit(),
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: state.themeMode,
          routerConfig: _appRouter.router,
        );
      }),
    );
  }
}
