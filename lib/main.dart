
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.gree
        //
        //
        //
        // n and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to ero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),//(: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);



  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = "";


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  String result='';


  //void _incrementCounter() {
  // setState(() {
  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.
  //  _counter++;
  // });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(

          title: const Center(child:  Text('your BMI')),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,   // column ka vertical ko main axis kehte hain aur horizontal ka cross axis hota hain aur row mein vice versa kar do

              children: [       // COLUMN MEIN HEIGHT AYR WIDTH DEFINE NHI HOTI HSIN
                const Text('BMI',style: TextStyle(fontSize: 40 , fontWeight: FontWeight.w700),),

                TextField(controller: wtController,
                  decoration: const InputDecoration(
                      label: Text('enter your weight (in kg)'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 11,),


                TextField(controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('enter your height (in feet)'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 11,),

                TextField(controller: inchController,
                    decoration: const InputDecoration(
                        label: Text('enter your height (in inches)'),
                        prefixIcon: Icon(Icons.line_weight)
                    )
                ),
                const SizedBox(height: 16),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch =inchController.text.toString();

                  if(wt!="NULL" && ft!="NULL"  && inch!="NULL")
                  {
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);


                    var tinch = (ift*12) + iinch;
                    var tcm = tinch * 2.54;
                    var tm = tcm/100;

                    var bmi= iwt/(tm*tm);

                    var msg="";

                    if(bmi>25)
                      {
                          msg="You are overweight !!";

                      }
                    else if(bmi<18)
                    {
                          msg= " You are under weight !!";
                    }
                    else {
                      msg= "Yor are fit !!";
                    }


                    setState(() {

                      result = "$msg \n your bmi is ${bmi.toStringAsFixed(2)}   ";  // SIRF DO HI DECIMAL TAK ANSWER DEGA

                    });


                  }
                  else{
                    setState(() {
                      result = "please fill the required options";
                    });

                  }

                }, child: const Text('calculate')),  //button ke liye hain

                const SizedBox(height: 16,),
                Text(result, style: const TextStyle(fontSize:16 ),
                ),



              ],
            ),
          ),
        )

      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and e it to se our appbar title.

    );

    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.

    // Column is also a layout widget. It takes a list of children and
    // arranges them vertically. By default, it sizes itself to fit its
    // children horizontally, and tries to be as tall as its parent.
    //
    // Invoke "debug painting" (press "p" in console, choose the
    // "Toggle Debug Paint" action from the Flutter Inspector in Android
    // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
    // to see the wireframe for each widget.
    //
    // Column has various properties to control how it sizes itself and
    // how it positions its children. Here we use mainAxisAlignment to
    // center the children vertically; the main axis here is the vertical
    // axis because Columns are vertical (the cross axis would be
    // horizontal).

    // This trailing comma makes auto-formatting nicer for build methods.

  }
}
