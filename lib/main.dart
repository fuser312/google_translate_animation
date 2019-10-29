import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: GoogleTranslateApp(),
));

class GoogleTranslateApp extends StatefulWidget {
  @override
  _GoogleTranslateAppState createState() => _GoogleTranslateAppState();
}

class _GoogleTranslateAppState extends State<GoogleTranslateApp>
    with SingleTickerProviderStateMixin {
  int count = 0;
  String firstLan = 'English';
  String secondLan = 'Indonesian';
  AnimationController animationController;
  Animation<Offset> tweenOffSet;
  bool myControllerstatus = true;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    count++;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                'Google',
                style: TextStyle(fontFamily: 'Sans'),
              ),
            ),
            Text(
              'Translate',
              style: TextStyle(fontFamily: 'Sans'),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: <Widget>[
                AlignTransition(
                  alignment: Tween(
                      begin: Alignment(-1.0, 0.0), end: Alignment(1.0, 0.0))
                      .animate(animationController),
                  child: languagesListFirstRow(),
                ),
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Transform.rotate(
                    angle: Tween(begin: 0.0, end: 5.0)
                        .transform(animationController.value),
                    child: IconButton(
                      onPressed: () {
                        if (myControllerstatus) {
                          animationController.forward();
                          myControllerstatus = false;
                        } else if (myControllerstatus == false) {
                          animationController.reverse();
                          myControllerstatus = true;
                        }
                      },
                      icon: Icon(Icons.swap_horiz),
                      color: Colors.blue,
                    ),
                  ),
                ),
                AlignTransition(
                  alignment: Tween(
                      begin: Alignment(1.0, 0.0), end: Alignment(-1.0, 0.0))
                      .animate(animationController),
                  child: languagesListSecondRow(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DropdownButton<String> languagesListFirstRow() {
    return DropdownButton(
      underline: Container(color: Colors.white, height: 1.0),
      style: TextStyle(color: Colors.blue),
      iconEnabledColor: Colors.blue,
      value: firstLan,
      elevation: 5,
      onChanged: (selectedLanguage) {
        firstLan = selectedLanguage;
        setState(() {});
      },
      items: ['English', 'Indonesian']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  DropdownButton<String> languagesListSecondRow() {
    return DropdownButton(
      underline: Container(color: Colors.white, height: 1.0),
      style: TextStyle(color: Colors.blue),
      iconEnabledColor: Colors.blue,
      value: secondLan,
      elevation: 5,
      onChanged: (selectedLanguage) {
        secondLan = selectedLanguage;
        setState(() {});
      },
      items: ['Indonesian', 'English']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//comment.