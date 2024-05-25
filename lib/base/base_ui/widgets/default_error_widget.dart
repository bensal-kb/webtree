
import '../../base_bloc/base_states.dart';
import '../base_ui.dart';

///A default error widget
class DefaultErrorWidget extends StatelessWidget with BaseUI {
  const DefaultErrorWidget({super.key, required this.state});
  final BaseState state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
      ),
    );
  }
}
