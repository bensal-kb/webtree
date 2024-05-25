import 'package:flutter/cupertino.dart';

///Default [CupertinoButton] Widget
class CButton extends StatelessWidget {
  const CButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.height,
      this.width,
      this.padding, this.enabled = true});
  final VoidCallback? onTap;
  final Widget child;
  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CupertinoButton(
        onPressed: enabled ? onTap : null,
        padding: padding ?? const EdgeInsets.all(0),
        minSize: 0,
        child: child,
      ),
    );
  }
}
