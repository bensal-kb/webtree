import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/features/home/bloc/home_cubit/home_cubit.dart';
import 'package:webtree/features/home/view/home_view.dart';

///Page for displaying a search bar and list of cities
class HomePage extends StatelessWidget with BaseUI {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const HomeView(),
    );
  }
}
