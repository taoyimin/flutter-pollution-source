import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pollution_source/res/colors.dart';
import 'package:pollution_source/res/gaps.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

/// 登录模块的输入框封装
//class LoginTextField extends StatefulWidget {
//  const LoginTextField(
//      {Key key,
//      @required this.controller,
//      this.maxLength: 16,
//      this.autoFocus: false,
//      this.keyboardType: TextInputType.text,
//      this.hintText: "",
//      this.focusNode,
//      this.isInputPwd: false,
//      this.getVCode,
//      this.config,
//      this.keyName})
//      : super(key: key);
//
//  final TextEditingController controller;
//  final int maxLength;
//  final bool autoFocus;
//  final TextInputType keyboardType;
//  final String hintText;
//  final FocusNode focusNode;
//  final bool isInputPwd;
//  final Future<bool> Function() getVCode;
//  final KeyboardActionsConfig config;
//
//  /// 用于集成测试寻找widget
//  final String keyName;
//
//  @override
//  _LoginTextFieldState createState() => _LoginTextFieldState();
//}
//
//class _LoginTextFieldState extends State<LoginTextField> {
//  bool _isShowPwd = false;
//  bool _isShowDelete;
//  bool _isClick = true;
//
//  /// 倒计时秒数
//  final int second = 30;
//
//  /// 当前秒数
//  int s;
//  StreamSubscription _subscription;
//
//  @override
//  void initState() {
//    super.initState();
//
//    /// 获取初始化值
//    _isShowDelete = widget.controller.text.isEmpty;
//
//    /// 监听输入改变
//    widget.controller.addListener(() {
//      setState(() {
//        _isShowDelete = widget.controller.text.isEmpty;
//      });
//    });
//    if (widget.config != null && defaultTargetPlatform == TargetPlatform.iOS) {
//      // 因Android平台输入法兼容问题，所以只配置IOS平台
//      FormKeyboardActions.setKeyboardActions(context, widget.config);
//    }
//  }
//
//  @override
//  void dispose() {
//    _subscription?.cancel();
//    widget.controller?.removeListener(() {});
//    widget.controller?.dispose();
//    super.dispose();
//  }
//
//  Future _getVCode() async {
//    bool isSuccess = await widget.getVCode();
//    if (isSuccess != null && isSuccess) {
//      setState(() {
//        s = second;
//        _isClick = false;
//      });
//      _subscription = Observable.periodic(Duration(seconds: 1), (i) => i)
//          .take(second)
//          .listen((i) {
//        setState(() {
//          s = second - i - 1;
//          _isClick = s < 1;
//        });
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      alignment: Alignment.centerRight,
//      children: <Widget>[
//        TextField(
//          style: TextStyle(color: Colours.primary_text, fontSize: 14),
//          focusNode: widget.focusNode,
//          maxLength: widget.maxLength,
//          obscureText: widget.isInputPwd ? !_isShowPwd : false,
//          autofocus: widget.autoFocus,
//          controller: widget.controller,
//          textInputAction: TextInputAction.done,
//          keyboardType: widget.keyboardType,
//          // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
//          inputFormatters: (widget.keyboardType == TextInputType.number ||
//                  widget.keyboardType == TextInputType.phone)
//              ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
//              : [BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))],
//          decoration: InputDecoration(
//              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
//              hintText: widget.hintText,
//              hintStyle: TextStyle(color: Colours.secondary_text, fontSize: 14),
//              counterText: "",
//              focusedBorder: UnderlineInputBorder(
//                  borderSide:
//                      BorderSide(color: Colours.primary_color, width: 0.8)),
//              enabledBorder: UnderlineInputBorder(
//                  borderSide: BorderSide(color: Colours.line, width: 0.8))),
//        ),
//        Row(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            _isShowDelete
//                ? Gaps.empty
//                : GestureDetector(
//                    child: Image.asset(
//                      'assets/images/icon_login_delete.png',
//                      key: Key('${widget.keyName}_delete'),
//                      height: 18,
//                      width: 18,
//                      fit: BoxFit.cover,
//                    ),
//                    onTap: () {
//                      widget.controller.text = "";
//                    },
//                  ),
//            !widget.isInputPwd ? Gaps.empty : Gaps.hGap15,
//            !widget.isInputPwd
//                ? Gaps.empty
//                : GestureDetector(
//                    child: Image.asset(
//                      _isShowPwd
//                          ? 'assets/images/icon_login_display.png'
//                          : 'assets/images/icon_login_hide.png',
//                      key: Key('${widget.keyName}_showPwd'),
//                      height: 18,
//                      width: 18,
//                      fit: BoxFit.cover,
//                    ),
//                    onTap: () {
//                      setState(() {
//                        _isShowPwd = !_isShowPwd;
//                      });
//                    },
//                  ),
//            widget.getVCode == null ? Gaps.empty : Gaps.hGap15,
//            widget.getVCode == null
//                ? Gaps.empty
//                : Theme(
//                    data: Theme.of(context).copyWith(
//                      buttonTheme: ButtonThemeData(
//                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                        height: 26.0,
//                        minWidth: 76.0,
//                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                      ),
//                    ),
//                    child: FlatButton(
//                      onPressed: _isClick ? _getVCode : null,
//                      textColor: Colours.primary_color,
//                      color: Colors.transparent,
//                      disabledTextColor: Colors.white,
//                      disabledColor: Colours.secondary_text,
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(1.0),
//                          side: BorderSide(
//                            color: _isClick
//                                ? Colours.primary_color
//                                : Colours.secondary_text,
//                            width: 0.8,
//                          )),
//                      child: Text(
//                        _isClick ? "获取验证码" : "（$s s）",
//                        style: TextStyle(fontSize: Dimens.font_sp12),
//                      ),
//                    ),
//                  )
//          ],
//        )
//      ],
//    );
//  }
//}


class LoginTextField extends StatefulWidget {
  const LoginTextField(
      {Key key,
        @required this.controller,
        this.maxLength: 16,
        this.autoFocus: false,
        this.keyboardType: TextInputType.text,
        this.hintText: "",
        this.focusNode,
        this.isInputPwd: false,
        this.config,
        this.keyName})
      : super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final FocusNode focusNode;
  final bool isInputPwd;
  final KeyboardActionsConfig config;

  /// 用于集成测试寻找widget
  final String keyName;

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _isShowPwd = false;
  bool _isShowDelete;

  @override
  void initState() {
    super.initState();

    /// 获取初始化值
    _isShowDelete = widget.controller.text.isEmpty;

    /// 监听输入改变
    widget.controller.addListener(() {
      setState(() {
        _isShowDelete = widget.controller.text.isEmpty;
      });
    });
    if (widget.config != null && defaultTargetPlatform == TargetPlatform.iOS) {
      // 因Android平台输入法兼容问题，所以只配置IOS平台
      FormKeyboardActions.setKeyboardActions(context, widget.config);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(() {});
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          style: TextStyle(color: Colours.primary_text, fontSize: 14),
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          obscureText: widget.isInputPwd ? !_isShowPwd : false,
          autofocus: widget.autoFocus,
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          keyboardType: widget.keyboardType,
          // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
          inputFormatters: (widget.keyboardType == TextInputType.number ||
              widget.keyboardType == TextInputType.phone)
              ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
              : [BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))],
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colours.secondary_text, fontSize: 14),
              counterText: "",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: Colours.primary_color, width: 0.8)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colours.line, width: 0.8))),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _isShowDelete
                ? Gaps.empty
                : GestureDetector(
              child: Image.asset(
                'assets/images/icon_login_delete.png',
                key: Key('${widget.keyName}_delete'),
                height: 18,
                width: 18,
                fit: BoxFit.cover,
              ),
              onTap: () {
                widget.controller.text = "";
              },
            ),
            !widget.isInputPwd ? Gaps.empty : Gaps.hGap15,
            !widget.isInputPwd
                ? Gaps.empty
                : GestureDetector(
              child: Image.asset(
                _isShowPwd
                    ? 'assets/images/icon_login_display.png'
                    : 'assets/images/icon_login_hide.png',
                key: Key('${widget.keyName}_showPwd'),
                height: 18,
                width: 18,
                fit: BoxFit.cover,
              ),
              onTap: () {
                setState(() {
                  _isShowPwd = !_isShowPwd;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}