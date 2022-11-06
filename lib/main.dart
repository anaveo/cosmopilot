import 'package:cosmopilot/mapSelector.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmopilot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        secondaryHeaderColor: Colors.black,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: 'Andrew Prata Loves Baguette'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final pgController = PageController(initialPage: 1);

  List<String> imageList = ['Elysium_Planitia',
    'Gordi_Dorsum',
    'Iani_Chaos',
    'Lava_Channel',
    'Utopia_Planitia'
  ];

  List<String> nameList = ['Elysium Planitia',
    'Gordi Dorsum',
    'Iani Chaos',
    'Lava Channel',
    'Utopia Planitia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(gradient: const LinearGradient(colors:[Colors.deepPurple, Colors.cyan]),
          title: const Text('Choose a Map'),
        ),
        body: Column(
            children: <Widget>[
              Expanded(flex: 9,
                  child: PageView.builder(
                      controller: pgController,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: imageList.length,
                      itemBuilder: (context,index) {
                        return mapImage(context, index);
                      }
                  )
              ),
              Expanded(
                flex: 1,
                child: SmoothPageIndicator(
                  controller: pgController,
                  count: imageList.length,
                  effect: const ScrollingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 10,
                    activeDotColor: Colors.white,
                  ),
                ),
              )
            ]
        ));
  }

  Widget mapImage(BuildContext context, int index) {
    return Column(
      children: <Widget> [
        SizedBox(
            height: 400,
            width: 400,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Pilot(img: imageList[index]),
                    ));
              },
              icon: Image.asset('assets/images/${imageList[index]}_1000x1000.png'),
              splashRadius: 400,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: <Widget> [
                Text(nameList[index], style: const TextStyle(fontSize: 32)),
                const Text('Mars', style: TextStyle(fontSize: 20, height: 2))
              ],
            )
        )
      ],
    );
  }
}
