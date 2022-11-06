import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Pilot extends StatefulWidget {
  final String img;

  Pilot({super.key, required this.img});

  @override
  State<Pilot> createState() => _PilotState();
}

class _PilotState extends State<Pilot> {

  void initState() {
    super.initState();
  }
  int initY = 0;
  int initX = 0;

  int endY = 0;
  int endX = 0;

  bool initMarker = false;

  List<List<int>> samplePath = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(gradient: const LinearGradient(colors:[Colors.deepPurple, Colors.cyan]),
        title: const Text('Choose Location'),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              InteractiveViewer(
                panEnabled: false,
                scaleEnabled: false,
                onInteractionUpdate: (v) {
                  setState((){
                    if (!initMarker) {
                      initMarker = true;
                      initX = v.localFocalPoint.dx ~/ 10;
                      initY = v.localFocalPoint.dy ~/ 10;
                    }
                    else {
                      endX = v.localFocalPoint.dx ~/ 10;
                      endY = v.localFocalPoint.dy ~/ 10;
                    }
                  });
                },
                child: Image.asset(widget.img,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                left: 10 * initX.toDouble(),
                top: 10 * initY.toDouble(),
                child: SizedBox(
                  width: 50,
                    child:Image.asset('assets/images/marker_1.png')
                )
            ),
            Positioned(
                left: 10 * endX.toDouble(),
                top: 10 * endY.toDouble(),
                child: SizedBox(
                    width: 50,
                    child:Image.asset('assets/images/marker_1.png')
                )
            ),
              for(int i = 0 ; i < samplePath.length ; i++)
                Positioned(
                  left: 10 * samplePath[i][0].toDouble(),
                  top: 10 * samplePath[i][1].toDouble(),
                  child: Icon(Icons.circle, size: 11.0, color: Colors.cyanAccent)
                ),

            ],
          ),
          SizedBox(height: 20),
          Text('Starting Coordinate: (${initX.toString()}, ${initY.toString()})'),
          SizedBox(height: 10),
          Text('Ending Coordinate: (${endX.toString()}, ${endY.toString()})'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              TextButton(
                  onPressed: () {
                    setState(() {
                      createPath();
                    });
                  },
                  style: TextButton.styleFrom(
                      fixedSize: Size(100, 40),
                      shape: StadiumBorder(side: BorderSide(color: Colors.white))
                  ),
                  child: const Text('Navigate')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      initMarker = false;
                      initY = 0;
                      initX = 0;

                      endY = 0;
                      endX = 0;
                    });
                  },
                  style: TextButton.styleFrom(
                      fixedSize: Size(100, 40),
                      shape: StadiumBorder(side: BorderSide(color: Colors.white))
                  ),
                  child: const Text('Reset'))
            ],
          )
        ],
      ),
    );
  }
  void createPath() {
    List<int> sp = [1276, 1236, 1196, 1156, 1116, 1076, 1036, 996, 956, 916, 876, 836, 796, 756, 716, 676, 636, 635, 634, 633, 632, 631, 630, 629, 589];
    List<List<int>> temp = [];
    for (int node in sp) {
      int x = node % 40;
      int y = node ~/ 40;
      List<int> t = [x, y];
      temp.add(t);
    }

    setState(() {
      samplePath = temp;
    });
  }
}