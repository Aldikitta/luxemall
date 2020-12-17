import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniteloop/Library/carousel_pro/src/carousel_pro.dart';
import 'package:infiniteloop/UI/HomeUIComponent/AppbarGradient.dart';
import 'package:infiniteloop/UI/HomeUIComponent/CategoryDetail.dart';
import 'package:infiniteloop/bloc/postEvent.dart';
import 'package:infiniteloop/uis/postItem.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  ScrollController controller = ScrollController();
  PostBloc bloc;

  bool isStarted = false;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currenScroll = controller.position.pixels;

    if (currenScroll == maxScroll) bloc.add(PostEvent());
  }

  imageSlider() {
    return Container(
      height: 182.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xffffffff).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/img/luxemall1.jpg"),
          AssetImage("assets/img/luxemall2.jpg"),
          AssetImage("assets/img/luxemall3.jpg"),
          AssetImage("assets/img/luxemall4.jpg"),
          AssetImage("assets/img/luxemall5.jpg"),
        ],
      ),
    );
  }

  onClickCategory() {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => new CategoryDetail(),
        transitionDuration: Duration(milliseconds: 750),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        },
      ),
    );
  }

  categoryImageBottom() {
    return Container(
      height: 180.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Text(
              "Category",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Sans"),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category2.png",
                        title: "Fashion Man",
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category1.png",
                        title: "Fashion Woman",
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category8.png",
                        title: "Jewelery",
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category3.png",
                        title: "Electronics",
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    controller.addListener(onScroll);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppbarGradient(),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageSlider(),
            categoryImageBottom(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                "Recomended",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0,
                ),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.white,
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostUnitialized)
                      return Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    else {
                      PostLoaded postLoaded = state as PostLoaded;
                      return GridView.builder(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        shrinkWrap: true,
                        // primary: false,
                        itemCount: (postLoaded.hasReachedMax)
                            ? postLoaded.posts.length
                            : postLoaded.posts.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.545,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 17.0,
                        ),
                        itemBuilder: (context, index) =>
                            (index < postLoaded.posts.length)
                                ? PostItem(postLoaded.posts[index])
                                : Container(
                                    child: Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItemValue extends StatelessWidget {
  final String image, title;
  final GestureTapCallback tap;

  CategoryItemValue({
    this.image,
    this.title,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 105.0,
        width: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            color: Colors.black.withOpacity(0.25),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Berlin",
              fontSize: 18.5,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w800,
            ),
          )),
        ),
      ),
    );
  }
}
