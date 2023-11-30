import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class BloodPage extends StatefulWidget {
  const BloodPage({Key? key}) : super(key: key);

  @override
  _BloodPageState createState() => _BloodPageState();
}

class _BloodPageState extends State<BloodPage> {
  double hemoglobin = 0.0;
  double platelets = 0.0;
  double leukocyte = 0.0;
  int gender = 0;
  bool woman = true;
  bool err = false;
  bool done = false;
  List<dynamic> finalResult = [];
  String type = "Female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,

      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      body: Container(
        // padding: EdgeInsets.all(10),
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
                  "assets/img/bl.jpg",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 200,
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
                        activeColor: Colors.redAccent,
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
                          hemoglobin = 0.0;
                        } else {
                          hemoglobin = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Hemoglobin',
                      labelText: 'Hemoglobin',
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
                          leukocyte = 0.0;
                        } else {
                          leukocyte = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Leukocyte',
                      labelText: 'Leukocyte',
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
                          platelets = 0.0;
                        } else {
                          platelets = double.parse(text);
                        }
                      });
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Platelets',
                      labelText: 'Platelets',
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
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Center(
                        child: Text(
                          finalResult[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
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
                      if ((hemoglobin == 0.0) ||
                          (platelets == 0.0) ||
                          (leukocyte == 0.0)) {
                        setState(() {
                          err = true;
                          done = false;
                        });
                      } else if ((hemoglobin != 0.0) &&
                          (platelets != 0.0) &&
                          (leukocyte != 0.0)) {
                        if (woman) {
                          type = "Female";
                        } else {
                          type = "Male";
                        }

                        var url = Uri.parse(
                            'https://flask-detection-analysis.herokuapp.com/blood');

                        http.Response response = await http.post(
                          url,
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: convert.jsonEncode({
                            "Hemoglobin": hemoglobin,
                            "Platelets": platelets,
                            "Leukocyte": leukocyte,
                            "type": type
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
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    minWidth: 50,
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
