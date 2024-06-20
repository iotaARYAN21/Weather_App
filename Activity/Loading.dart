import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Worker.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String? temp = "Loading";

  String? temp;
  String? hum;
  String? air;
  String? des;
  String? icon;
  String loc = "Varanasi" ;
  bool isInitialized = false;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  final Map<dynamic, dynamic>? search = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
        if(search?.isNotEmpty ?? false){
      loc = search!['searchText'];
    }
    if(!isInitialized){
      startApp(loc);
      isInitialized = true;
    }
  }
  void startApp(String loc) async{
    worker instance = worker(location : loc);
   await instance.getData();
    // print(instance.description);
    temp = instance.temp;
    hum = instance.humidity;
    air = instance.airSpeed;
    des = instance.description;
    icon = instance.icon;
    // print(icon);
    // THROWING ALL THESE VALUES TO THE HOME PAGE

    // to show the loading page for sometime
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,'/home',arguments:{
      "temp_val":temp,
      "hum_val":hum,
      "air_val":air,
      "des_val":des,
      "icon_url":icon,
      "city_val":loc,
    }); 
    });
 //using pushNamed we have option to go back to Loading which we dont want so we use pushReplacementNamed
      // pushReplacementNamed => deletes the peevious route
      // arguments parameter take dictionary or map
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // startApp(loc);  // If we call setApp here then only name of location changes not the temp ,etc so call after the loc value is changed
  // }
  @override
  Widget build(BuildContext context) {
    // final Map<dynamic, dynamic>? search = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    // loc = search?['searchText'] ?? "Loading";
    
    // if(search?.isNotEmpty ?? false){
    //   loc = search!['searchText'];
    // }
    // startApp(loc);
    return const  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset("weatherlogo.png"),
            SizedBox(height: 20,),
            Text("Weather App",style: TextStyle(fontSize:30 ,fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            SpinKitWave(
          color: Color.fromARGB(255, 239, 150, 54),
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
