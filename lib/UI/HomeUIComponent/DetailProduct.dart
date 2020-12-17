import 'package:infiniteloop/Library/carousel_pro/src/carousel_pro.dart';

import '../../Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import '../../UI/CartUIComponent/CartLayout.dart';
import '../../model/post.dart';
import '../../model/postCart.dart';

class DetailProduk extends StatefulWidget {
  final Post posts;

  DetailProduk(this.posts);

  @override
  _DetailProdukState createState() => _DetailProdukState(posts);
}

class _DetailProdukState extends State<DetailProduk> {
  ApiModel apiService;
  @override
  void initState() {
    super.initState();
    apiService = ApiModel();
  }

  Future<void> _getData() async {
    setState(() {
      apiService = ApiModel();
    });
  }

  final Post posts;
  _DetailProdukState(this.posts);

  @override
  static BuildContext ctx;
  int valueItemChart = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void _bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  height: 1500.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Container(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            posts.description,
                            style: _subHeaderCustomStyle,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.",
                            style: _detailText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Spesifications :",
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                              color: Colors.black,
                              letterSpacing: 0.3,
                              wordSpacing: 0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Text(
                          " - Lorem ipsum is simply dummy  ",
                          style: _detailText,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static var _customTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Gotik",
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
  );

  static var _subHeaderCustomStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontFamily: "Gotik",
      fontSize: 16.0);

  static var _detailText = TextStyle(
      fontFamily: "Gotik",
      color: Colors.black54,
      letterSpacing: 0.3,
      wordSpacing: 0.5);

  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              apiService.getDetail();
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new Cart(),
                ),
              );
              print(apiService.id);
            },
            child: Stack(
              alignment: AlignmentDirectional(-1.0, -0.8),
              children: <Widget>[
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black26,
                    )),
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                  child: Text(
                    valueItemChart.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 13.0),
                  ),
                ),
              ],
            ),
          ),
        ],
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Produk Detail",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black54,
            fontSize: 17.0,
            fontFamily: "Gotik",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 300.0,
                    child: Hero(
                      tag: "hero-grid-${posts.id}",
                      child: Material(
                        child: new Carousel(
                          dotColor: Colors.black26,
                          dotIncreaseSize: 1.7,
                          dotBgColor: Colors.transparent,
                          autoplay: false,
                          boxFit: BoxFit.cover,
                          images: [
                            NetworkImage(posts.image),
                            NetworkImage(posts.image),
                            NetworkImage(posts.image),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Color(0xFF656565).withOpacity(0.15),
                        blurRadius: 1.0,
                        spreadRadius: 0.2,
                      )
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts.title,
                            style: _customTextStyle,
                          ),
                          Padding(padding: EdgeInsets.only(top: 5.0)),
                          Text(
                            posts.price.toString(),
                            style: _customTextStyle,
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Divider(
                            color: Colors.black12,
                            height: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 220.0,
                      width: 600.0,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Color(0xFF656565).withOpacity(0.15),
                          blurRadius: 1.0,
                          spreadRadius: 0.2,
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Size", style: _subHeaderCustomStyle),
                            Row(
                              children: <Widget>[
                                RadioButtonCustom(
                                  txt: "S",
                                ),
                                Padding(padding: EdgeInsets.only(left: 15.0)),
                                RadioButtonCustom(
                                  txt: "M",
                                ),
                                Padding(padding: EdgeInsets.only(left: 15.0)),
                                RadioButtonCustom(
                                  txt: "L",
                                ),
                                Padding(padding: EdgeInsets.only(left: 15.0)),
                                RadioButtonCustom(
                                  txt: "XL",
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0)),
                            Text(
                              "Color",
                              style: _subHeaderCustomStyle,
                            ),
                            Row(
                              children: <Widget>[
                                RadioButtonColor(Colors.black),
                                Padding(padding: EdgeInsets.only(left: 15.0)),
                                RadioButtonColor(Colors.white),
                                Padding(padding: EdgeInsets.only(left: 15.0)),
                                RadioButtonColor(Colors.blue),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: 205.0,
                      width: 600.0,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Color(0xFF656565).withOpacity(0.15),
                          blurRadius: 1.0,
                          spreadRadius: 0.2,
                        )
                      ]),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Description",
                                  style: _subHeaderCustomStyle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0,
                                    right: 20.0,
                                    bottom: 10.0,
                                    left: 20.0),
                                child:
                                    Text(posts.description, style: _detailText),
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    _bottomSheet();
                                  },
                                  child: Text(
                                    "View More",
                                    style: TextStyle(
                                      color: Color(0xFFC2912E),
                                      fontSize: 15.0,
                                      fontFamily: "Gotik",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              var snackbar = SnackBar(
                content: Text("Item Added"),
              );
              setState(() {
                valueItemChart++;
              });
              _key.currentState.showSnackBar(snackbar);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.white12.withOpacity(0.1),
                          border: Border.all(color: Colors.black12)),
                      child: Center(
                        child: Image.asset(
                          "assets/icon/shopping-cart.png",
                          height: 23.0,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFC2912E),
                        ),
                        child: Center(
                          child: Text(
                            "Pay",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RadioButtonCustom extends StatefulWidget {
  final String txt;

  RadioButtonCustom({this.txt});

  @override
  _RadioButtonCustomState createState() => _RadioButtonCustomState(this.txt);
}

class _RadioButtonCustomState extends State<RadioButtonCustom> {
  _RadioButtonCustomState(this.txt);

  String txt;
  bool itemSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (itemSelected == false) {
              setState(() {
                itemSelected = true;
              });
            } else if (itemSelected == true) {
              setState(() {
                itemSelected = false;
              });
            }
          });
        },
        child: Container(
          height: 37.0,
          width: 37.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: itemSelected ? Colors.black54 : Color(0xFFC2912E)),
              shape: BoxShape.circle),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                  color: itemSelected ? Colors.black54 : Color(0xFFC2912E)),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioButtonColor extends StatefulWidget {
  final Color clr;

  RadioButtonColor(this.clr);

  @override
  _RadioButtonColorState createState() => _RadioButtonColorState(this.clr);
}

class _RadioButtonColorState extends State<RadioButtonColor> {
  bool itemSelected = true;
  Color clr;

  _RadioButtonColorState(this.clr);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          if (itemSelected == false) {
            setState(() {
              itemSelected = true;
            });
          } else if (itemSelected == true) {
            setState(() {
              itemSelected = false;
            });
          }
        },
        child: Container(
          height: 37.0,
          width: 37.0,
          decoration: BoxDecoration(
              color: clr,
              border: Border.all(
                  color: itemSelected ? Colors.black26 : Colors.indigoAccent,
                  width: 2.0),
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String image, rating, salary, title, sale;

  FavoriteItem({this.image, this.rating, this.salary, this.title, this.sale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    salary,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            rating,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        sale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
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
