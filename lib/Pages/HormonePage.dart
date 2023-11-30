import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HormonePage extends StatefulWidget {
  const HormonePage({Key? key}) : super(key: key);

  @override
  __HormonePageState createState() => __HormonePageState();
}

class __HormonePageState extends State<HormonePage> {
  double FT4 = 0.0;
  double TSH = 0.0;
  double kls = 0.0;
  double PRL = 0.0;
  double IGF = 0.0;
  double ADH = 0.0;
  int gender = 0;
  String type = "Female";
  bool woman = true;
  bool child = false;
  bool err = false;
  bool done = false;
  List<dynamic> finalResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        //padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/img/doctor.PNG",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            ListView(
              children: <Widget>[
                Image.asset(
                  "assets/img/h1.PNG",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 240,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Switch(
                        value: woman,
                        onChanged: (value) {
                          setState(() {
                            woman = value;
                            print("woman :" + woman.toString());
                          });
                        },
                        activeColor: Colors.lightBlueAccent.shade100,
                        activeTrackColor: Colors.white70,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Children",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Switch(
                        value: child,
                        onChanged: (value) {
                          setState(() {
                            child = value;
                            print("children :" + child.toString());
                          });
                        },
                        activeColor: Colors.lightBlueAccent.shade100,
                        activeTrackColor: Colors.white70,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          FT4 = 0.0;
                        } else {
                          FT4 = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: ' FT4',
                      labelText: ' FT4',
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          TSH = 0.0;
                        } else {
                          TSH = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: ' TSH',
                      labelText: ' TSH',
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          kls = 0.0;
                        } else {
                          kls = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'kls',
                      labelText: 'kls',
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          PRL = 0.0;
                        } else {
                          PRL = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'PRL',
                      labelText: 'PRL',
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          IGF = 0.0;
                        } else {
                          IGF = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'IGF',
                      labelText: 'IGF',
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),

                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        if (text.isEmpty) {
                          ADH = 0.0;
                        } else {
                          ADH = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: ' ADH',
                      labelText: ' ADH',
                    ),
                  ),
                ),
                if (err || done)
                  SizedBox(
                    height: 10,
                  ),
                if (err)
                  Center(
                    child: Text(
                      'Please Enter all Value ....',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (done)
                  for(int i=0;i<finalResult.length;i++)
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Center(
                        child: Text(
                          finalResult[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                if (err || done)
                  SizedBox(
                    height: 10,
                  ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 50,
                    left: 50,
                  ),
                  child: MaterialButton(
                    onPressed: () async{
                      if ((ADH == 0.0) ||
                          (FT4 == 0.0) ||
                          (TSH == 0.0) ||
                          (PRL == 0.0) ||
                          (IGF == 0.0) ||
                          (kls == 0.0)) {
                        setState(() {
                          err = true;
                          done = false;
                        });
                      } else if ((kls != 0.0) &&
                          (PRL != 0.0) &&
                          (TSH != 0.0) &&
                          (FT4 != 0.0) &&
                          (IGF != 0.0) &&
                          (kls != 0.0)) {
                        if (child) {
                          type = "Children";
                        } else if (woman) {
                          type = "Female";
                        } else {
                          type = "Male";
                        }
                        var url = Uri.parse(
                            'https://flask-detection-analysis.herokuapp.com/hormones');
                        http.Response response = await http.post(
                          url,
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: convert.jsonEncode({
                            "IGF":IGF,
                            "FT4":FT4,
                            "ADH":ADH,
                            "TSH":TSH,
                            "PRL":PRL,
                            "KLS":kls,
                            "type":type
                          }),
                        );
                        if (response.statusCode == 200) {
                          var jsonResponse = convert.jsonDecode(response.body)
                              as Map<String, dynamic>;
                          setState(() {
                            done = true;
                            err = false;
                            finalResult = jsonResponse['result'];
                          });
                          print(finalResult);
                        }
                      }
                    },
                    color: Colors.lightBlueAccent,
                    textColor: Colors.black,
                    child: Text(
                      'Test',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
