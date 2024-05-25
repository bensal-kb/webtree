import 'package:webtree/main.dart';
import 'package:webtree/res/app_theme.dart';
import 'package:webtree/res/constants.dart';
import 'package:webtree/routes.dart';

import 'base/base_ui/base_ui.dart';
import 'data/repo_provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => appTheme),
      ],
      child: MaterialApp.router(
        ///[Localization] support
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        routerConfig: Routes.router,
        theme: appTheme.getTheme(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    ///Add Repo to [getIt]
    RepoProvider repoProvider = RepoProvider();
    getIt.registerSingleton(repoProvider.weatherRepo);
  }
}
