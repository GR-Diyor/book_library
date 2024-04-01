// // To parse this JSON data, do
// //
// //     final newSearchBook = newSearchBookFromJson(jsonString);
//
// import 'dart:convert';
//
// NewSearchBook newSearchBookFromJson(String str) => NewSearchBook.fromJson(json.decode(str));
//
// String newSearchBookToJson(NewSearchBook data) => json.encode(data.toJson());
//
// class NewSearchBook {
//   int count;
//   String? next;
//   String? previous;
//   List<Result> results;
//
//   static NewSearchBook? _instance;
//   static get instance=>_instance??NewSearchBook(count:0,next: "2",previous: null,results: []);
//
//   NewSearchBook({
//     required this.count,
//     required this.next,
//     required this.previous,
//     required this.results,
//   });
//
//   factory NewSearchBook.fromJson(Map<String, dynamic> json) => NewSearchBook(
//     count: json["count"],
//     next: json["next"],
//     previous: json["previous"],
//     results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "count": count,
//     "next": next,
//     "previous": previous,
//     "results": List<dynamic>.from(results.map((x) => x.toJson())),
//   };
// }
//
// class Result {
//   int id;
//   String title;
//   List<Author> authors;
//   List<Author> translators;
//   List<String> subjects;
//   List<String> bookshelves;
//   List<Language> languages;
//   bool copyright;
//   MediaType mediaType;
//   Formats formats;
//   int downloadCount;
//
//   Result({
//     required this.id,
//     required this.title,
//     required this.authors,
//     required this.translators,
//     required this.subjects,
//     required this.bookshelves,
//     required this.languages,
//     required this.copyright,
//     required this.mediaType,
//     required this.formats,
//     required this.downloadCount,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["id"],
//     title: json["title"],
//     authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
//     translators: List<Author>.from(json["translators"].map((x) => Author.fromJson(x))),
//     subjects: List<String>.from(json["subjects"].map((x) => x)),
//     bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
//     languages: List<Language>.from(json["languages"].map((x) => languageValues.map[x]!)),
//     copyright: json["copyright"],
//     mediaType: mediaTypeValues.map[json["media_type"]]!,
//     formats: Formats.fromJson(json["formats"]),
//     downloadCount: json["download_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
//     "translators": List<dynamic>.from(translators.map((x) => x.toJson())),
//     "subjects": List<dynamic>.from(subjects.map((x) => x)),
//     "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
//     "languages": List<dynamic>.from(languages.map((x) => languageValues.reverse[x])),
//     "copyright": copyright,
//     "media_type": mediaTypeValues.reverse[mediaType],
//     "formats": formats.toJson(),
//     "download_count": downloadCount,
//   };
// }
//
// class Author {
//   String name;
//   int? birthYear;
//   int? deathYear;
//
//   Author({
//     required this.name,
//     required this.birthYear,
//     required this.deathYear,
//   });
//
//   factory Author.fromJson(Map<String, dynamic> json) => Author(
//     name: json["name"],
//     birthYear: json["birth_year"],
//     deathYear: json["death_year"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "birth_year": birthYear,
//     "death_year": deathYear,
//   };
// }
//
// class Formats {
//   String? textHtml;
//   String? applicationEpubZip;
//   String? applicationXMobipocketEbook;
//   String applicationRdfXml;
//   String? imageJpeg;
//   String? textPlainCharsetUsAscii;
//   String? applicationOctetStream;
//   String? textHtmlCharsetIso88591;
//   String? textPlainCharsetIso88591;
//   String? textHtmlCharsetUtf8;
//   String? textPlainCharsetUtf8;
//   String? textPlain;
//   String? audioOgg;
//   String? audioMp4;
//   String? audioMpeg;
//   String? textHtmlCharsetUsAscii;
//
//   Formats({
//     this.textHtml,
//     this.applicationEpubZip,
//     this.applicationXMobipocketEbook,
//     required this.applicationRdfXml,
//     this.imageJpeg,
//     this.textPlainCharsetUsAscii,
//     this.applicationOctetStream,
//     this.textHtmlCharsetIso88591,
//     this.textPlainCharsetIso88591,
//     this.textHtmlCharsetUtf8,
//     this.textPlainCharsetUtf8,
//     this.textPlain,
//     this.audioOgg,
//     this.audioMp4,
//     this.audioMpeg,
//     this.textHtmlCharsetUsAscii,
//   });
//
//   factory Formats.fromJson(Map<String, dynamic> json) => Formats(
//     textHtml: json["text/html"],
//     applicationEpubZip: json["application/epub+zip"],
//     applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
//     applicationRdfXml: json["application/rdf+xml"],
//     imageJpeg: json["image/jpeg"],
//     textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
//     applicationOctetStream: json["application/octet-stream"],
//     textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"],
//     textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
//     textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
//     textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
//     textPlain: json["text/plain"],
//     audioOgg: json["audio/ogg"],
//     audioMp4: json["audio/mp4"],
//     audioMpeg: json["audio/mpeg"],
//     textHtmlCharsetUsAscii: json["text/html; charset=us-ascii"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "text/html": textHtml,
//     "application/epub+zip": applicationEpubZip,
//     "application/x-mobipocket-ebook": applicationXMobipocketEbook,
//     "application/rdf+xml": applicationRdfXml,
//     "image/jpeg": imageJpeg,
//     "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
//     "application/octet-stream": applicationOctetStream,
//     "text/html; charset=iso-8859-1": textHtmlCharsetIso88591,
//     "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
//     "text/html; charset=utf-8": textHtmlCharsetUtf8,
//     "text/plain; charset=utf-8": textPlainCharsetUtf8,
//     "text/plain": textPlain,
//     "audio/ogg": audioOgg,
//     "audio/mp4": audioMp4,
//     "audio/mpeg": audioMpeg,
//     "text/html; charset=us-ascii": textHtmlCharsetUsAscii,
//   };
// }
//
// enum Language {
//   DE,
//   EN,
//   FR,
//   IT
// }
//
// final languageValues = EnumValues({
//   "de": Language.DE,
//   "en": Language.EN,
//   "fr": Language.FR,
//   "it": Language.IT
// });
//
// enum MediaType {
//   SOUND,
//   STILL_IMAGE,
//   TEXT
// }
//
// final mediaTypeValues = EnumValues({
//   "Sound": MediaType.SOUND,
//   "StillImage": MediaType.STILL_IMAGE,
//   "Text": MediaType.TEXT
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }


// To parse this JSON data, do
//
//     final newSearchBook = newSearchBookFromJson(jsonString);

import 'dart:convert';

NewSearchBook newSearchBookFromJson(String str) => NewSearchBook.fromJson(json.decode(str));

String newSearchBookToJson(NewSearchBook data) => json.encode(data.toJson());

class NewSearchBook {
  int count;
  String? next;
  String? previous;
  List<Result> results;

  NewSearchBook({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
   static NewSearchBook? _instance;
   static get instance=>_instance??NewSearchBook(count:0,next: "2",previous: null,results: []);
  factory NewSearchBook.fromJson(Map<String, dynamic> json) => NewSearchBook(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  String title;
  List<Author> authors;
  List<dynamic> translators;
  List<String> subjects;
  List<String> bookshelves;
  List<Language> languages;
  bool copyright;
  MediaType mediaType;
  Formats formats;
  int downloadCount;

  Result({
    required this.id,
    required this.title,
    required this.authors,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    translators: List<dynamic>.from(json["translators"].map((x) => x)),
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
    languages: List<Language>.from(json["languages"].map((x) => languageValues.map[x]!)),
    copyright: json["copyright"],
    mediaType: mediaTypeValues.map[json["media_type"]]!,
    formats: Formats.fromJson(json["formats"]),
    downloadCount: json["download_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "translators": List<dynamic>.from(translators.map((x) => x)),
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => languageValues.reverse[x])),
    "copyright": copyright,
    "media_type": mediaTypeValues.reverse[mediaType],
    "formats": formats.toJson(),
    "download_count": downloadCount,
  };
}

class Author {
  String name;
  int? birthYear;
  int? deathYear;

  Author({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    birthYear: json["birth_year"],
    deathYear: json["death_year"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "birth_year": birthYear,
    "death_year": deathYear,
  };
}

class Formats {
  String textHtml;
  String? textHtmlCharsetIso88591;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? textPlainCharsetUsAscii;
  String applicationRdfXml;
  String? imageJpeg;
  String? applicationOctetStream;
  String? textPlainCharsetIso88591;
  String? textPlain;
  String? audioOgg;
  String? audioMp4;
  String? audioMpeg;
  String? textHtmlCharsetUsAscii;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;
  String? applicationPdf;
  String? textXRst;

  Formats({
    required this.textHtml,
    this.textHtmlCharsetIso88591,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.textPlainCharsetUsAscii,
    required this.applicationRdfXml,
    this.imageJpeg,
    this.applicationOctetStream,
    this.textPlainCharsetIso88591,
    this.textPlain,
    this.audioOgg,
    this.audioMp4,
    this.audioMpeg,
    this.textHtmlCharsetUsAscii,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetUtf8,
    this.applicationPdf,
    this.textXRst,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    textHtml: json["text/html"],
    textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"],
    applicationEpubZip: json["application/epub+zip"],
    applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
    textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
    applicationRdfXml: json["application/rdf+xml"],
    imageJpeg: json["image/jpeg"],
    applicationOctetStream: json["application/octet-stream"],
    textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
    textPlain: json["text/plain"],
    audioOgg: json["audio/ogg"],
    audioMp4: json["audio/mp4"],
    audioMpeg: json["audio/mpeg"],
    textHtmlCharsetUsAscii: json["text/html; charset=us-ascii"],
    textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
    textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
    applicationPdf: json["application/pdf"],
    textXRst: json["text/x-rst"],
  );

  Map<String, dynamic> toJson() => {
    "text/html": textHtml,
    "text/html; charset=iso-8859-1": textHtmlCharsetIso88591,
    "application/epub+zip": applicationEpubZip,
    "application/x-mobipocket-ebook": applicationXMobipocketEbook,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
    "application/rdf+xml": applicationRdfXml,
    "image/jpeg": imageJpeg,
    "application/octet-stream": applicationOctetStream,
    "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
    "text/plain": textPlain,
    "audio/ogg": audioOgg,
    "audio/mp4": audioMp4,
    "audio/mpeg": audioMpeg,
    "text/html; charset=us-ascii": textHtmlCharsetUsAscii,
    "text/html; charset=utf-8": textHtmlCharsetUtf8,
    "text/plain; charset=utf-8": textPlainCharsetUtf8,
    "application/pdf": applicationPdf,
    "text/x-rst": textXRst,
  };
}

enum Language {
  EN,
  LA
}

final languageValues = EnumValues({
  "en": Language.EN,
  "la": Language.LA
});

enum MediaType {
  SOUND,
  TEXT
}

final mediaTypeValues = EnumValues({
  "Sound": MediaType.SOUND,
  "Text": MediaType.TEXT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
