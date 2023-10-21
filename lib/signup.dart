import 'package:aduwaa_app/firebase_auth.dart';
import 'package:aduwaa_app/loginScreen.dart';
import 'package:aduwaa_app/order.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool correct = true;
  @override
  void dispose() {
    usernameController.dispose();
    indexController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Assets/images/tara-evans-6FbArnPXEVg-unsplash (1).jpg'),fit: BoxFit.fill,opacity: 0.27)),

            ),
            Positioned(
                top: -height*0.2,
                left: -width*0.3,
                child: Container(
                  width: width*1.2,
                  height: width*1.2,

                  decoration: BoxDecoration( color: Colors.green,borderRadius: BorderRadius.circular(width*0.9)),
                )
            ),
            Positioned(
              top: height*0.4,
              left: width*0.05,
              child: Container(
                width: width*0.9,
                height: height*0.15,

                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[

                      Text("ADUWA",style: TextStyle(fontSize: width*0.135,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("SIGN UP!",style: TextStyle(fontSize: width*0.11,fontWeight: FontWeight.normal,color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: width,height: height*0.6,),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: width*0.8,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: correct ? Colors.yellow : Colors.red, // Border color based on 'correct'
                        width: 2.0,
                      ),// You can adjust the border width as needed
                      borderRadius: BorderRadius.circular(0.0),

                    ),
                    child: TextFormField(            //password
                      controller: indexController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.5),

                        suffixIcon: const Icon(
                          Icons.key,
                          color: Colors.yellow,
                        ),
                        hintText: 'Enter Registration No',
                        hintStyle: const TextStyle(color: Colors.white54),
                        labelText:'   Registration No',
                        labelStyle: const TextStyle(color: Colors.yellow),
                        enabledBorder: InputBorder.none,
                        // const OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.yellow,
                        //   ),
                        //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        // ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),

                  ),
                ),



                SizedBox(width: width,height: height*0.02,),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: width*0.8,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: correct ? Colors.yellow : Colors.red, // Border color based on 'correct'
                        width: 2.0,
                      ),// You can adjust the border width as needed
                      borderRadius: BorderRadius.circular(0.0),

                    ),

                    child: TextFormField(            //password
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.5),

                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        hintText: 'Enter Email',
                        hintStyle: const TextStyle(color: Colors.white),
                        labelText:'  Email Address',
                        labelStyle: const TextStyle(color: Colors.white54),
                        enabledBorder: InputBorder.none,
                        //   const OutlineInputBorder(
                        //     // borderSide: BorderSide(
                        //     //   color: Colors.white,
                        //     // ),
                        //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        //   ),
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),

                  ),
                ),

                SizedBox(height: height*0.02,),

                SizedBox(height: height*0.02,),
                ElevatedButton(onPressed:(){
                  signUp();

                } ,

                  child: Text("SIGN UP",style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      fixedSize: Size(width*0.4, height*0.05 ),
                      side: BorderSide(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width*0.03),
                      )


                  ),
                ),
                SizedBox(height: height*0.02,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have An Account ?",style: TextStyle(color: Colors.white,fontSize: width*0.04),),
                    SizedBox(width: width*0.03,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginScreen(),
                          ),
                        );
                      },
                        child: Text("SignIn",style: TextStyle(color: Colors.blue,fontSize: width*0.05),)
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
  void signUp() async {
    String email = usernameController.text;
    String password = indexController.text;

    User? user = await _auth.SignUp(email, password);

    if (user != null) {
      print("succesfully signed Up");
      setState(() {
        correct = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Registered"),
              content: Text("Registration Succesfully!"),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginScreen(),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      });


    } else {
      setState(() {
        correct = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sign Up Failed"),
            content: Text("please check email and registration no again!"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signup_screen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );

      print("some error occured!");
      // Fluttertoast.showToast(msg: "Sign in failed");
    }
  }
}
