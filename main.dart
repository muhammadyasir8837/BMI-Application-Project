import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

  class MyApp extends StatelessWidget{

   @override
  Widget build(BuildContext context){

     return  MaterialApp(
       title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: MyHomePage(

       ),
     );

  }



}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController =  TextEditingController();
  var ftController =  TextEditingController();
  var inController =  TextEditingController();
  var result  = '';
  var bgColor =  Colors.indigo.shade200;
  @override
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YourBMI'),
        ),
        body: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: bgColor,
          child: Center(
            child: SizedBox(
            width:300,

                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
                    SizedBox(height:21),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                        label: Text('Enter your weight(in Kgs)'),
                        prefixIcon: Icon(Icons.line_weight),

                      ),
                      keyboardType: TextInputType.number,

                    ),
                    SizedBox(height:11),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                label: Text('Enter your height(in Feet)'),
                prefixIcon: Icon(Icons.height),

                      ),
                      keyboardType: TextInputType.number,

                    ),
                    SizedBox(height: 11,),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        label: Text('Enter your Height(in Inch)'),
                        prefixIcon: Icon(Icons.height),

                      ),
                      keyboardType: TextInputType.number,

                    ),
                    SizedBox(height:16),
                   ElevatedButton(
                     onPressed: () {
                       var wt = wtController.text.trim();
                       var ft = ftController.text.trim();
                       var inch = inController.text.trim();
                       if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                         try {
                           var iwt = int.parse(wt);
                           var ift = int.parse(ft);
                           var iInch = int.parse(inch);
                           var tInch = (ift * 12) + iInch;
                           var tcm = tInch * 2.54;
                           var tm = tcm / 100;
                           var bmi = iwt / (tm * tm);
                           var msg = '';
                           Color newBgColor;
                           if (bmi > 25) {
                             msg = 'You are OverWeight!!';
                             newBgColor = Colors.orange.shade300;
                           } else if (bmi < 18) {
                             msg = 'You are UnderWeight';
                             newBgColor = Colors.red.shade200;
                           } else {
                             msg = 'You are Healthy!!';
                             newBgColor = Colors.green.shade200;
                           }
                           setState(() {
                             result = '$msg \n Your BMI is :${bmi.toStringAsFixed(2) }';
                             bgColor = newBgColor;
                           });
                         } catch (e) {
                           setState(() {
                             result = 'Please enter valid numbers!!';
                           });
                         }
                       } else {
                         setState(() {
                           result = 'Please fill all fields!';
                         });
                       }
                     },


                     style:ElevatedButton.styleFrom(
                       backgroundColor:Colors.blue,
                       foregroundColor:Colors.white
                     ),

                    child: Text('Calculate'),

                   ),
                    SizedBox(
                      height:11
                    ),
                    Text(result,style:TextStyle(fontSize: 19),
                      textAlign: TextAlign.center,),



  ],
                ),

            ),
          ),
        )









    );
  }
}

