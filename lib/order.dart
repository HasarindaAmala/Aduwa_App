import 'package:flutter/material.dart';

class Order_screen extends StatefulWidget {
  const Order_screen({super.key});

  @override
  State<Order_screen> createState() => _Order_screenState();
}

class _Order_screenState extends State<Order_screen> {
  bool rawatha = false;
  bool rathmalana = true;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/images/tara-evans-6FbArnPXEVg-unsplash (1).jpg'),
            fit: BoxFit.fill,
            opacity: 0.27,
          ),
        ),
        width: width,
        height: height,
        child: Row(
          children: [
            SizedBox(width: width * 0.05, height: height),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1),
                Text(
                  "FIND YOUR \nFAVORITE FOODS",
                  style: TextStyle(fontSize: width * 0.07, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "Select Your Canteen",
                  style: TextStyle(fontSize: width * 0.05, color: Colors.yellow),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          rathmalana = true;
                          rawatha= false;
                        });
                        print(rathmalana);
                      },
                      child: Container(
                        height: height*0.04,
                        width: width*0.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: rathmalana? Colors.green:Colors.white,
                        ),
                        child: Text("Rathmalana",style: TextStyle(color: rathmalana? Colors.white : Colors.black,fontSize: width*0.04),),
                      ),
                    ),
                    SizedBox(width: width*0.06,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          rawatha=true;
                          rathmalana=false;
                        });
                        print(rathmalana);
                      },
                      child: Container(
                        height: height*0.04,
                        width: width*0.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),

                          color: rawatha? Colors.green : Colors.white,
                        ),
                        child: Text("Rawathawatta",style: TextStyle(color: rawatha? Colors.white : Colors.black,fontSize: width*0.04),),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
