import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

// ignore: must_be_immutable
class Home extends KFDrawerContent {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bg.jpeg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 3),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.teal[900],
                          size: 30,
                        ),
                      ),
                      hintText: "Search",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.teal),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}
