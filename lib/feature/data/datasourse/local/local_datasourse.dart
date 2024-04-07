
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/new_model/new_books.dart';

class LocalDatasourse {
  static late Isar isar;

  Future<void> openData() async {
    Directory directory = await getApplicationDocumentsDirectory();

    isar = Isar.open(
        schemas: [BooksListSchema],
        directory: directory.path,
        name: 'book_library');
    await Isar.initialize('book_library');
  }

  Future<void> writeData(BooksList booksList) async {
    isar.writeAsync((isar) {
      isar.booksLists.clear();
      isar.booksLists.put(booksList);
      print(isar.booksLists.where().findFirst());
    });
  }

  Future<BooksList?> getData() async {
    return isar.booksLists.where().findFirst();
  }
}
