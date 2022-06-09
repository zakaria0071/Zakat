import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:zakat_frontend/zakat_calculator/zakat_calculator_view.dart';

class ZakatCalculatorFrontview extends StatefulWidget {

  @override
  _ZakatCalculatorFrontviewState createState() => _ZakatCalculatorFrontviewState();
}


class _ZakatCalculatorFrontviewState extends State<ZakatCalculatorFrontview> {
  List<dynamic> currencies = [];
  String? currencyId;
  @override
  void initState(){
    super.initState();

    currencies.add({"id": 1 ,"name":"Taka"});
    currencies.add({"id": 2 ,"name":"Doller"});
    currencies.add({"id": 3 ,"name":"Rupi"});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Zakat Calculator"),
        backgroundColor:Colors.cyan,
      ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             FormHelper.dropDownWidgetWithLabel(context,
                 "Currency",
                 "Select Currency",
                 currencyId,
                 currencies,
                     (onChangedVal){
               this.currencyId = onChangedVal;
               print('selected country: $onChangedVal');
                 }, (onValidateVal){
                if (onValidateVal) {
                  return'please Select Country';

                }
                return null;
                 },
               borderRadius: 10,
               borderColor: Colors.cyan,
               borderFocusColor: Colors.cyan,
                 ),
              SizedBox(height: 20),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0,color: Colors.cyan),
                  primary: Colors.cyan,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                      vertical: 17, horizontal:83 ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  

                ),
                

                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => Zakatcalculator()));
                },

                label: Text("Calculate Your Zakat",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.blueGrey,)),
                  icon: Icon(Icons.calculate,size: 12,),

              ),
            ],
          ),
    ));
  }
}
