import 'package:aduwaa_app/waitingScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class placeOrder extends StatefulWidget {
  final bool selectVeg;
  final bool selectFish;
  final bool selectChick;
  final bool wade;
  final bool parota;
  final String index;
  const placeOrder({
    required this.selectVeg,
    required this.selectFish,
    required this.selectChick,
    required this.wade,
    required this.parota,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<placeOrder> createState() => _placeOrderState();
}

class _placeOrderState extends State<placeOrder> {
  late bool selectVeg;
  late bool selectFish;
  late bool selectChick;
  late bool wade;
  late bool parota;
  final int vegp = 100;
  final int fishp = 150;
  final int chickenp = 200;
  final int Wadep = 50;
  final int Parotap = 50;
   int vegVal = 1;
   int fishVal = 1;
   int chickenVal = 1;
   int WadeVal = 1;
   int ParotaVal = 1;
   late String index;

  DatabaseReference _ref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();

    // Initialize the state variables with the constructor values
    selectVeg = widget.selectVeg;
    selectFish = widget.selectFish;
    selectChick = widget.selectChick;
    wade = widget.wade;
    parota = widget.parota;
    index = widget.index;


  }


  void sendDataToDatabase( String index,
      String vegval,
      String fishval,
      String chickval,
      String wadeval,
      String parotaval,) {
    // Update the reference to the "user" node
    DatabaseReference userRef = _ref.child('user').child(index);
    // Get the current date and time
    String currentDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    Map<String, dynamic> orderDetails = {
      'Veg': vegval,
      'Fish': fishval,
      'Chicken': chickval,
      'Wade': wadeval,
      'Parota': parotaval,

    };
    // Use the set method to update data1, data2, and data3
    // Update only the order details for the user using the key (index)
    userRef.set({
      'index':index,
      'time': currentDate,
      'Veg': vegval,
      'Fish': fishval,
      'Chicken': chickval,
      'Wade': wadeval,
      'Parota': parotaval,
    }).then((_) {
      print("Data updated in Firebase successfully, and previous record deleted.");
    }).catchError((error) {
      print("Error updating data in Firebase: $error");
    });
  }

  // void sendDataToDatabase(
  //     String index,
  //     String vegval,
  //     String fishval,
  //     String chickval,
  //     String wadeval,
  //     String parotaval,
  //     ) {
  //   if (_ref != null) {
  //     // Update the reference to the "user" node
  //
  //
  //     // Create a map to store order details
  //     Map<String, dynamic> orderDetails = {
  //       'Veg': vegval,
  //       'Fish': fishval,
  //       'Chicken': chickval,
  //       'Wade': wadeval,
  //       'Parota': parotaval,
  //     };
  //   print(orderDetails);
  //     print("userRef path: ${_ref!.path}");
  //
  //     // Use the set method to update the data in Firebase
  //     _ref!.set({
  //       'index no': index,
  //       'order': 'Order',
  //       'order details': orderDetails,
  //     }).then((_) {
  //       print("Data added to Firebase successfully.");
  //     }).catchError((error) {
  //       print("Error adding data to Firebase: $error");
  //     });
  //   } else {
  //     print("_Ref is null. Ensure it's correctly initialized.");
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    int SelectVeg = selectVeg?1:0;
    int SelectFish = selectFish?1:0;
    int SelectChick = selectChick?1:0;
    int Wade = wade?1:0;
    int Parota = parota?1:0;

    int total = SelectVeg*vegVal*vegp + SelectFish*fishp*fishVal + SelectChick*chickenp*chickenVal + Wade*Wadep*WadeVal + Parota*Parotap*ParotaVal;
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






                Container(
                  width: width*0.9,
                  height: height*0.52,

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height*0.02,),
                        selectVeg ?
                        GestureDetector(
                          onTap: (){

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
                                    width: width*0.4,
                                    child: Text("Rice and Curry Veg: Rs 100.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),

                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    vegVal > 0?
                                    vegVal = vegVal-1 : vegVal= vegVal;
                                    total= total-100;
                                  });
                                }, child: Icon(Icons.remove,size: width*0.08,),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(width: width*0.02,),

                                Container(
                                    child: Text(vegVal.toString(),style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.03,),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    vegVal = vegVal+1;
                                    total= total+100;
                                  });
                                }, child: Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow.withOpacity(0.6),
                                  ),),
                              ],
                            ),
                          ),
                        ) : SizedBox(height: height*0.00,),
                        SizedBox(height: height*0.02,),
                        selectFish?
                        GestureDetector(
                          onTap: (){
                            setState(() {

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
                                    width: width*0.4,
                                    child: Text("Rice and Curry Fish: Rs 150.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),

                            ElevatedButton(onPressed: (){
                              setState(() {
                                fishVal>0?
                                fishVal = fishVal-1 : fishVal=fishVal;
                                total= total-150;
                              });
                            }, child: Icon(Icons.remove,size: width*0.08,),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(width: width*0.02,),

                            Container(
                                child: Text(fishVal.toString(),style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                            SizedBox(width: width*0.03,),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                fishVal = fishVal+1;
                                total= total+150;
                              });
                            }, child: Icon(Icons.add),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.withOpacity(0.6),
                              ),),
                              ],
                            ),
                          ),
                        ) : SizedBox(height: 0.0,),
                        SizedBox(height: height*0.02,),
                        selectChick?
                        GestureDetector(
                          onTap: (){
                            setState(() {

                            });
                          },
                          child: Container(
                            height: height*0.10,
                            width: width*0.9,
                            alignment: Alignment.centerLeft,

                            decoration: BoxDecoration(
                              color: selectChick? Colors.green.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(width*0.05),

                            ),
                            child: Row(
                              children: [
                                SizedBox(width: width*0.03,),
                                Container(
                                    width: width*0.4,
                                    child: Text("Rice and Curry Chicken: Rs 200.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),

                            ElevatedButton(onPressed: (){
                              setState(() {
                                chickenVal>0?
                                chickenVal = chickenVal-1:chickenVal=chickenVal;
                                total= total-200;
                              });
                            }, child: Icon(Icons.remove,size: width*0.08,),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(width: width*0.02,),

                            Container(
                                child: Text(chickenVal.toString(),style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                            SizedBox(width: width*0.03,),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                chickenVal = chickenVal+1;
                                total= total+200;
                              });
                            }, child: Icon(Icons.add),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.withOpacity(0.6),
                              ),),
                              ],
                            ),
                          ),
                        ):SizedBox(),
                        SizedBox(height: height*0.02,),
                        wade?
                        GestureDetector(
                          onTap: (){
                            setState(() {

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
                                    width: width*0.4,
                                    child: Text("Ulundu Wade:   Rs 50.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),

                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    WadeVal>0?
                                    WadeVal = WadeVal-1:WadeVal=WadeVal;
                                    total= total-50;
                                  });
                                }, child: Icon(Icons.remove,size: width*0.08,),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(width: width*0.02,),

                                Container(
                                    child: Text(WadeVal.toString(),style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.03,),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    WadeVal = WadeVal+1;
                                    total= total+50;
                                  });
                                }, child: Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow.withOpacity(0.6),
                                  ),),
                              ],
                            ),
                          ),
                        ):SizedBox(),
                        SizedBox(height: height*0.02,),
                        parota?
                        GestureDetector(
                          onTap: (){
                            setState(() {

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
                                    width: width*0.4,
                                    child: Text("Parota :               Rs 50.00",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),

                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    ParotaVal>0?
                                    ParotaVal = ParotaVal-1:ParotaVal=ParotaVal;
                                    total= total-50;
                                  });
                                }, child: Icon(Icons.remove,size: width*0.08,),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(width: width*0.02,),

                                Container(
                                    child: Text(ParotaVal.toString(),style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: width*0.03,),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    ParotaVal = ParotaVal+1;
                                    total= total+50;
                                  });
                                }, child: Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow.withOpacity(0.6),
                                  ),),
                              ],
                            ),
                          ),
                        ):SizedBox(),
                        SizedBox(height: height*0.02,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    SizedBox(width: width*0.01,),
                    Container(
                      alignment: Alignment.center,
                      width: width*0.9,
                      height: height*0.07,
                      color: Colors.white.withOpacity(0.25),
                      child: Text("Sub total : Rs " + total.toString()+".00",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.bold,color: Colors.white), ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    SizedBox(width: width*0.01,),
                    ElevatedButton(onPressed: (){

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text("Confirm Order"),
                            content: Text("Your total is : Rs" + total.toString()),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Wait"),
                                onPressed: () {
                                  Navigator.of(context).pop();

                                },
                              ),
                              TextButton(
                                child: Text("Confirm"),
                                onPressed: () {
                                  setState(() {
                                    sendDataToDatabase(index, selectVeg?vegVal.toString():"no", selectFish? fishVal.toString():'no', selectChick? chickenVal.toString():'no', wade? WadeVal.toString():'no', parota ? ParotaVal.toString():'no');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => waitingScreen(index:index),
                                      ),
                                    );
                                  });


                                },
                              ),

                            ],
                          );
                        },
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
