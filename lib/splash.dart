import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'main.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4),()=>checkInternet()//Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Myapp()),(Route<dynamic> route)=>false)
    );

  }

  void checkInternet() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return MyApp();}));

    } else {
      // I am connected to a wifi network.
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotConnected()));
    }





//    try {
//
//      var connectivityResult = await (Connectivity().checkConnectivity());
//      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
//        // I am connected to a mobile network.
//      } else if (connectivityResult == ConnectivityResult.wifi) {
//        // I am connected to a wifi network.
//      }
//
//
//      final result = await InternetAddress.lookup('google.com');
//      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        print('connected');
//
//
//        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){
//
//          return MyApp();}));
//      }
//    } on SocketException catch (_) {
//      print('not connected');
//      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => NotConnected()));
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.white),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('images/logo.gif')),

              ],
            ),
          )
        ],
      ),
    );
  }
}


class NotConnected extends StatelessWidget{





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Container(padding:const EdgeInsets.symmetric(horizontal: 10.0),child: new Text("Oops! There is no Internet Connection!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,)),
              Padding(padding: const EdgeInsets.all(10.0),),
              Image(image: new AssetImage("images/nointenet.gif"),),
              new RaisedButton(onPressed: () async {
                var connectivityResult = await (Connectivity().checkConnectivity());
                if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
                  // I am connected to a mobile network.
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context){return MyApp();}));

                } else {
                  // I am connected to a wifi network.
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => NotConnected()));
                }
                },
                  child: Text("Try Again",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                  color: Colors.red)
            ],
          ),
        ),
      ),
    );
  }
}