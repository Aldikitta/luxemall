import 'package:flutter/material.dart';

class SearchAppbar extends StatefulWidget {
  @override
  _SearchAppbarState createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  var _textHello = Padding(
    padding: const EdgeInsets.only(right: 50.0, left: 20.0),
    child: Text(
      "Hello, Luxemall here. What would you like to search ?",
      style: TextStyle(
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
          fontSize: 27.0,
          color: Colors.black54,
          fontFamily: "Gotik"),
    ),
  );

  var _search = Padding(
    padding: const EdgeInsets.only(top: 35.0, right: 20.0, left: 20.0),
    child: Container(
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15.0,
                spreadRadius: 0.0)
          ]),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Theme(
            data: ThemeData(hintColor: Colors.transparent),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFFC2912E),
                    size: 28.0,
                  ),
                  hintText: "Find you want",
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Gotik",
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ),
      ),
    ),
  );

  var _sugestedText = Container(
    height: 145.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Populer Keyword",
            style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20.0)),
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20.0)),
            KeywordItem(
              title: "Montblanc",
              title2: "Perfume",
            ),
            KeywordItem(
              title: "Calvin Klein",
              title2: "Skincare",
            ),
            KeywordItem(
              title: "Lipstick",
              title2: "Bvlgari",
            ),
            KeywordItem(
              title: "Davidoff",
              title2: "Serum",
            ),
          ],
        ))
      ],
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        title: Text(
          "Search",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Caliing a variable
                _textHello,
                _search,
                _sugestedText,
                Padding(padding: EdgeInsets.only(bottom: 30.0, top: 2.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KeywordItem extends StatelessWidget {
  final String title, title2;

  KeywordItem({this.title, this.title2});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 3.0),
          child: Container(
            height: 29.5,
            width: 90.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Container(
          height: 29.5,
          width: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.5,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Center(
            child: Text(
              title2,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Sans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
