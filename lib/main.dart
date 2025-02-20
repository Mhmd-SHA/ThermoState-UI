import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thermostate_ui/pages/home_page.dart';

import 'pages/arc_painter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      useInheritedMediaQuery: true,
      minTextAdapt: false,
      splitScreenMode: false,
      builder:
          (_, child) => MaterialApp(
            title: "ThermoState UI",
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            builder:
                (_, child) => MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(1)),
                  child: child!,
                ),
            home: HomePage(),
            // home: ArcPainterPage(),
          ),
    );
  }
}
