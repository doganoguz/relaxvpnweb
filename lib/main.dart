import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_vpn_admin/app_theme.dart';
import 'package:mighty_vpn_admin/screen/splash_screen.dart';
import 'package:mighty_vpn_admin/services/auth_services.dart';
import 'package:mighty_vpn_admin/services/server_services.dart';
import 'package:mighty_vpn_admin/services/user_services.dart';
import 'package:mighty_vpn_admin/store/app_store.dart';
import 'package:mighty_vpn_admin/utils/colors.dart';
import 'package:mighty_vpn_admin/utils/constants.dart';
import 'package:mighty_vpn_admin/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_strategy/url_strategy.dart';

AppStore appStore = AppStore();
FirebaseFirestore fireStore = FirebaseFirestore.instance;

AppImages appImages = AppImages();

UserService userService = UserService();
AuthService authService = AuthService();
ServerService serverService = ServerService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  await Firebase.initializeApp(
       options: FirebaseOptions(
      apiKey: "AIzaSyBxY_99iQagGfFQIAjI_ShSEhB6N4V0v5o",
      appId: "1:665284219108:web:e2b5e4afe74192f9e45cf1",
      messagingSenderId: "665284219108",
      projectId: "relaxvpnapp-58dca",
      storageBucket: "relaxvpnapp-58dca.appspot.com",
    ),
  ) ;


  defaultRadius = 16.0;
  defaultAppButtonRadius = 30.0;
  defaultLoaderAccentColorGlobal = primaryColor;
  appButtonBackgroundColorGlobal = appButtonColor;
  defaultAppButtonTextColorGlobal = primaryColor;
  passwordLengthGlobal = 1;

  await initialize();

  appStore.setLoggedIn(getBoolAsync(sharePrefKey.isLoggedIn));
  appStore.setFirstName(getStringAsync(sharePrefKey.firstName));
  appStore.setEmail(getStringAsync(sharePrefKey.email));
  appStore.setPhotoUrl(getStringAsync(sharePrefKey.photoUrl));
  appStore.setUid(getStringAsync(sharePrefKey.uid));
  appStore.setEmailLogin(getBoolAsync(sharePrefKey.isEmailLogin));
  appStore.setTester(getBoolAsync(sharePrefKey.isTester));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: SplashScreen(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
