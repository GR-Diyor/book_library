import 'dart:io' as i;
import 'package:book_library/core/config/string.dart';
import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/data/datasourse/local/local_datasourse.dart';
import 'package:book_library/feature/data/model/new_model/new_books.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_file/internet_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../data/model/local_storage.dart';
import '../../../data/model/support/empty.dart';
import '../../page/read_book.dart';
import 'new_book_detail_state.dart';

class NewBookDetailCubit extends Cubit<NewBookDetailState>{
  NewBookDetailCubit():super(NewBookDetailInitState());

  var pagecount = AppString.notaviable;
  var desc = AppString.notaviable;
  var pubdate = AppString.notaviable;
  var lang = AppString.notaviable;
  var rating = AppString.notaviable;
  var url =AppString.placeholder;

  Empty empty = Empty.instance;
  NewBook newBook = NewBook.instance;
  dynamic dynamicResponse;
  Uint8List? epubFileDownloader;
  bool isDownLoading = true;
  bool isDownloaded = false;
  int currentBookId = 1;



    late EpubController epubController;
    void loadEpub(context,epubFile,id)async{
      emit(NewBookDetailLoadingState());
      ConnectivityResult result = await Connectivity().checkConnectivity();
      if (result != ConnectivityResult.none) {
        isDownLoading = false;
        epubFileDownloader = await InternetFile.get(epubFile);
         currentBookId = id;
         if (kDebugMode) {
           print(" id: $id");
           print("current id: $currentBookId");
           print("epub tupe: ${epubFileDownloader.runtimeType}");
         }
        String link = await downloadfile(epubFileDownloader!,epubFileDownloader.hashCode.toString());
        EpubData epubData = EpubData(currentBookId,link);
        if (kDebugMode) {
          print("match hashcode:  ${epubData.hashCode}");
        }
        if(await LocalDatasourse().writeEpubList(epubData)) {
          isDownLoading = true;
          isDownloaded = true;
        }else{
          isDownLoading = true;
          isDownloaded = false;
        }
        epubFileDownloader = null;

      }else{
        AppString.notConnection.showSnackbar(context);
      }
      emit(NewBookDetailLoadedState());
    }

   void matchBook(int id)async{
     emit(NewBookDetailLoadingState());
     var list = await LocalDatasourse().getEpubList();
     bool dublicate= false;

     if(list!=null){
     for(EpubData item in list.epubList){
       // print("database id: ${item.epub_id}");
       // print("id: $id");
       if(item.epub_id==id){
         dublicate = true;
       }
     }
     }
      if(dublicate){
         isDownLoading = true;
         isDownloaded = true;
      }else{
        isDownLoading = true;
        isDownloaded = false;
      }
      //print("object  => $dublicate");
     emit(NewBookDetailLoadedState());
    }

Future<void> navigateEpubView(BuildContext context,int id,String name) async {
  var list = await LocalDatasourse().getEpubList();

  bool navigate= false;
  Uint8List? epub;
  if(list!=null){
    for(EpubData item in list.epubList){
      if (kDebugMode) {
        print("database id: ${item.epub_id}");
        print("id: $id");
      }
      if(item.epub_id==id){
        final file = i.File(item.epub);
        epub =  await file.readAsBytes();
        if(epub.isNotEmpty) {
          navigate = true;
          epubController = EpubController(
            // Load document
            document: EpubDocument.openData(epub),
            // Set start point
            epubCfi: AppString.epubcfi,
          );
        }
        break;
      }
    }
  }
  if(navigate) {
    Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => ReadBook(epubController: epubController,id:id,name:name)));
  }
  }


  Future<String> downloadfile(Uint8List epub, String filename) async {
      var appstorage = await getApplicationDocumentsDirectory();
      final file = i.File('${appstorage.path}/$filename');
       file.writeAsBytesSync(epub,mode: i.FileMode.write);
      return file.path;

  }
}