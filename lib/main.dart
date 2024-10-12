import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/app_router.dart';
import 'theme/booklog_colors.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        routerConfig: ref.watch(appRouterProvider).router,
        title: 'Booklog',
        theme: ThemeData(
          fontFamily: 'SUIT',
          scaffoldBackgroundColor: BooklogColors.main,
          appBarTheme: const AppBarTheme(
            backgroundColor: BooklogColors.main,
            toolbarHeight: 48,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: BooklogColors.main,
                width: 1.5,
              ),
            ),
          ),
        ),
      );
}
