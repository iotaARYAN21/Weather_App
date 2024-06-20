import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_weather_icons/flutter_weather_icons.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init fn called");
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Setstate fn called");
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   print("Widget destroyed");
  // }
  @override
  Widget build(BuildContext context) {  // setState fn reruns build widget only
    // we are retrieving the data here as wehave the context here
    // Map info = ModalRoute.of(context).settings.arguments;
    final Map<dynamic, dynamic>? info = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    String temp = info?['temp_val'].toString() ?? 'NA!' ;
    String wind = info?['air_val'] ?? "Loading";
    if(temp == "NA"){
      print("NA");
    }
    // else{
    //   temp = temp.substring(0,4);
    // }
    if(wind == "NA"){
      print("NA");
    }
    // else{
    //   // wind = wind.substring(0,4);
    // }
    String Icon_loc = info?['icon_url'] ?? 'Loading';
    if(Icon_loc == "NA"){
      Icon_loc = "//cdn.weatherapi.com/weather/64x64/day/116.png";
    }
    String city  = info?['city_val'] ?? "Loading";
    String humidity = info?['hum_val'] ?? "Loading";
    String desc = info?['des_val'] ?? "Loading";
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: [
                Container( // Container For Search Bar
                  // color: Colors.blue[200], => will lead to error when we assign the border radius of TextField
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin:const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                  decoration: BoxDecoration(
                    color:Colors.black12 ,
                    borderRadius: BorderRadius.circular(10)),
                    
                  child: Row(
                    children: [
                      // Icon(Icons.search), In Place of it we will use Gesture detector widget that will allow to give some role when it is pressed
                      GestureDetector(
                        onTap: (){
                          // print(searchController.text);
                          if(searchController.text == " " || searchController.text == ""){
                            print("Blank Search");
                          }
                          else{
                          Navigator.pushNamed(context, '/loading',arguments: {
                            "searchText":searchController.text,
                          });                          
                          }
                          },
                        child:const Icon(Icons.search),
                      ),
                        Expanded(child: TextField(
                        controller: searchController,
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Any City Name " ),
                      ))
                    ],
                  ),
                ),
                // Container
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin:const EdgeInsets.symmetric(horizontal: 17),
                        padding:const EdgeInsets.all(26),
                        child:  Row(
                          children: [
                            // SizedBox(width: 20,),
                              Column(
                              children: [
                                Text("Condition : $desc",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("In $city",style:const  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              margin:const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
                              padding:const EdgeInsets.all(26),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // icon
                                  const Row(children: [ Icon(FontAwesomeIcons.temperatureFull),Text("   Temperature")],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // ignore: unnecessary_string_interpolations
                                      Text("$temp",style:const  TextStyle(fontSize: 70),),
                                      const Text("°C",style: TextStyle(fontSize: 70),),
                                    ],
                                  )
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          // height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                margin:const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
                                padding:const EdgeInsets.all(26),
                                height: 200,
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(FontAwesomeIcons.wind),
                                        Text(" Wind Speed" ,),
                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$wind",style: TextStyle(fontSize: 40),),
                                        const Text(" m/sec",style: TextStyle(fontSize: 40),)
                                      ],
                                    ),
                                    
                                  ],
                                ),                    
                      ),
                    ),
                    Expanded(
                      child: Container(
                          // height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                margin:const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
                                padding:const EdgeInsets.all(26),
                                height: 200,
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(FontAwesomeIcons.tint),
                                        Text("    Humidity")
                                      ],
                                    ),
                                   const  SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$humidity",style: TextStyle(fontSize: 40),),
                                        const  Text(" %" , style: TextStyle(fontSize: 40),)
                                      ],
                                    ),
                                   
                                  ],
                                ),                    
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                const Text("As Per data From WeatherAPI.com"),
                const SizedBox(height: 37,),
              ],
            ),
          )),
      ),
    );
  }
}
