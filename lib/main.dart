import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:udit_jharkhand/splash.dart';


final flutterWebViewPlugin = FlutterWebviewPlugin();

void main(){



  runApp(MaterialApp(
      home: Splash(),
  ));



}


Widget widget = WebviewScaffold(
  url: 'https://www.uditjharkhand.com',
  debuggingEnabled: true,
  initialChild: Center(child: CircularProgressIndicator(),),
  withJavascript: true,
  withZoom: true,


);

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //OneSignal.shared.promptUserForPushNotificationPermission();

    OneSignal.shared.init(
      "4c36ab5f-ed3f-41f7-aa79-9021fa9b7b6c",

    );
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

    OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
      print(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red
      ),

    home: SafeArea(
      child: widget,
    ),


    );
  }
}
