import 'package:webtree/data/repo/weather_repo.dart';
import 'package:webtree/data/repo_impl/weather_repo_impl.dart';

///A class which contains the list of Repo implementation
///classes which are to be injected into [MultiRepositoryProvider]
class RepoProvider {
  WeatherRepo weatherRepo = WeatherRepoImpl();
}
