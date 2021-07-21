import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'presentation/widgets/widgets.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Activities',
        logWriterCallback: (text, {isError = false}) => print(text),
        defaultTransition: Transition.native,
        initialRoute: RouteName.main,
        transitionDuration: const Duration(milliseconds: 300),
        enableLog: true,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        getPages: CustomRouter.routes,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: CustomTheme.theme,
        supportedLocales: [
          const Locale('en', 'US'),
        ],
      ),
    );
  }
}
