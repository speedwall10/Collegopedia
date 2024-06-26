//import 'package:flutter/material.dart';
//
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//// import 'package:firebase_core/firebase_core.dart'; not nessecary
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData.dark(),
//      home: Home(),
//    );
//  }
//}
//
//class Home extends StatefulWidget {
//  @override
//  HomeState createState() => HomeState();
//}
//
//class HomeState extends State<Home> {
//  List<Item> items = List();
//  Item item;
//  DatabaseReference itemRef;
//
//  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//  @override
//  void initState() {
//    super.initState();
//    item = Item("", "");
//    final FirebaseDatabase database = FirebaseDatabase
//        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
//    itemRef = database.reference().child('sss');
//    itemRef.onChildAdded.listen(_onEntryAdded);
//    itemRef.onChildChanged.listen(_onEntryChanged);
//  }
//
//  _onEntryAdded(Event event) {
//    setState(() {
//      items.add(Item.fromSnapshot(event.snapshot));
//    });
//  }
//
//  _onEntryChanged(Event event) {
//    var old = items.singleWhere((entry) {
//      return entry.key == event.snapshot.key;
//    });
//    setState(() {
//      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
//    });
//  }
//
//  void handleSubmit() {
//    final FormState form = formKey.currentState;
//
//    if (form.validate()) {
//      form.save();
//      form.reset();
//      itemRef.push().set(item.toJson());
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('FB example'),
//      ),
//      resizeToAvoidBottomPadding: false,
//      body: Column(
//        children: <Widget>[
//          Flexible(
//            flex: 0,
//            child: Center(
//              child: Form(
//                key: formKey,
//                child: Flex(
//                  direction: Axis.vertical,
//                  children: <Widget>[
//                    ListTile(
//                      leading: Icon(Icons.info),
//                      title: TextFormField(
//                        initialValue: "",
//                        onSaved: (val) => item.title = val,
//                        validator: (val) => val == "" ? val : null,
//                      ),
//                    ),
//                    ListTile(
//                      leading: Icon(Icons.info),
//                      title: TextFormField(
//                        initialValue: '',
//                        onSaved: (val) => item.body = val,
//                        validator: (val) => val == "" ? val : null,
//                      ),
//                    ),
//                    IconButton(
//                      icon: Icon(Icons.send),
//                      onPressed: () {
//                        handleSubmit();
//                      },
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Flexible(
//            child: FirebaseAnimatedList(
//              query: itemRef,
//              itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                  Animation<double> animation, int index) {
//                return new ListTile(
//                  leading: Icon(Icons.message),
//                  title: Text(items[index].title),
//                  subtitle: Text(items[index].body),
//                );
//              },
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class Item {
//  String key;
//  String title;
//  String body;
//
//  Item(this.title, this.body);
//
//  Item.fromSnapshot(DataSnapshot snapshot)
//      : key = snapshot.key,
//        title = snapshot.value["title"],
//        body = snapshot.value["body"];
//
//  toJson() {
//    return {
//      "title": title,
//      "body": body,
//    };
//  }
//}

//// Main
//ListView(
//padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
//children: <Widget>[
//Container(
//child: TextField(
//maxLength: 30,
//decoration: InputDecoration(hintText: "Enter your Name"),
//onChanged: (value) {
//item.name = value;
//},
//),
//),
//Container(
//child: TextField(
//decoration: InputDecoration(hintText: 'Enter your Company Name'),
//maxLength: 20,
//onChanged: (value) {
//item.companyName = value;
//},
//),
//),
//Container(
//child: TextField(
//decoration: InputDecoration(hintText: 'Share your Experience'),
//maxLength: 300,
//maxLines: 10,
//maxLengthEnforced: false,
//onChanged: (value) {
//item.description = value;
//},
//),
//),
//Container(
//color: Colors.blue,
//child: FlatButton(
//onPressed: () {
//itemRef.push().set(item.toJson());
//updatesPlacementPage();
//showAlertDialog(context);
//},
//child: Text('Submit')),
//)
//],
//)
