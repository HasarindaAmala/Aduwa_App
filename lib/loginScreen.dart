import 'package:aduwaa_app/firebase_auth.dart';
import 'package:aduwaa_app/order.dart';
import 'package:aduwaa_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool correct = true;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    print("iit state");
    // Check if "Remember Me" was previously selected and load the value.
    _loadRememberMePreference();

  }

  _loadRememberMePreference() async {
    print("loaded");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('remember_me') ?? false;
      indexController.text = prefs.getString('index') ?? '';
    });
    print(rememberMe);
    if (rememberMe) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Order_screen(password: indexController.text),
        ),
      );
    }
  }

  _saveRememberMePreference(bool value , String Index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('remember_me', value);
    prefs.setString('index', Index);
    print("success");
    print(value);
    print(Index);

  }

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
             
              decoration: BoxDecoration( color: Colors.yellow,borderRadius: BorderRadius.circular(width*0.9)),
            )
            ),
            Positioned(
              top: height*0.395,
              left: width*0.09,

                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[

                    Text("WELCOME",style: TextStyle(fontSize: width*0.135,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("BACK!",style: TextStyle(fontSize: width*0.13,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],
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
                Container(
                  alignment: Alignment.centerRight,
                  width: width*0.78,
                  height: height*0.03,

                  child:  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signup_screen(),
                        ),
                      );

                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: width*0.045),
                    ),
                  ),
                ),
                SizedBox(height: height*0.01,),


                 Container(
                   width: width*0.52,
                   alignment: Alignment.center,
                   child: CheckboxListTile(

                      title: Text('Remember Me',style: TextStyle(color: Colors.white),),
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                          print(rememberMe);
                        });
                      },
                   // tileColor: Colors.white.withOpacity(0.22),
                     contentPadding: EdgeInsets.fromLTRB(width*0.06, 0, width*0.05, 0),


                     side: BorderSide(color: Colors.white),
                    ),
                 ),

                SizedBox(height: height*0.01,),
                ElevatedButton(onPressed: (){

                  if (rememberMe) {
                    print("checked");
                    _saveRememberMePreference(rememberMe,indexController.text);
                    signIn();

                  } else {
                    print("not checked");
                    signIn();
                  }
                },


                    child: Icon(Icons.arrow_forward,size: width*0.4*0.2,color: Colors.black,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      fixedSize: Size(width*0.4, height*0.05 ),
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
      ),
    );

  }
  void signIn() async {
    String email = usernameController.text;
    String password = indexController.text;

    User? user = await _auth.SignIn(email, password);

    if (user != null) {
      print("succesfully signedIn");
      setState(() {
        correct = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Order_screen(password:password),
        ),
      );
    } else {
      setState(() {
        correct = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sign In Failed"),
            content: Text("please check email and registration no again!"),
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

      print("some error occured!");
      // Fluttertoast.showToast(msg: "Sign in failed");
    }
  }
}
