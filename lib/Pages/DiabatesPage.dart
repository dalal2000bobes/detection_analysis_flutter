import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DiabatesPage extends StatefulWidget {
  const DiabatesPage({Key? key}) : super(key: key);

  @override
  _DiabatesPageState createState() => _DiabatesPageState();
}

class _DiabatesPageState extends State<DiabatesPage> {
  double Ph = 0.0;
  double PaO2 = 0.0;
  double HCO3 = 0.0;
  double PCO2 = 0.0;
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
                  "assets/img/d.jpg",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 220,
                ),
                SizedBox(
                  height: 25,
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
                          PaO2 = 0.0;
                        } else {
                          PaO2 = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'PaO2',
                      labelText: 'PaO2',
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
                          Ph = 0.0;
                        } else {
                          Ph = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: ' Ph',
                      labelText: ' Ph',
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
                          PCO2 = 0.0;
                        } else {
                          PCO2 = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'PCO2 ',
                      labelText: 'PCO2 ',
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
                          HCO3 = 0.0;
                        } else {
                          HCO3 = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: ' HCO3 ',
                      labelText: ' HCO3 ',
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
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (done)
                  for (int i = 0; i < finalResult.length; i++)
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                        child: Text(
                          finalResult[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.indigo,
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
                    onPressed: () async {
                      if ((PCO2 == 0.0) ||
                          (HCO3 == 0.0) ||
                          (PaO2 == 0.0) ||
                          (Ph == 0.0)) {
                        setState(() {
                          err = true;
                          done = false;
                        });
                      } else if ((Ph != 0.0) &&
                          (PCO2 != 0.0) &&
                          (HCO3 != 0.0) &&
                          (PaO2 != 0.0)) {
                        var url = Uri.parse(
                            'https://flask-detection-analysis.herokuapp.com/diabetes');
                        http.Response response = await http.post(
                          url,
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: convert.jsonEncode({
                            "Ph": Ph,
                            "PaO2": PaO2,
                            "HCO3": HCO3,
                            "PCO2": PCO2
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
                        } else {
                          print(
                              'Request failed with status: ${response.statusCode}.');
                        }
                      }
                    },
                    color: Colors.red,
                    textColor: Colors.white,
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
