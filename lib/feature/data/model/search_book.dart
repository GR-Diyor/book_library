import 'dart:convert';

SearchBook searchBookFromJson(String str) => SearchBook.fromJson(json.decode(str));

String searchBookToJson(SearchBook data) => json.encode(data.toJson());

class SearchBook {
  String kind;
  int totalItems;
  List<Item> items;

  SearchBook({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory SearchBook.fromJson(Map<String, dynamic> json) => SearchBook(
    kind: json["kind"],
    totalItems: json["totalItems"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "totalItems": totalItems,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Kind kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;
  SearchInfo searchInfo;

  Item({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: kindValues.map[json["kind"]]!,
    id: json["id"],
    etag: json["etag"],
    selfLink: json["selfLink"],
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
    saleInfo: SaleInfo.fromJson(json["saleInfo"]),
    accessInfo: AccessInfo.fromJson(json["accessInfo"]),
    searchInfo: SearchInfo.fromJson(json["searchInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfo.toJson(),
    "saleInfo": saleInfo.toJson(),
    "accessInfo": accessInfo.toJson(),
    "searchInfo": searchInfo.toJson(),
  };
}

class AccessInfo {
  Country country;
  Viewability viewability;
  bool embeddable;
  bool publicDomain;
  TextToSpeechPermission textToSpeechPermission;
  Epub epub;
  Epub pdf;
  String webReaderLink;
  AccessViewStatus accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: countryValues.map[json["country"]]!,
    viewability: viewabilityValues.map[json["viewability"]]!,
    embeddable: json["embeddable"],
    publicDomain: json["publicDomain"],
    textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]]!,
    epub: Epub.fromJson(json["epub"]),
    pdf: Epub.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"],
    accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]]!,
    quoteSharingAllowed: json["quoteSharingAllowed"],
  );

  Map<String, dynamic> toJson() => {
    "country": countryValues.reverse[country],
    "viewability": viewabilityValues.reverse[viewability],
    "embeddable": embeddable,
    "publicDomain": publicDomain,
    "textToSpeechPermission": textToSpeechPermissionValues.reverse[textToSpeechPermission],
    "epub": epub.toJson(),
    "pdf": pdf.toJson(),
    "webReaderLink": webReaderLink,
    "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
    "quoteSharingAllowed": quoteSharingAllowed,
  };
}

enum AccessViewStatus {
  SAMPLE
}

final accessViewStatusValues = EnumValues({
  "SAMPLE": AccessViewStatus.SAMPLE
});

enum Country {
  UZ
}

final countryValues = EnumValues({
  "UZ": Country.UZ
});

class Epub {
  bool isAvailable;
  String? acsTokenLink;

  Epub({
    required this.isAvailable,
    this.acsTokenLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json["isAvailable"],
    acsTokenLink: json["acsTokenLink"],
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "acsTokenLink": acsTokenLink,
  };
}

enum TextToSpeechPermission {
  ALLOWED
}

final textToSpeechPermissionValues = EnumValues({
  "ALLOWED": TextToSpeechPermission.ALLOWED
});

enum Viewability {
  PARTIAL
}

final viewabilityValues = EnumValues({
  "PARTIAL": Viewability.PARTIAL
});

enum Kind {
  BOOKS_VOLUME
}

final kindValues = EnumValues({
  "books#volume": Kind.BOOKS_VOLUME
});

class SaleInfo {
  Country country;
  Saleability saleability;
  bool isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: countryValues.map[json["country"]]!,
    saleability: saleabilityValues.map[json["saleability"]]!,
    isEbook: json["isEbook"],
    listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
    retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
    buyLink: json["buyLink"],
    offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country": countryValues.reverse[country],
    "saleability": saleabilityValues.reverse[saleability],
    "isEbook": isEbook,
    "listPrice": listPrice?.toJson(),
    "retailPrice": retailPrice?.toJson(),
    "buyLink": buyLink,
    "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
  };
}

class SaleInfoListPrice {
  double amount;
  CurrencyCode currencyCode;

  SaleInfoListPrice({
    required this.amount,
    required this.currencyCode,
  });

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice(
    amount: json["amount"]?.toDouble(),
    currencyCode: currencyCodeValues.map[json["currencyCode"]]!,
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currencyCode": currencyCodeValues.reverse[currencyCode],
  };
}

enum CurrencyCode {
  USD
}

final currencyCodeValues = EnumValues({
  "USD": CurrencyCode.USD
});

class Offer {
  int finskyOfferType;
  OfferListPrice listPrice;
  OfferListPrice retailPrice;

  Offer({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    finskyOfferType: json["finskyOfferType"],
    listPrice: OfferListPrice.fromJson(json["listPrice"]),
    retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "finskyOfferType": finskyOfferType,
    "listPrice": listPrice.toJson(),
    "retailPrice": retailPrice.toJson(),
  };
}

class OfferListPrice {
  int amountInMicros;
  CurrencyCode currencyCode;

  OfferListPrice({
    required this.amountInMicros,
    required this.currencyCode,
  });

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
    amountInMicros: json["amountInMicros"],
    currencyCode: currencyCodeValues.map[json["currencyCode"]]!,
  );

  Map<String, dynamic> toJson() => {
    "amountInMicros": amountInMicros,
    "currencyCode": currencyCodeValues.reverse[currencyCode],
  };
}

enum Saleability {
  FOR_SALE,
  NOT_FOR_SALE
}

final saleabilityValues = EnumValues({
  "FOR_SALE": Saleability.FOR_SALE,
  "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
  String textSnippet;

  SearchInfo({
    required this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json["textSnippet"],
  );

  Map<String, dynamic> toJson() => {
    "textSnippet": textSnippet,
  };
}

class VolumeInfo {
  String title;
  List<String> authors;
  String publisher;
  DateTime publishedDate;
  String description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  PrintType printType;
  List<String> categories;
  MaturityRating maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks imageLinks;
  Language language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  String? subtitle;

  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    this.subtitle,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"],
    authors: List<String>.from(json["authors"].map((x) => x)),
    publisher: json["publisher"],
    publishedDate: DateTime.parse(json["publishedDate"]),
    description: json["description"],
    industryIdentifiers: json["industryIdentifiers"] == null ? [] : List<IndustryIdentifier>.from(json["industryIdentifiers"]!.map((x) => IndustryIdentifier.fromJson(x))),
    readingModes: ReadingModes.fromJson(json["readingModes"]),
    pageCount: json["pageCount"],
    printType: printTypeValues.map[json["printType"]]!,
    categories: List<String>.from(json["categories"].map((x) => x)),
    maturityRating: maturityRatingValues.map[json["maturityRating"]]!,
    allowAnonLogging: json["allowAnonLogging"],
    contentVersion: json["contentVersion"],
    panelizationSummary: PanelizationSummary.fromJson(json["panelizationSummary"]),
    imageLinks: ImageLinks.fromJson(json["imageLinks"]),
    language: languageValues.map[json["language"]]!,
    previewLink: json["previewLink"],
    infoLink: json["infoLink"],
    canonicalVolumeLink: json["canonicalVolumeLink"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "publisher": publisher,
    "publishedDate": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
    "description": description,
    "industryIdentifiers": industryIdentifiers == null ? [] : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
    "readingModes": readingModes.toJson(),
    "pageCount": pageCount,
    "printType": printTypeValues.reverse[printType],
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "maturityRating": maturityRatingValues.reverse[maturityRating],
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "panelizationSummary": panelizationSummary.toJson(),
    "imageLinks": imageLinks.toJson(),
    "language": languageValues.reverse[language],
    "previewLink": previewLink,
    "infoLink": infoLink,
    "canonicalVolumeLink": canonicalVolumeLink,
    "subtitle": subtitle,
  };
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };
}

class IndustryIdentifier {
  Type type;
  String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
    type: typeValues.map[json["type"]]!,
    identifier: json["identifier"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "identifier": identifier,
  };
}

enum Type {
  ISBN_10,
  ISBN_13,
  OTHER
}

final typeValues = EnumValues({
  "ISBN_10": Type.ISBN_10,
  "ISBN_13": Type.ISBN_13,
  "OTHER": Type.OTHER
});

enum Language {
  EN,
  RU
}

final languageValues = EnumValues({
  "en": Language.EN,
  "ru": Language.RU
});

enum MaturityRating {
  MATURE,
  NOT_MATURE
}

final maturityRatingValues = EnumValues({
  "MATURE": MaturityRating.MATURE,
  "NOT_MATURE": MaturityRating.NOT_MATURE
});

class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
    containsEpubBubbles: json["containsEpubBubbles"],
    containsImageBubbles: json["containsImageBubbles"],
  );

  Map<String, dynamic> toJson() => {
    "containsEpubBubbles": containsEpubBubbles,
    "containsImageBubbles": containsImageBubbles,
  };
}

enum PrintType {
  BOOK
}

final printTypeValues = EnumValues({
  "BOOK": PrintType.BOOK
});

class ReadingModes {
  bool text;
  bool image;

  ReadingModes({
    required this.text,
    required this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
    text: json["text"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image": image,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
