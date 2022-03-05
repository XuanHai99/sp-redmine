import 'package:apphainguyen/language/translation_service.dart';
import 'package:apphainguyen/page/dashboard/binding/dashboard_binding.dart';
import 'package:apphainguyen/page/splash/controller/splash_controller.dart';
import 'package:apphainguyen/page/splash/presentation/splash_view.dart';
import 'package:apphainguyen/routes/app_page.dart';
import 'package:apphainguyen/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  putSplashController();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.bottom,SystemUiOverlay.top]);
  runApp(MyApp());
}

void putSplashController(){
  Get.lazyPut<SplashController>(() => SplashController());
}
class MyApp extends GetWidget<SplashController>{
  const MyApp({Key? key}) : super (key:key);
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading){
        return const MaterialApp(debugShowCheckedModeBanner: false,home: SplashView());
      }else{
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          initialRoute: (controller.isAuthenticated) ? Routes.dashboard : Routes.login,
          getPages: AppPage.routes,
          initialBinding: (controller.isAuthenticated)?DashboardBinding() : null,
          theme: CustomTheme.customTheme,
          translations: TranslationService(),
          locale: Locale('en','US'),
          fallbackLocale: TranslationService.fallbackLocale,
        );
      }
    });
  }
}
