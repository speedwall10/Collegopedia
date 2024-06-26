import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class MobileDeveloperPage extends StatefulWidget {
  @override
  _MobileDeveloperPageState createState() => _MobileDeveloperPageState();
}

class _MobileDeveloperPageState extends State<MobileDeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Mobile App Developer")),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFF0E0F1B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Tile(
                  heading: 'Mobile App Developer',
                  txt:
                      'So the question arises “What is the role of a Mobile App Developer?”'
                      'Mobile app developers create apps on iOS or Android devices and maintain these apps over time. For example, an app developer'
                      ' may be tasked with creating an app which allows customers to track deliveries on their phone; they may have to build a '
                      'feature on a social network.'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'How to become a Mobile App Developer?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Times new Roman',
                    ),
                  ),
                ),
              ),
              Tile(
                heading: 'Choose one of the major platforms.',
                txt: 'The major platforms are Android, Apple Ios.',
              ),
              Tile(
                heading: 'Choose the tools for opting App development',
                txt:
                    'There are many tools available to opt from but we will suggest you to use Android Studio with Kotlin in case of Android App Development '
                    'and use Xcode with Swift in case of Ios app development. These tools are old and native and thats why they have large market and community to support them'
                    'Also while searching for jobs related to Mobile app development one of these tool is mandatory, so choose wisely',
              ),
              Tile(
                heading: 'From where to learn ?',
                txt:
                    'There are many free resources available for both and also you can learn from official documentation, they are really good.',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Text(
                      'Check out other sections to prepare and apply for jobs and much more...  Click here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Times new Roman',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Not Completed
