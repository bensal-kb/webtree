import 'package:flutter/services.dart';

import 'base_ui.dart';

///A base class for all the pages with functionalities like [Scaffold], [PopScope], [RefreshIndicator].
class BasePage<B extends StateStreamableSource> extends StatelessWidget
    with BaseUI<B> {
  const BasePage({
    super.key,
    this.child,
    this.appBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.decoration,
    this.backgroundColor,
    this.statusBarColor,
    this.onPopInvoked,
    this.onRefresh,
    this.hasSafeArea = true,
    this.safeAreaBottom = false,
    this.canPop = true,
  });
  final Widget? child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Decoration? decoration;
  final Color? backgroundColor;
  final Color? statusBarColor;
  final PopInvokedCallback? onPopInvoked;
  final Future<void> Function()? onRefresh;
  final bool hasSafeArea;
  final bool safeAreaBottom;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          statusBarIconBrightness: Brightness.dark),
      child: GestureDetector(
        onTap: () {
          removeFocus(context);
        },
        child: Container(
          decoration: decoration ??
              BoxDecoration(color: backgroundColor ?? theme(context).light()),
          child: PopScope(
            canPop: canPop,
            onPopInvoked: onPopInvoked,
            child: safeAreaWrapper(
              wrap: hasSafeArea,
              safeAreaBottom: safeAreaBottom,
              child: Scaffold(
                appBar: appBar,
                backgroundColor: Colors.transparent,
                body: refreshIndicatorWrapper(
                    onRefresh: onRefresh, child: child ?? Container()),
                bottomSheet: bottomSheet,
                bottomNavigationBar: bottomNavigationBar,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget safeAreaWrapper(
      {required bool wrap,
      required bool safeAreaBottom,
      required Widget child}) {
    if (wrap) {
      return SafeArea(
        bottom: safeAreaBottom,
        child: child,
      );
    }
    return child;
  }

  Widget refreshIndicatorWrapper(
      {required Widget child, required Future<void> Function()? onRefresh}) {
    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: child,
      );
    }
    return child;
  }
}
