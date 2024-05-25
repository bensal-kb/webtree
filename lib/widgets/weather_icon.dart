import 'package:webtree/base/base_ui/base_ui.dart';

import '../res/images.dart';

class WeatherIcon extends StatelessWidget with BaseUI{
  const WeatherIcon({super.key, required this.icon, this.size});
  final String icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon == 'rain' ? Images.rain : Images.cloudy, height: size, width: size, fit: BoxFit.fill,);
  }
}
