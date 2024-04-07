// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

import 'package:isar/isar.dart';
part 'new_books.g.dart';

BooksList booksListFromJson(String str) => BooksList.fromJson(json.decode(str));

String booksListToJson(BooksList data) => json.encode(data.toJson());
@collection
class BooksList {
  @id
  int count;
  String next;
  String? previous;
  List<NewBook> results;

  BooksList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory BooksList.fromJson(Map<String, dynamic> json) => BooksList(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<NewBook>.from(json["results"].map((x) => NewBook.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}
@embedded
class NewBook{

  int id;
  String title;
  List<Author> authors;
  List<Author> translators;
  List<String> subjects;
  List<String> bookshelves;
  List<Language> languages;
  bool copyright;
  MediaType mediaType;
  Formats? formats;
  int downloadCount;
  static NewBook? _instance;
  static get instance=>_instance??NewBook(id:0,title: "",authors: [],translators: [],
  subjects: [],bookshelves: [],languages: [],copyright: false,mediaType: MediaType.TEXT,formats: null,
    downloadCount: 0,
  );

  NewBook({
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

  factory NewBook.fromJson(Map<String, dynamic> json) => NewBook(
    id: json["id"],
    title: json["title"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    translators: List<Author>.from(json["translators"].map((x) => Author.fromJson(x))),
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
    "translators": List<dynamic>.from(translators.map((x) => x.toJson())),
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => languageValues.reverse[x])),
    "copyright": copyright,
    "media_type": mediaTypeValues.reverse[mediaType],
    "formats": formats?.toJson(),
    "download_count": downloadCount,
  };
}
@embedded
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
@embedded
class Formats {
  String textHtml;
  String applicationEpubZip;
  String applicationXMobipocketEbook;
  String applicationRdfXml;
  String imageJpeg;
  String textPlainCharsetUsAscii;
  String applicationOctetStream;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;
  String? textPlainCharsetIso88591;
  String? textHtmlCharsetIso88591;

  Formats({
    required this.textHtml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.applicationRdfXml,
    required this.imageJpeg,
    required this.textPlainCharsetUsAscii,
    required this.applicationOctetStream,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetUtf8,
    this.textPlainCharsetIso88591,
    this.textHtmlCharsetIso88591,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    textHtml: json["text/html"],
    applicationEpubZip: json["application/epub+zip"],
    applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
    applicationRdfXml: json["application/rdf+xml"],
    imageJpeg: json["image/jpeg"],
    textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
    applicationOctetStream: json["application/octet-stream"],
    textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
    textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
    textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
    textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"],
  );

  Map<String, dynamic> toJson() => {
    "text/html": textHtml,
    "application/epub+zip": applicationEpubZip,
    "application/x-mobipocket-ebook": applicationXMobipocketEbook,
    "application/rdf+xml": applicationRdfXml,
    "image/jpeg": imageJpeg,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
    "application/octet-stream": applicationOctetStream,
    "text/html; charset=utf-8": textHtmlCharsetUtf8,
    "text/plain; charset=utf-8": textPlainCharsetUtf8,
    "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
    "text/html; charset=iso-8859-1": textHtmlCharsetIso88591,
  };
}

enum Language {
  EN
}

final languageValues = EnumValues({
  "en": Language.EN
});

enum MediaType {
  TEXT
}

final mediaTypeValues = EnumValues({
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
