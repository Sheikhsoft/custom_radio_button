# custom_radio_button

[![pub package](https://img.shields.io/pub/v/custom_radio_button.svg)](https://pub.dartlang.org/packages/custom_radio_button)

A Flutter package for iOS and Android for Custom Radio Button.

## Demo
<img src="http://sheikhsoft.com/screensort/custom_radio_button_1.png" width="340" height="640" title="Screen Shoot">
<img src="http://sheikhsoft.com/screensort/custom_radio_button_2.png" width="340" height="640" title="Screen Shoot">

## Installation

First, add `custom_radio_button` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### iOS

No configuration required - the plugin should work out of the box.

### Android

No configuration required - the plugin should work out of the box.

### Code for the Square Radio Group widget

``` dart
import 'package:custom_radio_button/custom_radio_button.dart';
import 'package:custom_radio_button/radio_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedValue;
  
 
  @override
  Widget build(BuildContext context) {
  List<RadioModel> priorityList = new List<RadioModel>();
        priorityList.add(new RadioModel(false, null, 'Heigh', Colors.redAccent));
        priorityList
            .add(new RadioModel(false, null, 'Medium', Colors.deepPurple));
        priorityList
            .add(new RadioModel(false, null, 'Slight', Colors.blueAccent));
        priorityList
            .add(new RadioModel(false, null, 'Normal', Colors.purpleAccent));
    return CustomRadioGroupWidget(
                           onChanged: getvalue,
                           isSquareRadioGroup: true,
                           radioList: priorityList,
                         );
  }
  void getvalue(Map value) {
      _selectedValue = value;
    }
}
```

### Code for the Round Radio Group widget

``` dart
import 'package:custom_radio_button/custom_radio_button.dart';
import 'package:custom_radio_button/radio_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedValue;
  
 
  @override
  Widget build(BuildContext context) {
  List<RadioModel> incidentTypeList = new List<RadioModel>();
        incidentTypeList.add(new RadioModel(
            false,
            Icon(
              Icons.whatshot,
              color: Colors.blue,
            ),
            'Fire',
            Colors.red));
        incidentTypeList.add(new RadioModel(
            false,
            Icon(
              Icons.face,
              color: Colors.red,
            ),
            'Near Miss',
            Colors.deepPurple));
        incidentTypeList.add(new RadioModel(
            false,
            Icon(
              Icons.directions_car,
              color: Colors.deepOrange,
            ),
            'Accident',
            Colors.blueAccent));
        incidentTypeList.add(new RadioModel(
            false,
            Icon(
              Icons.directions_run,
              color: Colors.greenAccent,
            ),
            'Theft',
            Colors.purpleAccent));
        incidentTypeList.add(new RadioModel(
            false,
            Icon(
              Icons.business,
              color: Colors.yellow,
            ),
            'Property damage',
            Colors.greenAccent));
    return CustomRadioGroupWidget(
                           onChanged: getvalue,
                           isSquareRadioGroup: false,
                           radioList: incidentTypeList,
                         );
  }
  void getvalue(Map value) {
      _selectedValue = value;
    }
}
```

### Code for the Full page Radio Group Widget

``` dart
import 'package:custom_radio_button/full_page_radio_group.dart';

class RadioGroupPage extends StatelessWidget {
  final Map mapData;
  const RadioGroupPage({Key key, this.mapData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return new FullPageRadioGroup(
        
        isSquareRadioGroup: false,
        title: "What happended?",
        route: "/fourth",
        mapData: mapData,
        mapKey: 'incidentType');
  }
}
```