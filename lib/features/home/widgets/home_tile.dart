import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/routes.dart';

import '../../../res/images.dart';

class HomeTile extends StatelessWidget with BaseUI {
  const HomeTile({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 100
                  : 30.0,
          vertical: 6),
      child: InkWell(
        onTap: () {
          push(context, Routes.weatherDetails, args: city);
        },
        borderRadius: BorderRadius.circular(20),
        splashColor: theme(context).dark(),
        child: Ink(
          decoration: BoxDecoration(
              color: theme(context).primaryLight().withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage(Images.tile),
                  opacity: 0.3,
                  fit: BoxFit.fitWidth)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Text(
                city,
                style: textStyle(
                    color: theme(context).light(), fontWeight: FontWeight.w700),
              ),
              const Spacer(flex: 1),
              Icon(Icons.chevron_right, color: theme(context).light())
            ],
          ),
        ),
      ),
    );
  }
}
