
import '../urls.dart';
import '../utils/services.dart';

///A [Base] class for all the Repo
abstract class BaseRepository {
  final Services services = Services();
  final Urls urls = Urls();

  ///returns [list] of Type [T] from a [jsonList] using [fromJson] method
  ///param1: raw json list
  ///param2: a function which converts an item from list to the Model of type [T]
  List<T> getModelList<T>(List jsonList, Function fromJson){
    List<T> list = [];
    for(var i in jsonList) {
      list.add(fromJson(i));
    }
    return list;
  }
}