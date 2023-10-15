import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class waitingScreen extends StatefulWidget {
  const waitingScreen({super.key});

  @override
  State<waitingScreen> createState() => _waitingScreenState();
}

class _waitingScreenState extends State<waitingScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
         backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height*0.85,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('Assets/images/c4cb9abc7c69713e7e816e6a624ce7f8.gif'),fit: BoxFit.fitWidth)
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Your Order",style: TextStyle(fontSize: width*0.08,fontWeight: FontWeight.bold,color: Colors.blue),),
            Text("Placed ",style: TextStyle(fontSize: width*0.07,color: Colors.black),),
            Text("Successfully!",style: TextStyle(fontSize: width*0.09,fontWeight: FontWeight.bold,color: Colors.lightGreen),),
            SizedBox(height: height*0.05,),
            ElevatedButton(onPressed: (){
              SystemNavigator.pop();
            },
              child: Container(
                height: height*0.05,
                  width: width*0.3,
                  alignment: Alignment.center,
                  child: Text("Done",style: TextStyle(fontSize: width*0.05),)),
              style: ElevatedButton.styleFrom(
                elevation: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
