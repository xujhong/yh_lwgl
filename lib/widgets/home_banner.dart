import 'package:flutter/material.dart';
import 'package:yh_lwgl/model/banner_model.dart';
import 'package:yh_lwgl/widgets/sliderIndicator.dart';

class HomeBanner extends StatefulWidget {
  List<BannerModel> bannerModel = [
    BannerModel(
        title: "",
        strUrl:
            "http://imgsrc.baidu.com/imgad/pic/item/6159252dd42a2834545beb3750b5c9ea15cebf09.jpg"),
    BannerModel(
        title: "",
        strUrl:
            "http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=4c437c28a6af2eddc0fc41aae5796b9c/a2cc7cd98d1001e9034b1621b20e7bec54e797ac.jpg"),
    BannerModel(
        title: "",
        strUrl:
            "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=210630134,3919397130&fm=173&app=49&f=JPEG?w=640&h=427&s=16B6C72472146DC84E9C58D30100C0B0"),
    BannerModel(
        title: "",
        strUrl: "http://pic21.photophoto.cn/20111208/0016028177620653_b.jpg"),
  ];

  @override
  _homeBanner createState() => _homeBanner();
}

class _homeBanner extends State<HomeBanner> {
  PageController _controller;
  int sliderIndex = 0;
  bool runing = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController();
    run();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void run() async {
    this.runing = true;
    while (this.runing) {
      await Future.delayed(new Duration(seconds: 5));
      if (mounted) {
        this.setState(() {
          this.sliderIndex = this.sliderIndex == widget.bannerModel.length - 1
              ? 0
              : this.sliderIndex + 1;
          this._controller.animateToPage(this.sliderIndex,
              duration: new Duration(milliseconds: 600),
              curve: Curves.easeInOut);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 0.0,
          child: AspectRatio(
              aspectRatio: 9.0 / 5.0,
              child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      sliderIndex = index;
                    });
                  },
                  children: widget.bannerModel
                      .map((banner) => GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: NetworkImage(banner.strUrl),
                              fit: BoxFit.fill,
                            ),
                          ))
                      .toList())),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Sliderindication(
            count: widget.bannerModel.length,
            index: sliderIndex,
          ),
        )
      ],
    );
  }
}
