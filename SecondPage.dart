import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SecondPage extends StatelessWidget {
   SecondPage({super.key});
  // var location ;

  Future<void> fetchWeatherData() async {
    // final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=dabf4a57e1ff444bace135041241506&q=Varanasi&aqi=no'));
    try {
      var response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=dabf4a57e1ff444bace135041241506&q=Varanasi&aqi=no'));
      // print(response.body);
      var result = json.decode(response.body);
      print(result);
    } catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchWeatherData();
    return Scaffold(
      appBar:AppBar(
        title:const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child:const  Text("Back to First page")),
      ),
    );
  }
}


