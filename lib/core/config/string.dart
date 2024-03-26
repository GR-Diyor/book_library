class AppString{

  ///Image String
  static String placeholder ="https://www.bing.com/images/search?view=detailV2&ccid=vx9%2fIUj5&id=3B7650A146D55682645F765E60E786419299154C&thid=OIP.vx9_IUj50utS7cbaiRtoZAHaE8&mediaurl=https%3a%2f%2fst3.depositphotos.com%2f1186248%2f14351%2fi%2f950%2fdepositphotos_143511907-stock-photo-not-available-rubber-stamp.jpg&exph=682&expw=1023&q=not+available&simid=608054098357136066&FORM=IRPRST&ck=BADF0353AC59677CCFAA67227357E3CB&selectedIndex=1&ajaxhist=0&ajaxserp=0";
  static String overlay = "assets/images/overlay.png";
  static String books = "assets/images/books.png";
  static String background = "assets/images/background.png";
  static String background_2 = "assets/images/background_2.png";


  ///Network String
  static String key = "AIzaSyDN1HGU9X9_zTwGI2qSwyOnObCEX04xnA4";
  static String keyApi = "&key=$key";

  static Map<String,String> header = {'Content-type': 'application/json; charset=UTF-8'};

  static String base = "https://www.googleapis.com";
  static String bookDetailApi = "/books/v1/volumes?q=isbn:";
  //"$base/books/v1/volumes?q=isbn:$bookId&key=$key";

  ///category
  static String thrillerApi = "/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest";
  // "$base/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest&key=$key";
  static String fantasyApi = "/books/v1/volumes?q=subject:fantasy&download=epub&orderBy=newest";
  //"$base/books/v1/volumes?q=subject:fantasy&download=epub&orderBy=newest&key=$key";
  static String horrorApi = "/books/v1/volumes?q=subject:horror&download=epub&orderBy=newest";
  //"$base/books/v1/volumes?q=subject:horror&download=epub&orderBy=newest&key=$key";
  static String healthApi = "/books/v1/volumes?q=subject:health&download=epub&orderBy=newest";
  //"$base/books/v1/volumes?q=subject:health&download=epub&orderBy=newest&key=$key";


  ///search
  static String searchListApi1 = "/books/v1/volumes?q=intitle:";//  =>text
  static String searchListApi2 = "&maxResult=10&download=epub&orderBy=newest"; //text<=
  //$base/books/v1/volumes?q=intitle:$text&maxResult=40&download=epub&orderBy=newest&key=$key";







///pages


///get started
 static String discover = "Discover";
 static String newWorld = "new worlds !";
 static String diveinto = "Dive into new worlds with our application,";
 static String explorestudy = "explore, study, follow the arrival of books,";
 static String getinto = "get into good habbit of reading.";
 static String explore = "EXPLORE";

 ///home
 static String searchbook= "Search book name with...";
 static String search = "SEARCH";
 static String explorethebook = "Explore the book forest!";
 static String findthelight =  "Find the light you are chasing for.";
 static String adventure = "Adventure";
 static String fantasy = "Fantasy";
 static String horror = "Horror";
 static String health = "Health";


 ///book detail
 static String detail = "DETAILS";
 static String readbook = "READ BOOK";
 static String reting = "Rating";
 static String pages = "Pages";
 static String whatit = "What's it about?";



 ///search response
static String result = "RESULT";
static String searchdetail = "DETAILS";

}