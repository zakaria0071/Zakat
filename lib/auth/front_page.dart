
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakat_frontend/home_page.dart';
import 'package:zakat_frontend/zakat_calculator/zakat_calculator_frontView.dart';
import 'package:zakat_frontend/zakat_calculator/zakat_calculator_view.dart';

import '../widgets/text_field.dart';


class Frontpage extends StatelessWidget {
  const Frontpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 90),
      child:SingleChildScrollView(

        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         CircleAvatar(
              radius:50,
              child: Center(
                child: Image.asset('assets/Zakat.png'),
              )
          ),
           const Text("ٱلسَّلَامُ عَلَيْكُمْ",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent),
             ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              const Text('You can login to your account or register from here.',style: TextStyle(fontSize: 15,
                  color: Colors.cyanAccent),
              ),
              MyTextField (

                  hintText: 'Email',
                  obscureText: false),
              const SizedBox(height: 10),

              MyTextField (

                  hintText: 'Password',
                  obscureText: true),
              const Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child:Text('Forget your password?',style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.red,
                          offset: Offset(0, -5))
                    ],
                    color: Colors.transparent,
                    decoration:
                    TextDecoration.underline,
                    decorationColor: Colors.blue,
                    decorationThickness: 4,
                    decorationStyle:
                    TextDecorationStyle.dashed,
                  ),
                  ),
              ),

              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,

                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal:45 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Frontpage()));
                    },
                    child: Text("Log In",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,)),
                  ),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal:40 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    onPressed: (){
                     //  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: Text("Sign Up",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child:Text('--------- or ---------',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.redAccent)
                ),
              ),

            ],

          ),


         //  ElevatedButton.icon(
         //     style: OutlinedButton.styleFrom(
         //       primary: Colors.white,
         //       backgroundColor: Colors.white,
         //       padding: const EdgeInsets.symmetric(
         //           vertical: 10, horizontal: 88 ),
         //       shape: RoundedRectangleBorder(
         //         borderRadius: BorderRadius.circular(5),
         //       ),
         //     ),
         //     onPressed: (){},
         //     icon: Icon(Icons.facebook,color:Colors.indigo),
         //     label: Text("Facebook",style: TextStyle(color: Colors.black),
         //     )
         // ),
          // ElevatedButton.icon(
          //     style: OutlinedButton.styleFrom(
          //       primary: Colors.white,
          //       backgroundColor: Colors.white,
          //       padding: const EdgeInsets.symmetric(
          //           vertical: 10, horizontal: 97 ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //     ),
          //     onPressed: (){},
          //     icon: Icon(Icons.email,color:Colors.redAccent,),
          //     label: Text("Google",style: TextStyle(color: Colors.black),
          //     )
          // ),
          InkWell(
            onTap: (){},
            child: Ink(
              width: 240,
              color: Colors.blue,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset("assets/facebook.png"),// <-- Use 'Image.asset(...)' here
                  ],
                ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Ink(
              width: 240,

              color: Colors.blue,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset("assets/google.png"),

                  SizedBox(width: 12)// <-- Use 'Image.asset(...)' here
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: Text(
              'Enter as a guest',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.cyanAccent), //title
              textAlign: TextAlign.end, //aligment
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.indigo,
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal:70 ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ZakatCalculatorFrontview()));
            },
            child: const Text("Zakat Calculator",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,)),
          ),

        ],
      ),
    ),
      ),

    );

  }
}


