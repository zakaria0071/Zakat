

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';


class Zakatcalculator extends StatefulWidget {

  const Zakatcalculator({Key? key}) : super(key: key);

  @override
  _ZakatcalculatorState createState() => _ZakatcalculatorState();
}

class _ZakatcalculatorState extends State<Zakatcalculator> {
  // final gold = TextEditingController();
  // final silver = TextEditingController();
  // final cashAmount = TextEditingController();
  // final investment = TextEditingController();
  // final total = TextEditingController();
  // final silverPrice = TextEditingController();
  // final _silverPrice = TextEditingController();
  // String result = "0";
  // String result1 = "0";
  // String result2 = "0";
  // String silverAmount = "52.5";
  // String sumSilver = "0.025";
  // String _selectedGoldType = "";
  // var goldtype ={};
  List<dynamic>goldTypes = [];
  String? goldTypeId;

  get gold => null;
  @override
   void initState(){
    super.initState();
    goldTypes.add({"id":1,"name":"24cr"});
    goldTypes.add({"id":2,"name":"24cr"});
    goldTypes.add({"id":3,"name":"24cr"});
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.white,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Zakat Calculator",style: TextStyle(
                    height: 5,
                    decoration: TextDecoration.underline,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,

                  children: [

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.cyan,

                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal:55 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: ()=>buildField("Gold",23),
                      // onPressed: (value) =>{
                      //   return Row (value)
                      //  },
                      child: Text("GOLD",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ),

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.cyan,

                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal:50 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      onPressed: ()=>buildField("Silver",23),
                      child: Text("SILVER",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ),

                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.cyan,

                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal:50 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      onPressed: (){
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text("CASH",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.cyan,

                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal:50 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      onPressed: (){
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUp()));

                      },
                      child: Text("STOCK",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // FormHelper.dropDownWidget(context,
                //   "Select Gold Type",
                //   goldTypeId,
                //   goldTypes,
                //       (onChangedVal){
                //     goldTypeId = onChangedVal;
                //     print('Select Gold Type: $onChangedVal');
                //   }, (onValidateVal){
                //     if (onValidateVal) {
                //       return'please Select Gold Type';
                //
                //     }
                //     return null;
                //   },
                //   borderRadius: 10,
                //   borderColor: Colors.cyan,
                //   borderFocusColor: Colors.cyan,
                // ),
              ],
            ),

            
          ),
        );
  }

   // Future<Widget?> buildField(String type, double wight) async {
   //  if ( type == "gold" ){
   //    return Row(
   //      children:<Widget> [
   //        FormHelper.dropDownWidget(context,
   //          "Select Gold Type",
   //          goldTypeId,
   //          goldTypes,
   //              (onChangedVal){
   //            goldTypeId = onChangedVal;
   //            print('Select Gold Type: $onChangedVal');
   //          }, (onValidateVal){
   //            if (onValidateVal) {
   //              return'please Select Gold Type';
   //
   //            }
   //            return null;
   //          },
   //          borderRadius: 10,
   //          borderColor: Colors.cyan,
   //          borderFocusColor: Colors.cyan,
   //        ),
   //
   //
   //    ],);
   //  }
   //  if (wight == "gram") {
   //    return Row()
   //
   //  }
   //  // if(type = silver as bool){
   //  //     return row(Card[DropdownButton("carate", items: [],)],TextField.noMaxLength);
   //    // }
   //   return null;
   //  }
  buildField(String type, double wight) async {
    switch (type){
      case "Gold" :
        return Row(
          children:<Widget> [
            FormHelper.dropDownWidget(context,
              "Select Gold Type",
              goldTypeId,
              goldTypes,
                  (onChangedVal){
                goldTypeId = onChangedVal;
                print('Select Gold Type: $onChangedVal');
              }, (onValidateVal){
                if (onValidateVal) {
                  return'please Select Gold Type';

                }
                return null;
              },
              borderRadius: 10,
              borderColor: Colors.cyan,
              borderFocusColor: Colors.cyan,
            ),




          ],);
        break;

      case "Asset" :
        print("You tap Asset");
        break;
      case "Silver" :
        print("You tap Silver");
        break;
    }
  }






  // void _clearAll(){
  //   gold.text = "";
  //   silver.text = "";
  //   cashAmount.text = "";
  //   investment.text = "";
  // }

}