import 'package:webtree/base/base_ui/base_page.dart';
import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/features/home/bloc/home_cubit/home_cubit.dart';
import 'package:webtree/features/home/widgets/home_tile.dart';

import '../widgets/home_appbar.dart';

class HomeView extends StatelessWidget with BaseUI<HomeCubit> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      hasSafeArea: false,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            theme(context).gradient1(),
            theme(context).gradient2()
          ])),
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Cities',
                      style: textStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: theme(context).light()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (int i = 0; i < state.cities.length; i++)
                    HomeTile(city: state.cities[i]),
                  if (state.cities.isEmpty)
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 80),
                          Icon(
                            Icons.error,
                            color: Colors.red.withOpacity(0.4),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "No Results found for '${state.input}'",
                            style: textStyle(
                                fontSize: 16, color: theme(context).light()),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 50),
                ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
