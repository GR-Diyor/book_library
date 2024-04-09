import 'dart:io' as i;
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

  var pagecount = "Not available";
  var desc = "Not available";
  var pubdate = "Not available";
  var lang = "Not available";
  var rating = "Not available";
  var url ="https://www.bing.com/images/search?view=detailV2&ccid=vx9%2fIUj5&id=3B7650A146D55682645F765E60E786419299154C&thid=OIP.vx9_IUj50utS7cbaiRtoZAHaE8&mediaurl=https%3a%2f%2fst3.depositphotos.com%2f1186248%2f14351%2fi%2f950%2fdepositphotos_143511907-stock-photo-not-available-rubber-stamp.jpg&exph=682&expw=1023&q=not+available&simid=608054098357136066&FORM=IRPRST&ck=BADF0353AC59677CCFAA67227357E3CB&selectedIndex=1&ajaxhist=0&ajaxserp=0";

  Empty empty = Empty.instance;
  NewBook newBook = NewBook.instance;
  var DynamicResponse;
  Uint8List? EpubFileDownloader;
  bool isDownLoading = true;
  bool isDownloaded = false;
  int currentBookId = 1;



    late EpubController epubController;
    void loadEpub(context,epubFile,id)async{
      emit(NewBookDetailLoadingState());
      ConnectivityResult result = await Connectivity().checkConnectivity();
      if (result != ConnectivityResult.none) {
        isDownLoading = false;
        EpubFileDownloader = await InternetFile.get(epubFile);
         currentBookId = id;
         print(" id: $id");
         print("current id: $currentBookId");
         print("epub tupe: ${EpubFileDownloader.runtimeType}");
        String link = await downloadfile(EpubFileDownloader!,EpubFileDownloader.hashCode.toString());
        EpubData epubData = EpubData(currentBookId,link);
        print("hashcode:  ${epubData.hashCode}");
        //156032627
        //946023017
        if(await LocalDatasourse().writeEpubList(epubData)) {
          isDownLoading = true;
          isDownloaded = true;
        }else{
          isDownLoading = true;
          isDownloaded = false;
        }
        EpubFileDownloader = null;

      }else{
        "Tarmoq mavjud emas".showSnackbar(context);
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

Future<void> navigateEpubView(BuildContext context,int id) async {
  var list = await LocalDatasourse().getEpubList();

  bool navigate= false;
  Uint8List? epub;
  if(list!=null){
    for(EpubData item in list.epubList){
      print("database id: ${item.epub_id}");
      print("id: $id");
      if(item.epub_id==id){
        final file = i.File(item.epub);
        epub =  await file.readAsBytes();
        if(epub!=null) {
          navigate = true;
          epubController = EpubController(
            // Load document
            document: EpubDocument.openData(epub),
            // Set start point
            epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
          );
        }
        break;
      }
    }
  }
  if(navigate) {
    Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => ReadBook(epubController: epubController,)));
  }
  }


  Future<String> downloadfile(Uint8List epub, String filename) async {
      var appstorage = await getApplicationDocumentsDirectory();
      final file = i.File('${appstorage.path}/$filename');
       file.writeAsBytesSync(epub,mode: i.FileMode.write);
      return file.path;

  }
}