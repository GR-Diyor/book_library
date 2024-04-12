
import 'package:isar/isar.dart';
part 'new_search_local_storage.g.dart';

@collection
class NewSearchLocalstorage{
  @id
  int list_id;
  List<SearchEpubData> epubList;

  NewSearchLocalstorage(this.list_id,this.epubList);
}

@embedded
class SearchEpubData{
  @id
  int epub_id;
  String epub;
  SearchEpubData(this.epub_id,this.epub);
}