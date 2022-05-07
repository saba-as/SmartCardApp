import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartcardapp/views/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: const Locale("ar"),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: 'bahij',
          appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          ),
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.grey[200],
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
            headline2: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
            bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
            ),
          ),
        ),
        home: const Home(),
      ),
    );
  }
}
