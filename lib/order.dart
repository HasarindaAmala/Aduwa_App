import 'package:aduwaa_app/loginScreen.dart';
import 'package:aduwaa_app/placeOrder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order_screen extends StatefulWidget {
  final String password;
  const Order_screen({required this.password,Key? key,}) : super(key: key);

  @override
  State<Order_screen> createState() => _Order_screenState();
}

class _Order_screenState extends State<Order_screen> {
  bool rawatha = false;
  bool rathmalana = true;
  bool selectVeg = false;
  bool selectFish = false;
  bool selectchick = false;
  bool wade = false;
  bool parota = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(height*0.1),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.11),
          title:
          Text(
            "FIND YOUR \nFAVORITE FOODS",
            style: TextStyle(fontSize: width * 0.07, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("UserName :"+widget.password),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('JD'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginScreen(
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.remove('remember_me');
                  await prefs.remove('index');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Signed Out"),
                      content: Text("Signed Out Successfully"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );

              },
            ),
          ],
        ),
      ),
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
                ),
                SizedBox(height: height*0.04,),
                Container(
                  width: width*0.9,
                  height: height*0.52,

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height*0.02,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectVeg=!selectVeg;
                            });
                          },
                          child: Container(
                            height: height*0.10,
                            width: width*0.9,
                            alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              color: selectVeg? Colors.green.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width*0.05),

                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width*0.03,),
                                Container(
                                    width: width*0.45,
                                    child: Text("Rice and Curry Vegitable:",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.1,),
                                Container(
                                    width: width*0.3,

                                    child: Text("RS 100.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectFish=!selectFish;
                            });
                          },
                          child: Container(
                            height: height*0.10,
                            width: width*0.9,
                            alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              color: selectFish? Colors.green.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width*0.05),

                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width*0.03,),
                                Container(
                                    width: width*0.45,
                                    child: Text("Rice and Curry Fish:",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.1,),
                                Container(
                                    width: width*0.3,

                                    child: Text("RS 150.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              selectchick=!selectchick;
                            });
                          },
                          child: Container(
                            height: height*0.10,
                            width: width*0.9,
                            alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              color: selectchick? Colors.green.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width*0.05),

                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width*0.03,),
                                Container(
                                    width: width*0.45,
                                    child: Text("Rice and Curry Chicken:",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.1,),
                                Container(
                                    width: width*0.3,

                                    child: Text("RS 200.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              wade=!wade;
                            });
                          },
                          child: Container(
                            height: height*0.10,
                            width: width*0.9,
                            alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              color: wade? Colors.green.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width*0.05),

                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width*0.03,),
                                Container(
                                    width: width*0.45,
                                    child: Text("Ulundu Wade:",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.1,),
                                Container(
                                    width: width*0.3,

                                    child: Text("RS 50.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              parota=!parota;
                            });
                          },
                          child: Container(
                            height: height*0.10,
                            width: width*0.9,
                            alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              color: parota? Colors.green.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width*0.05),

                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width*0.03,),
                                Container(
                                  width: width*0.45,
                                    child: Text("Parota With Gravy:",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.1,),
                                Container(
                                  width: width*0.3,

                                    child: Text("RS 50.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    SizedBox(width: width*0.01,),
                    ElevatedButton(onPressed: (){


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => placeOrder(
                            selectVeg: selectVeg,
                            selectFish: selectFish,
                            selectChick: selectchick,
                            wade: wade,
                            parota: parota,
                            index: widget.password,
                          ),
                        ),
                      );


                    },
                      child: Text("Place Order",style: TextStyle(fontSize: width*0.05),),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow.withOpacity(0.8),
                          fixedSize: Size(width*0.9, height*0.06 ),
                          side: BorderSide(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                          )
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
