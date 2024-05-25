

import 'package:webtree/base/base_ui/widgets/default_error_widget.dart';
import 'package:webtree/base/base_ui/widgets/default_loading_widget.dart';

import '../base_bloc/base_states.dart';
import 'base_ui.dart';

///A widget with to manage the UI according to the [state] of the [bloc]
class StateWidget<B extends StateStreamableSource<BaseState>>
    extends StatelessWidget with BaseUI<B> {
  const StateWidget({
    super.key,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
    this.initialBuilder,
    this.showBuilderOnInitialState = false,
    this.loadingTopPadding,
  });
  final BlocWidgetBuilder<BaseState> builder;
  final BlocWidgetBuilder<BaseState>? errorBuilder;
  final BlocWidgetBuilder<BaseState>? loadingBuilder;
  final BlocWidgetBuilder<BaseState>? initialBuilder;
  final bool showBuilderOnInitialState;
  final double? loadingTopPadding;

  @override
  Widget build(BuildContext context) {
    BaseState state = bloc(context).state;
    if (state.isInitial) {
      if (initialBuilder != null) {
        return initialBuilder!(context, state);
      }
      if(showBuilderOnInitialState) {
        return builder(context, state);
      }
      return const SizedBox();
    } else if (state is SuccessState) {
        return builder(context, state);
    } else if (state is ErrorState) {
      if (errorBuilder != null) {
        return errorBuilder!(context, state);
      }
      return DefaultErrorWidget(state: state);
    }
    if (loadingBuilder != null) {
      return loadingBuilder!(context, state);
    }
    return Center(child: Padding(
      padding:  EdgeInsets.only(top: loadingTopPadding??0),
      child: DefaultLoadingWidget(state: state),
    ));
  }
}
