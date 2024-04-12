class AppString{
  static String appName = 'Book Library';

  ///Fonts
  static String latoRegular = "Lato-Regular";

  ///Image String
  static String placeholder ="https://github.com/GR-Diyor/book_library/blob/main/assets/images/NOT_AVAILABLE.png";
  static String overlay = "assets/images/overlay.png";
  static String books = "assets/images/books.png";
  static String background = "assets/images/background.png";
  static String background_2 = "assets/images/background_2.png";
  static String bookAvailable = "assets/images/NOT_AVAILABLE.png";

  /// new API
  static String newBase = "https://gutendex.com";
  static String newBookList = "/books";
  static String newBookId = "/books/?ids=";
  // /books/?ids=11
  static String newSearchBook = "/books?search=";
  // /books?search=dickens%20great




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

 /// new book detail
static String download = "Download";
static String subjects = "Subjects";

 ///search response
static String result = "RESULT";
static String searchdetail = "DETAILS";

static String notfinded = "Bu jumla orqali kitob topilmadi";


//etc
static String errorcases = "Xatolik yuzaga keldi.";
static String booknotdownload = "Bu kitobni yuklab bo'lmaydi";
static String id = "id";
static String by = "By";
static String author = "Author";
static String copyright = "CopyRight";
static String notcopyright = "Not CopyRight";
static String language = "Language";
static String publishdate = "Publish date";
static String awesomeBook = "Awesome eBook";
static String open = "Open";


static String epubcfi = 'epubcfi(/6/6[chapter-2]!/4/2/1612)';

static String notaviable = "Not available";
static String notConnection = "Tarmoq mavjud emas";
static String serverException = "Server exception:";
static String requiredfivesymbols = "Qidiruv so'zi 5 harfdan kam bo'lmasligi kerak!";
}