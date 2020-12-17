import 'package:flutter/material.dart';
import '../../ListItem/BrandDataList.dart';
import '../../UI/BrandUIComponent/Chat.dart';

class BrandDetail extends StatefulWidget {
  @override
  final Brand brand;
  BrandDetail(this.brand);
  _BrandDetailState createState() => _BrandDetailState(brand);
}

class _BrandDetailState extends State<BrandDetail> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final Brand brand;
  _BrandDetailState(this.brand);
  String notif = "Notifications";

  final _fontCostumSheetBotomHeader = TextStyle(
      fontFamily: "Berlin",
      color: Colors.black54,
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  final _fontCostumSheetBotom = TextStyle(
      fontFamily: "Sans",
      color: Colors.black45,
      fontWeight: FontWeight.w400,
      fontSize: 16.0);

  void _modalBottomSheetSort() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 320.0,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("SORT BY", style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Popularity",
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "New",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Discount",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: High-Low",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: Log-High",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  void _modalBottomSheetRefine() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 320.0,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("REFINE BY", style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Popularity",
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "New",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Discount",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: High-Low",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: Low-High",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    final hero = Hero(
      tag: 'hero-tag-${brand.id}',
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(brand.img),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 130.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  new Color(0x00FFFFFF),
                  new Color(0xFFFFFFFF),
                ],
                stops: [
                  0.0,
                  1.0
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0)),
          ),
        ),
      ),
    );

    return Scaffold(
      key: _key,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            expandedHeight: 380.0,
            elevation: 0.1,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  brand.name,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontFamily: "Popins",
                      fontWeight: FontWeight.w700),
                ),
                background: Material(
                  child: hero,
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                      child: Container(
                        height: 370.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 20.0, right: 20.0),
                              child: Text(
                                brand.desc,
                                style: TextStyle(
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 40.0)),
                            ButtonCustom(
                              color: Color(0xFFC2912E),
                              txt: "Message",
                              ontap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        new Privatemessage(brand)));
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0)),
                            ButtonCustom(
                              color: Color(0xFF585858),
                              txt: notif,
                              ontap: () {
                                var snackBar = SnackBar(
                                  content: Text(brand.name + " Notificated"),
                                  action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {
                                        setState(() {
                                          if (notif == "Notifications") {
                                            notif = "Notificated";
                                          } else {
                                            notif = "Notifications";
                                          }
                                        });
                                      }),
                                );
                                setState(() {
                                  if (notif == "Notifications") {
                                    notif = "Notificated";
                                  } else {
                                    notif = "Notifications";
                                  }
                                });
                                _key.currentState.showSnackBar(snackBar);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    Container(
                      height: 50.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 1.0,
                              spreadRadius: 1.0),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: _modalBottomSheetSort,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),
                                Padding(padding: EdgeInsets.only(right: 10.0)),
                                Text(
                                  "Sort",
                                  style: _fontCostumSheetBotomHeader,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 45.9,
                                width: 1.0,
                                decoration:
                                    BoxDecoration(color: Colors.black12),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: _modalBottomSheetRefine,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),
                                Padding(padding: EdgeInsets.only(right: 0.0)),
                                Text(
                                  "Refine",
                                  style: _fontCostumSheetBotomHeader,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF656565).withOpacity(0.15),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
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
                            height: mediaQueryData.size.height / 3.5,
                            width: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7.0),
                                    topRight: Radius.circular(7.0)),
                                image: DecorationImage(
                                    image: AssetImage(brand.item.itemImg),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              brand.item.itemName,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  color: Colors.black54,
                                  fontFamily: "Sans",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 1.0)),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              brand.item.itemPrice,
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      brand.item.itemRatting,
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
                                  brand.item.itemSale,
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
                );
              },
              childCount: 4,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 7.0,
              crossAxisSpacing: 7.0,
              childAspectRatio: 0.605,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final GestureTapCallback ontap;

  ButtonCustom({this.txt, this.color, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontFamily: "Sans"),
        )),
      ),
    );
  }
}
