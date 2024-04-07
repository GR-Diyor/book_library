import 'package:book_library/core/config/utill/dialog.dart';
import 'package:book_library/feature/data/model/new_model/new_books.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_file/internet_file.dart';
import '../../../data/model/search_book.dart';
import '../../../data/model/support/empty.dart';
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
  var EpubFileDownloader;
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
        epubController = EpubController(
          // Load document
          document: EpubDocument.openData(EpubFileDownloader),
          // Set start point
          epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
        );
        isDownLoading = true;
        isDownloaded = true;
        currentBookId = id;

      }else{
        "Tarmoq mavjud emas".showSnackbar(context);
      }
      emit(NewBookDetailLoadedState());
    }

   void matchBook(){
      if(currentBookId!=newBook.id){
         isDownLoading = true;
         isDownloaded = false;
      }
    }


}