import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pollution_source/res/colors.dart';
import 'package:pollution_source/res/gaps.dart';

class ListHeaderWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  final String background;
  final String image;
  final Color color;
  final Widget popupMenuButton;
  final bool showSearch;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget bottom;
  final double expandedHeight;

  //外部传入，用于回到顶部
  final ScrollController scrollController;
  final TextEditingController editController;
  final VoidCallback onSearchPressed;
  final void Function(String areaCode) areaPickerListener;

  ListHeaderWidget({
    this.title = '标题',
    this.subtitle = '副标题',
    this.subtitle2 = '副标题2',
    this.background = 'assets/images/button_bg_green.png',
    this.image = 'assets/images/order_list_bg_image.png',
    this.color = Colours.primary_color,
    this.showSearch = false,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.expandedHeight = 150,
    this.popupMenuButton,
    this.scrollController,
    this.editController,
    this.onSearchPressed,
    this.areaPickerListener,
  });

  @override
  _ListHeaderWidgetState createState() => _ListHeaderWidgetState();
}

class _ListHeaderWidgetState extends State<ListHeaderWidget>
    with TickerProviderStateMixin {
  TabController _tabController;
  String provinceName = '选择省';
  String cityName = '选择市';
  String areaName = '选择区';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () {
        switch (_tabController.index) {
          case 0:
            setState(
              () {
                if (_actionIcon == Icons.close) {
                  _actionIcon = Icons.search;
                }
              },
            );
            break;
          case 1:
            setState(
              () {
                if (_actionIcon == Icons.search) {
                  _actionIcon = Icons.close;
                }
              },
            );
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  IconData _actionIcon = Icons.search;

  _changePage() {
    setState(
      () {
        if (_actionIcon == Icons.search) {
          _actionIcon = Icons.close;
          _tabController.index = 1;
        } else {
          _actionIcon = Icons.search;
          _tabController.index = 0;
        }
      },
    );
  }

  _openPicker() async {
    Result result = await CityPickers.showCityPicker(
      context: context,
      //citiesData: citiesData,
      //provincesData: provincesData,
    );
    //将选中的areaCode通过接口回调传递出去
    if (widget.areaPickerListener != null) {
      widget.areaPickerListener(result.areaId);
    }
    setState(() {
      provinceName = result.provinceName;
      cityName = result.cityName;
      areaName = result.areaName;
    });
  }

  //重置搜索条件
  _resetSearch() {
    setState(() {
      widget.editController.text = '';
      provinceName = '选择省';
      cityName = '选择市';
      areaName = '选择区';
      widget.areaPickerListener('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(widget.title),
      expandedHeight: widget.expandedHeight,
      pinned: true,
      floating: false,
      snap: false,
      bottom: widget.bottom,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                widget.background,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: <Widget>[
                  Positioned(
                    right: -20,
                    bottom: 0,
                    child: Image.asset(
                      widget.image,
                      width: 300,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 110,
                          child: Text(
                            '${widget.subtitle}',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                        Gaps.vGap10,
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            '${widget.subtitle2}',
                            style: TextStyle(
                              fontSize: 10,
                              color: widget.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
                child: Container(
                  //width: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Theme(
                        data: ThemeData(
                          hoverColor: Colors.white,
                          hintColor: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 42,
                                child: Center(child: TextField(
                                  controller: widget.editController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(6),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "请输入企业名称",
                                    hintStyle: TextStyle(
                                      color: Colours.secondary_text,
                                    ),
                                    prefixIcon: Icon(Icons.business),
                                    border: InputBorder.none,
                                  ),
                                ),),
                              ),
                            ),
                            Gaps.hGap10,
                            Container(
                              height: 42,
                              width: 70,
                              color: Colors.orange,
                              child: RaisedButton(
                                onPressed: widget.onSearchPressed != null
                                    ? widget.onSearchPressed
                                    : () {},
                                child: Text(
                                  "搜索",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: const Color(0xFF8BC34A),
                              ),
                            ),
                          ],
                        ),
                      ),
//                      Theme(
//                        data: ThemeData(
//                          hoverColor: Colors.white,
//                          hintColor: Colors.white,
//                        ),
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: Container(
//                                height: 36,
//                                alignment: Alignment.center,
//                                child: GestureDetector(
//                                  onTap: () {
//                                    _openPicker();
//                                  },
//                                  child: Text(
//                                    provinceName,
//                                    style: TextStyle(
//                                      color: Colours.secondary_text,
//                                      fontSize: 15,
//                                    ),
//                                  ),
//                                ),
//                                decoration:
//                                    const BoxDecoration(color: Colors.white),
//                              ),
//                            ),
//                            Gaps.hGap10,
//                            Expanded(
//                              flex: 1,
//                              child: Container(
//                                height: 36,
//                                child: Container(
//                                  height: 36,
//                                  alignment: Alignment.center,
//                                  child: GestureDetector(
//                                    onTap: () {
//                                      _openPicker();
//                                    },
//                                    child: Text(
//                                      cityName,
//                                      style: TextStyle(
//                                        color: Colours.secondary_text,
//                                        fontSize: 15,
//                                      ),
//                                    ),
//                                  ),
//                                  decoration:
//                                      BoxDecoration(color: Colors.white),
//                                ),
//                              ),
//                            ),
//                            Gaps.hGap10,
//                            Expanded(
//                              flex: 1,
//                              child: Container(
//                                height: 36,
//                                child: Container(
//                                  height: 36,
//                                  alignment: Alignment.center,
//                                  child: GestureDetector(
//                                    onTap: () {
//                                      _openPicker();
//                                    },
//                                    child: Text(
//                                      areaName,
//                                      style: TextStyle(
//                                        color: Colours.secondary_text,
//                                        fontSize: 15,
//                                      ),
//                                    ),
//                                  ),
//                                  decoration:
//                                      BoxDecoration(color: Colors.white),
//                                ),
//                              ),
//                            ),
//                            Gaps.hGap10,
//                            Container(
//                              height: 36,
//                              width: 70,
//                              color: Colors.orange,
//                              child: RaisedButton(
//                                onPressed: () => _resetSearch(),
//                                child: Text(
//                                  "重置",
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                                color: Color(0XFFFFC107),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        widget.showSearch
            ? AnimatedSwitcher(
                transitionBuilder: (child, anim) {
                  return ScaleTransition(child: child, scale: anim);
                },
                duration: Duration(milliseconds: 300),
                child: IconButton(
                  key: ValueKey(_actionIcon),
                  icon: Icon(_actionIcon),
                  onPressed: () {
                    widget.scrollController?.jumpTo(0);
                    _changePage();
                  },
                ),
              )
            : Gaps.empty,
        // 隐藏的菜单
        widget.popupMenuButton != null ? widget.popupMenuButton : Gaps.empty,
      ],
    );
  }
}

class DetailHeaderWidget extends StatelessWidget {
  final String title;
  final String backgroundPath;
  final String imagePath;
  final String subTitle1;
  final String subTitle2;
  final Widget popupMenuButton;

  DetailHeaderWidget({
    this.title = '主标题',
    this.subTitle1 = '副标题1',
    this.subTitle2 = '副标题2',
    this.imagePath = '',
    this.backgroundPath = '',
    this.popupMenuButton,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      expandedHeight: 150.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const EdgeInsets.fromLTRB(10, 75, 10, 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                backgroundPath,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(
                        subTitle1,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        subTitle2,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        // 隐藏的菜单
        popupMenuButton != null ? popupMenuButton : Gaps.empty,
      ],
    );
  }
}

class UploadHeaderWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String imagePath;
  final String subTitle;
  final Widget popupMenuButton;

  UploadHeaderWidget({
    this.title = '主标题',
    this.subTitle = '副标题',
    this.imagePath = '',
    this.backgroundColor = Colours.primary_color,
    this.popupMenuButton,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      expandedHeight: 150.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          height: 150,
          color: backgroundColor,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 70,
                right: 16,
                bottom: 10,
                child: Image.asset(
                  imagePath,
                ),
              ),
              Positioned(
                  top: 70,
                  left: 20,
                  bottom: 10,
                  right: 150,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Text(
                        '$subTitle',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        // 隐藏的菜单
        popupMenuButton != null ? popupMenuButton : Gaps.empty,
      ],
    );
  }
}
