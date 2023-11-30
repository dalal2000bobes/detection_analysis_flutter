import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class BonePage extends StatefulWidget {
  const BonePage({Key? key}) : super(key: key);

  @override
  _BonePageState createState() => _BonePageState();
}

class _BonePageState extends State<BonePage> {
  double vitD = 0.0;
  double caly = 0.0;
  double pth = 0.0;
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
                  "assets/img/11.PNG",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 230,
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
                          vitD = 0.0;
                        } else {
                          vitD = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Vitamin D',
                      labelText: 'Vitamin D',
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
                          pth = 0.0;
                        } else {
                          pth = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'PTH',
                      labelText: 'PTH',
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
                          caly = 0.0;
                        } else {
                          caly = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Calystonin',
                      labelText: 'Calystonin',
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
                            color: Colors.black,
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
                      if ((vitD == 0.0) || (caly == 0.0) || (pth == 0.0)) {
                        setState(() {
                          err = true;
                          done = false;
                        });
                      } else if ((vitD != 0.0) &&
                          (caly != 0.0) &&
                          (pth != 0.0)) {
                        var url = Uri.parse(
                            'https://flask-detection-analysis.herokuapp.com/bone');
                        http.Response response = await http.post(
                          url,
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: convert.jsonEncode(
                              {"VitD": vitD, "Caly": caly, "Pth": pth}),
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
                    color: Colors.black,
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
