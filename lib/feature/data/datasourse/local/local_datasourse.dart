import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/local_storage.dart';
import '../../model/new_model/new_books.dart';
import '../../model/new_model/new_search_local_storage.dart';

class LocalDatasourse {
  static late Isar isar;

  LocalDatasourse(){
    openData();
  }

  Future<void> openData() async {
    Directory directory = await getApplicationDocumentsDirectory();

    isar = Isar.open(
        schemas: [BooksListSchema,LocalStorageSchema,NewSearchLocalstorageSchema],
        directory: directory.path,
        name: 'book_library');
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
      list?.epubList.add(epubFile);
      LocalStorage localStorage = list??LocalStorage(0, [epubFile]);
      if (kDebugMode) {
        print(localStorage.epubList);
      }
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



  Future<bool> writeSearchEpubList(SearchEpubData epubFile) async {
    NewSearchLocalstorage? list = await getSearchEpubList();
    bool dublicate= false;
    if(list!=null) {
      for (SearchEpubData item in list.epubList) {
        if (item.epub_id == epubFile.epub_id) {
          dublicate = true;
          return false;
        }
      }
    }
    if(dublicate==false){
      list?.epubList.add(epubFile);
      NewSearchLocalstorage newSearchLocalstorage = list??NewSearchLocalstorage(0, [epubFile]);
      if (kDebugMode) {
        print(newSearchLocalstorage.epubList);
      }
      isar.writeAsync((isar) {
        isar.newSearchLocalstorages.clear();
        isar.newSearchLocalstorages.put(newSearchLocalstorage);
      });
    }
    return true;
  }

  Future<NewSearchLocalstorage?> getSearchEpubList() async {
    return isar.newSearchLocalstorages.where().findFirst();
  }
  void clearSearchEpubList(){
    isar.newSearchLocalstorages.clear();
  }


  //shared preferences
// Obtain shared preferences.
  static Future<void> setSavePageIndex({required String epubId,required int savePageId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String,int>>? data = await getSavePageIndex();
    List<String> pageIndex = [];

    Map<String,int> map =<String,int>{epubId:savePageId};
    if(!dublicateCheck(data,map)) {
      data.add(map);
    }else {
      for(var item in data) {
        if(item.keys.first==map.keys.first) {
          item.update(item.keys.first, (value) => savePageId);
        }
      }
    }
    if(data.isNotEmpty){
      for(var item in data){
        pageIndex.add(jsonEncode(item));
      }
      }
    if (kDebugMode) {
      print("save page index: $pageIndex");
    }
    prefs.setStringList('pageIndex', pageIndex);
  }
   static bool dublicateCheck(List<Map<String,int>> data, Map<String,int> map){
     for(var item in data){
       if(item.containsKey(map.keys.first)){
          return true;
       }
     }
     return false;
   }

  static Future<List<Map<String,int>>> getSavePageIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    List<String> pageIndex = prefs.getStringList('pageIndex') ?? <String>[];
    List<Map<String,int>> messages = <Map<String,int>>[];
    if (pageIndex.isNotEmpty) {
      for (var element in pageIndex) {
        Map<String,dynamic> jsonData = jsonDecode(element);
        Map<String,int> typeMapInt = <String,int>{
          jsonData.keys.first:int.parse(jsonData.values.first.toString()),
        };
       messages.add(typeMapInt);
      }
    }
    return messages;
  }

}
