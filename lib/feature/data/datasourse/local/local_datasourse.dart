
import 'dart:io';
import 'dart:ui';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/local_storage.dart';
import '../../model/new_model/new_books.dart';

class LocalDatasourse {
  static late Isar isar;

  LocalDatasourse(){
    openData();
  }

  Future<void> openData() async {
    Directory directory = await getApplicationDocumentsDirectory();

    isar = Isar.open(
        schemas: [BooksListSchema,LocalStorageSchema],
        directory: directory.path,
        name: 'book_library');
   // await Isar.initialize('book_library');
  }

  Future<void> writeData(BooksList booksList) async {
    isar.writeAsync((isar) {
      isar.booksLists.clear();
      isar.booksLists.put(booksList);
    });
  }

  Future<BooksList?> getData() async {
    return isar.booksLists.where().findFirst();
  }

  Future<bool> writeEpubList(EpubData epubFile) async {
     LocalStorage? list = await getEpubList();
     bool dublicate= false;
    if(list!=null) {
      for (EpubData item in list.epubList) {
        if (item.epub_id == epubFile.epub_id) {
          dublicate = true;
          return false;
        }
      }
    }
    if(dublicate==false){
      print(list?.epubList);
      list?.epubList.add(epubFile);
      print("-------");
      LocalStorage localStorage = list??LocalStorage(0, [epubFile]);
      print(localStorage.epubList);
      isar.writeAsync((isar) {
        isar.localStorages.clear();
           isar.localStorages.put(localStorage);
      });
    }
     return true;
  }

  Future<LocalStorage?> getEpubList() async {
    return isar.localStorages.where().findFirst();
  }
}
