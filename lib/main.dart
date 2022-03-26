import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_enhancer_app/common/service/custom_dialogs.dart';
import 'package:school_enhancer_app/common/ui/widgets/chart_widget.dart';
import 'package:school_enhancer_app/common/ui/widgets/setup_snackbar_ui.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import 'common/service/custom_bottom_sheets.dart';
import 'common/ui/ui_helper.dart';
import 'core/cache/local_cache_service.dart';
import 'features/splash_page/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  setupSnackbarUi();
  setupBottomSheetUi();
  setupDialogUi();

  LocalCacheService.preferences = await SharedPreferences.getInstance();
//  initializeDateFormatting();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFF763535),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.05),
        ),
      ),
      home: SplashPage(),
    ),
  );
}

class AnimatedChartWidget extends StatefulWidget {
  @override
  _AnimatedChartWidgetState createState() => _AnimatedChartWidgetState();
}

class _AnimatedChartWidgetState extends State<AnimatedChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1200),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, dynamic value, child) {
            return Container(
              padding: mPagePadding,
              height: 300,
              child: ChartWidget.sampleData(value),
            );
          },
        ),
      ),
    );
  }
}
