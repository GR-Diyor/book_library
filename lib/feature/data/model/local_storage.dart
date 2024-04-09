import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'local_storage.g.dart';



@collection
class LocalStorage{
  @id
  int list_id;
  List<EpubData> epubList;

  LocalStorage(this.list_id,this.epubList);
}

@embedded
class EpubData{
  @id
  int epub_id;
  String epub;
   EpubData(this.epub_id,this.epub);
}