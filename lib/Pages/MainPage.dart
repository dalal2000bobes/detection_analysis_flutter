import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'BloodPage.dart';
import 'BonePage.dart';
import 'DiabatesPage.dart';
import 'HormonePage.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {




  List<String> imag = [
    "assets/img/h.jpg",
    "assets/img/11.PNG",
    "assets/img/2.jpg",
    "assets/img/d.jpg",
    "assets/img/bl.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
     backgroundColor: Colors.blueGrey,
      brightness: Brightness.light,
      leading: Text(""),
      //elevation: 0,
      title:
        Text(" Modern Laboratory", style: TextStyle(color:Colors.white ,fontSize: 30,fontWeight: FontWeight.bold),),
    ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/img/doctor.PNG",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(
               // left:100,
            //  bottom: 180,
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  CarouselSlider(
                    items: [
                      for (int i = 0; i < imag.length; i++)
                        Container(
                          // width: 50,
                          margin: EdgeInsets.only(
                              top: 2.0,  left: 6.0, right: 6.0, bottom: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: new AssetImage(imag[i]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                    //Slider Container properties
                    options: CarouselOptions(
                      height: 220.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      var url = Uri.parse(
                          'http://192.168.56.1:5000/get/message');
                      var response = await http.post(
                        url,
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: convert.jsonEncode(
                            {
                              "message"  : "باي"
                            }
                        ),
                      );
                      var jsonResponse = convert.jsonDecode(response.body);
                      print("dalal maleeeeeeeet : ${jsonResponse}");
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return DiabatesPage();
                      //     });
                    },
                    height: 50,
                    minWidth: 200,
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Diabetes Laboratory',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BonePage();
                          });
                    },
                    height: 50,
                    minWidth: 210,
                    color: Colors.blueGrey,
                    child: Text(
                      'Bone Laboratory',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {

                      Navigator.push(context,MaterialPageRoute(builder: ( context) =>  BloodPage() ));
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return BloodPage();
                      //     });
                    },
                    height: 50,
                    minWidth: 210,
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Blood Laboratory',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: ()
                    {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return HormonePage();
                          });

                    },
                    height: 50,
                    minWidth: 210,
                    color: Colors.blueGrey,
                    child: Text(
                      'Hormone Laboratory',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
