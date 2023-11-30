import 'dart:math';

import 'package:flutter/cupertino.dart';




import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'MainPage.dart';


// class WelcomePage extends StatefulWidget {
//   @override
//   _WelcomePage createState() => _WelcomePage();
// }
// class _WelcomePage extends State<WelcomePage> {
//   List<PageViewModel> getPages() {
//     return [
//
//       PageViewModel(
//           image: Image.asset("assets/img/1.jbg",height: 500,),
//           title: "Modern laboratory",
//           body: "let's do home shopping easily!",
//         //  footer: Text("Footer Text here "),
//           decoration: const PageDecoration(
//         //  pageColor:   Color.fromRGBO(143, 148, 251, .6),
//             titleTextStyle: TextStyle(color:Colors.redAccent ,fontSize: 30,fontWeight: FontWeight.bold)
//           )
//       ),
//       PageViewModel(
//         image: Image.asset("assets/img/bl.jpg"),
//         title: "Blood test",
//         body: "we help people conect with store to have their needs met around syria",
//        // footer: Text("Footer Text  here "),
//           decoration: const PageDecoration(
//
//               titleTextStyle: TextStyle(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold)
//           )
//       ),
//       PageViewModel(
//         image: Image.asset("assets/img/b1.jpg"),
//         title: "Bone Test",
//         body: "we show the easy way to shop around the world.\nJust stay at home with us",
//           decoration: const PageDecoration(
//             //pageColor: Colors.black12,
//               titleTextStyle: TextStyle(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold)
//           )
//
//         // footer: Text("Footer Text  here "),
//       ),
//       PageViewModel(
//         image: Image.asset("assets/img/d.jpg"),
//         title: "Diabetes test",
//         body: "Welcome to the infinity store",
//    //     footer: Text("Footer Text  here "),
//           decoration: const PageDecoration(
//
//               titleTextStyle: TextStyle(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold)
//           )
//       ),
//
//       PageViewModel(
//           image: Image.asset("assets/img/pp3.PNG"),
//           title: "Hormone Test",
//            body: "we show the easy way to shop around the world.\nJust stay at home with us",
//           decoration: const PageDecoration(
//             //pageColor: Colors.black12,
//               titleTextStyle: TextStyle(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold)
//           )
//
//         // footer: Text("Footer Text  here "),
//       ),
//     ];
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( locale:Locale('en'),  debugShowCheckedModeBanner: false,home:Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Introduction Screen"),
//       // ),
//
//       body: IntroductionScreen(
//
//         globalBackgroundColor: Colors.white,
//         pages: getPages(),
//         showNextButton: true,
//         showSkipButton: true,
//         skip: Text("Skip",style: TextStyle(color: Colors.black),),
//         done: Text("Got it ",style: TextStyle(color: Colors.black)),
//         dotsDecorator: DotsDecorator(activeColor: Colors.red),
//         onDone: () {
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) =>  MainPage() ) );
//         },
//       ),
//     ));
//   }
// }
//



class WelcomePage extends StatelessWidget {
  /*here we have a list of OnbordingScreen which we want to have, each OnbordingScreen have a imagePath,title and an desc.
      */
  final List<OnbordingData> list = [
    OnbordingData(
      image: AssetImage("assets/img/1.jpg"),



//           title: "Modern laboratory",
      titleText:Text("Modern laboratory", style: TextStyle(color:Colors.redAccent ,fontSize: 30,fontWeight: FontWeight.bold),),
      descText: Text("",style: TextStyle(color:Colors.black ,fontSize: 20,fontWeight: FontWeight.bold),),
    ),
    OnbordingData(

      image: AssetImage("assets/img/bl.jpg"),
      titleText:Text("Blood test", style: TextStyle(
          color:Colors.redAccent ,fontSize: 30,fontWeight: FontWeight.bold
      ),),
      descText: Text("",style: TextStyle(
          color:Colors.black ,fontSize: 20,fontWeight: FontWeight.bold
      ),),
    ),
    OnbordingData(

      image: AssetImage("assets/img/11.PNG"),
      titleText:Text("Bone Test", style: TextStyle(
          color:Colors.redAccent ,fontSize: 30,fontWeight: FontWeight.bold
      ),),
      descText: Text("",style: TextStyle(
          color:Colors.black ,fontSize: 20,fontWeight: FontWeight.bold
      ),),
    ),
    OnbordingData(

      //         image: Image.asset("assets/img/d.jpg"),
//         title: "Diabetes test",
      image: AssetImage("assets/img/d.jpg"),
      titleText:Text("Diabetes test", style: TextStyle(
          color:Colors.redAccent ,fontSize: 30,fontWeight: FontWeight.bold
      ),),
      descText: Text( "",style: TextStyle(
          color:Colors.black ,fontSize: 20,fontWeight: FontWeight.bold
      ),),
    ),



    OnbordingData(


      //           image: Image.asset("assets/img/pp3.PNG"),
//           title: "Hormone Test",,
      image: AssetImage("assets/img/h.jpg"),
      titleText:Text("Hormone Test", style: TextStyle(
          color:Colors.redAccent ,fontSize: 30,fontWeight: FontWeight.bold
      ),),
      descText: Text( "",style: TextStyle(
          color:Colors.black ,fontSize: 20,fontWeight: FontWeight.bold
      ),),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return IntroScreen(
      onbordingDataList: list,
      colors: [
        //list of colors for per pages
        Colors.white,
        Colors.red,
      ],

      pageRoute:
      MaterialPageRoute(builder: ( context) => MainPage() ) ,

      nextButton: Text(
        "NEXT",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      lastButton: Text(
        "GOT IT",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      skipButton: Text(
        "SKIP",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      selectedDotColor: Colors.orange,
      unSelectdDotColor: Colors.grey,

    );
  }
}
