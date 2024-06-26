
import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/Placement/MessageModel.dart';
import 'package:collegopedia/Placement/TIleMode.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CompanySpecificPlacementPage extends StatefulWidget {
  String s;

  CompanySpecificPlacementPage(this.s);

  @override
  _CompanySpecificPlacementPageState createState() =>
      _CompanySpecificPlacementPageState();
}

class _CompanySpecificPlacementPageState
    extends State<CompanySpecificPlacementPage> {
  Map<String, double> dataMap = Map();
  Map<String, double> apptiDataMap = Map();
  Map<String, double> placeDataMap = Map();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apptiDataMap.putIfAbsent('Difficult', () => 0);
    apptiDataMap.putIfAbsent('Easy', () => 0);
    apptiDataMap.putIfAbsent('Very Easy', () => 0);
    apptiDataMap.putIfAbsent('Medium', () => 0);
    apptiDataMap.putIfAbsent('Very Difficult', () => 0);
    placeDataMap.putIfAbsent('Difficult', () => 0);
    placeDataMap.putIfAbsent('Easy', () => 0);
    placeDataMap.putIfAbsent('Very Easy', () => 0);
    placeDataMap.putIfAbsent('Medium', () => 0);
    placeDataMap.putIfAbsent('Very Difficult', () => 0);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1F2D),
      drawer: DrawerrBarr(),
      appBar: AppBar(
        title: Text("Placement Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: StreamBuilder(
              stream: FirebaseDatabase()
                  .reference()
                  .child('Placements')
                  .child(widget.s)
                  .onValue,
              builder: (context, snap) {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map<dynamic, dynamic> data = snap.data.snapshot.value;
                  List<MessageModel> listOfMessage = [];
                  //print(data.toString());
                  data.forEach((index, data) {
                    //print(data["mode"]);
                    MessageModel m = MessageModel(
                        companyName: widget.s,
                        role: data["role"].toString(),
                        name: data["name"].toString(),
                        description: data["description"].toString(),
                        apptitude: data["apptitude"].toString(),
                        interview: data["personal"].toString(),
                        batch: data["batch"].toString(),
                        mode: data["mode"].toString(),
                        branch: data["branch"],
                        clg: data["clg"]);

                    apptiDataMap.putIfAbsent(data["apptitude"].toString().split('-')[1].replaceFirst(' ', ''), () => 1);
                    apptiDataMap.update(data["apptitude"].toString().split('-')[1].replaceFirst(' ', ''), (value) => value +1,);
                    placeDataMap.putIfAbsent(data["personal"].toString().split('-')[1].replaceFirst(' ', ''), () => 1);
                    placeDataMap.update(data["personal"].toString().split('-')[1].replaceFirst(' ', ''), (value) => value +1,);
                    print(apptiDataMap);
                    listOfMessage.add(m);
                  });

                  print(listOfMessage.length);

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    itemCount: listOfMessage.length,
                    itemBuilder: (context, index) {
                      return index == 0 ? ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text("Initial Round Difficulty level"),
                                  Pie(apptiDataMap),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text("Personal Interview Difficulty level"),
                                  Pie(placeDataMap),
                                ],
                              ),
                            ),

                            TileDisplay(listOfMessage[index])
                          ],
                        ),
                      ): ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TileDisplay(listOfMessage[index])
                          ],
                        ),
                      );
                    },
                  );
                } else
                  return Center(child: Text("No data"));
              }),
        ),
      ),
    );
  }
}

class Pie extends StatefulWidget {
  Map<String, double> dataMap = Map();
  Pie(this.dataMap);
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {

  Map<String, double> dataMap = Map();
 // _PieState(this.dataMap);
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataMap = widget.dataMap;

  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 1200),
      chartLegendSpacing: 32.0,
      chartRadius: MediaQuery.of(context).size.width / 2.5,
      showChartValuesInPercentage: true,
      showChartValues: true,
      showChartValuesOutside: false,
      chartValueBackgroundColor: Colors.grey[200],
      colorList: colorList,
      showLegends: true,
      legendPosition: LegendPosition.right,
      decimalPlaces: 0,
      showChartValueLabel: false,
      initialAngle: 0,
//      chartValueStyle: defaultChartValueStyle.copyWith(
//        color: Colors.blueGrey[900].withOpacity(0.9),
//      ),
      chartType: ChartType.disc,
    );
  }
}
