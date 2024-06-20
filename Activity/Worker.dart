import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class worker
{

  String? location;

  //Constructor

  worker({this.location})
  {
    location = this.location;
  }


  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? icon;

  
  //method =
  Future<void> getData() async
  {
    try{
    final response  =await http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=dabf4a57e1ff444bace135041241506&q=$location&aqi=no"));
    if(response.statusCode == 200){
          Map data = jsonDecode(response.body);

    //Getting Temp,Humidiy
    location = data['location']['name'];
    Map temp_data = data['current'];
    temp = temp_data['temp_c'].toString();
     humidity = temp_data['humidity'].toString();
    // double getTemp = temp_data['temp'];

//Getting air_speed
    // Map wind = data['wind'];
    airSpeed = temp_data['wind_mph'].toString();
    // double getAir_speed = wind["speed"];
    Map getdesc  = temp_data['condition'];
    icon  = getdesc['icon'];
    description = getdesc['text'];
    }
    // else{

    // }

    }
    catch(e){
      print(e);
      temp = "NA";
      humidity = "NA";
      description = "NA";
      airSpeed = "NA";
      icon = "https://openweathermap.org/img/wn/03d@2x.png";
    }
  }


}
