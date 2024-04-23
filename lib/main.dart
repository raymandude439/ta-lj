import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tugas_akhir_lj/core/routes/router.dart';
import 'package:tugas_akhir_lj/core/utils/remove_focus_node.dart';
import 'package:tugas_akhir_lj/core/utils/ui_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
   ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: Size(
        UIHelper.getCurrentDeviceType(context) == DeviceType.mobile
            ? 390
            : MediaQuery.sizeOf(context).width,
        UIHelper.getCurrentDeviceType(context) == DeviceType.mobile
            ? 844
            : MediaQuery.sizeOf(context).height,
      ),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () => removeFocusNode(context),
        child: MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
            primaryColor: Color(0xff02577A),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.white,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.light,
            fontFamily: 'Sf-Pro',
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: Platform.isIOS
                  ? const CupertinoScrollBehavior()
                  : const MaterialScrollBehavior().copyWith(overscroll: false),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
