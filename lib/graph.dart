import 'package:dijkstra/dijkstra.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

List<List<int>> terrain = List<List<int>>.empty(growable:true);
Map<int, Map<int, int>> graph = {};

List<int> coordinateConv(int node) {
  int x = node % 40;
  int y = node ~/ 40;
  List<int> out = [x, y];
  return out;
}

void weightEval(int node1, int node2) {

}

void dataImport(String filename) {
  var fPath = path.join("assets/datafiles", filename);
  File file = File(fPath);
  var content = file.readAsLinesSync();
  for (int i = 0; i < content.length; i++){
    List<int> temp = List<int>.empty(growable:true);
    terrain.add(temp);
    var lineSplit = content[i].replaceAll("[", "").replaceAll("]", "");
    List<String> lineSplitLst = lineSplit.split(", ");
    for (int j = 0; j < lineSplitLst.length; j++){
      terrain[i].add(int.parse(lineSplitLst[j]));
    }
  }
}

void convertToGraph(List<List<int>> data) {
  int curKey = 0;
  // iterate over all rows of input data
  for (int i = 0; i < data.length; i++) {
    // iterate over all columns of input data
    for (int j = 0; j < data[0].length; j++) {
      graph[curKey] = {};            // initialize a K,V pair using current clk
      // establish neighbor connections
      if (i != data.length - 1) {    // ensure not at bottom edge of dataset
        graph[curKey]?.addAll({curKey + data[0].length : 1}); // bottom neighbor
      }
      if (i != 0) {             // ensure not at top edge of dataset
        graph[curKey]?.addAll({curKey - data[0].length : 1}); // upper neighbor
      }
      if (j != data[0].length - 1) { // ensure not at right edge of dataset
        graph[curKey]?.addAll({curKey + 1 : 1});              // right neighbor
      }
      if (j != 0) {             // ensure not at left edge of dataset
        graph[curKey]?.addAll({curKey - 1 : 1});              // left neighbor
      }
      curKey++;
    }
  }
}

List<dynamic> dijkstras(Map<int, Map<int, int>> adjacency, int start, int finish) {
  List<dynamic> solutionArray;

  solutionArray = Dijkstra.findPathFromGraph(adjacency, start, finish);
  return solutionArray;
}

int main() {
  dataImport("Lava_Channel.txt");
  convertToGraph(terrain);
  print(dijkstras(graph, 1276, 589));
  return 0;
}
