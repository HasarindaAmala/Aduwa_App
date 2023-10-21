import 'package:aduwaa_app/loginScreen.dart';
import 'package:aduwaa_app/modeSelection.dart';
import 'package:flutter/material.dart';
import 'package:aduwaa_app/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      // Use Navigator to push the next screen onto the stack
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ModeSelection(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(

            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const ModeSelection()),);
              },
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Assets/images/tara-evans-6FbArnPXEVg-unsplash (1).jpg'),fit: BoxFit.fill,opacity: 0.4)),

              ),
            ),
          ),

          Positioned(
              top: height*0.3,

              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ModeSelection()),);
                },
                child: Container(

                  width: width,
                  height: height*0.25,

                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Assets/images/Untitled-1 1.png'),alignment: Alignment.topCenter),),

            ),
              ),
          ),

          Positioned(
            top: height*0.55,


            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ModeSelection()),);
              },
              child: Container(
                alignment: Alignment.center,

                width: width,
                height: height*0.38,

                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Assets/images/Untitled-1.png'),alignment: Alignment.center),),

              ),
            ),


          ),

        ],

      ),

    );
  }
}
