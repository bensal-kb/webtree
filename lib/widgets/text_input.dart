import 'package:webtree/base/base_ui/base_ui.dart';



class TextInput extends StatelessWidget with BaseUI {
  const TextInput(
      {super.key,
      this.controller,
      this.hintText,
      this.labelText,
      this.enabled,
      this.height,
      this.center,
      this.suffixIcon,
      this.onChange,
      this.isRequired,
      this.color,
      this.prefixIcon});
  final TextEditingController? controller;
  final String? hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final bool?  isRequired, enabled, center;
  final double? height;
  final Function? onChange;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: color ?? theme(context).textFieldFillColor(),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        style: textStyle(color: theme(context).light()),
        textAlign: center == true ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: hintText,
          labelText: labelText,
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
              color: Colors.grey.shade400, fontWeight: FontWeight.w700),
        ),
        onChanged: (String val) {
          if (onChange != null) {
            onChange!(val);
          }
        },
      ),
    );
  }
}
