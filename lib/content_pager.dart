import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_appbar.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  const ContentPager({Key key, this.onPageChanged, this.contentPagerController}) : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = new PageController(viewportFraction: 0.8);
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];

  @override
  void initState() {
    _statuBar();
    if(widget.contentPagerController!=null){
       widget.contentPagerController._pageController= _pageController;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _wrapItem(0),
              _wrapItem(1),
              _wrapItem(2),
              _wrapItem(3),
            ],
          ),
        )
      ],
    );
  }

  Widget _wrapItem(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: _colors[index]),
      ),
    );
  }

  ///设置沉浸式状态栏
  _statuBar(){
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

class ContentPagerController{

  PageController _pageController;
  void jumTopage(int page){
    _pageController?.jumpToPage(page);
  }
}
