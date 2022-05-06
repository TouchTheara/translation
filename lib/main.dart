import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testingtranslation/controller/app_controller.dart';

import 'translations/codegen_loader.g.dart';
import 'translations/locale_keys.g.dart';
import 'package:get/get.dart' hide Trans;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [
        Locale('en'),
        Locale('km'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AppController());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(LocaleKeys.appBar.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LocaleKeys.hello.tr(),
            ),
            Text(
              LocaleKeys.name.tr(),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.indigo),
                  onPressed: () async {
                    await context.setLocale(const Locale('en'));
                  },
                  child: const Text(
                    "English",
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.indigo),
                  onPressed: () async {
                    await context.setLocale(const Locale('km'));
                  },
                  child: const Text(
                    "ខ្មែរ",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
