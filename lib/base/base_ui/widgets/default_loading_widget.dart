import '../../base_bloc/base_states.dart';
import '../base_ui.dart';

///A default loading widget
class DefaultLoadingWidget extends StatelessWidget with BaseUI {
  const DefaultLoadingWidget({super.key, required this.state, this.color});
  final BaseState state;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
