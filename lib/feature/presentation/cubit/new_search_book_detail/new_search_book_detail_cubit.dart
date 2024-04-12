import 'dart:io' as i;
import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/data/model/new_model/new_search_local_storage.dart';
import 'package:book_library/feature/presentation/cubit/new_search_book_detail/new_search_book_detail_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_file/internet_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/config/string.dart';
import '../../../data/datasourse/local/local_datasourse.dart';
import '../../../data/model/new_model/new_search_book.dart';
import '../../page/read_book.dart';

class NewSearchDetailCubit extends Cubit<NewSearchBookDetailState> {
  NewSearchDetailCubit() : super(NewSearchBookInitState());
  late NewSearchResult newSearchResult;

  bool isDownLoading = true;
  bool isDownloaded = false;
  Uint8List? epubFileDownloader;
  int currentBookId = 1;



  late EpubController epubController;

  void matchBook(int id)async{
    emit(NewSearchBookLoadingState());
    var list = await LocalDatasourse().getSearchEpubList();
    bool dublicate= false;

    if(list!=null){
      for(SearchEpubData item in list.epubList){
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
    emit(NewSearchBookLoadedState());
  }


  void loadEpub(context,epubFile,id)async{
    emit(NewSearchBookLoadingState());
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isDownLoading = false;
      epubFileDownloader = await InternetFile.get(epubFile);
      currentBookId = id;
      if (kDebugMode) {
        print(" id: $id");
        print("current id: $currentBookId");
      }
      String link = await downloadfile(epubFileDownloader!,epubFileDownloader.hashCode.toString());
      SearchEpubData epubData = SearchEpubData(currentBookId,link);
      if(await LocalDatasourse().writeSearchEpubList(epubData)) {
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
    emit(NewSearchBookLoadedState());
  }

  Future<void> navigateEpubView(BuildContext context,int id,String name) async {
    var list = await LocalDatasourse().getSearchEpubList();

    bool navigate= false;
    Uint8List? epub;
    if(list!=null){
      for(SearchEpubData item in list.epubList){
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
      navigateEpubBook(context,id,name);
    }
  }

  void navigateEpubBook(BuildContext context,int id,String name){
    Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => ReadBook(epubController: epubController,id: id,name:name)));
  }

  Future<String> downloadfile(Uint8List epub, String filename) async {
    var appstorage = await getApplicationDocumentsDirectory();
    final file = i.File('${appstorage.path}/$filename');
    file.writeAsBytesSync(epub,mode: i.FileMode.write);
    return file.path;

  }
}
