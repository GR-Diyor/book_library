// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  Book({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
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
  List<dynamic> authors;
  List<dynamic> translators;
  List<String> subjects;
  List<String> bookshelves;
  List<String> languages;
  bool copyright;
  String mediaType;
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
    authors: List<dynamic>.from(json["authors"].map((x) => x)),
    translators: List<dynamic>.from(json["translators"].map((x) => x)),
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
    languages: List<String>.from(json["languages"].map((x) => x)),
    copyright: json["copyright"],
    mediaType: json["media_type"],
    formats: Formats.fromJson(json["formats"]),
    downloadCount: json["download_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "translators": List<dynamic>.from(translators.map((x) => x)),
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "copyright": copyright,
    "media_type": mediaType,
    "formats": formats.toJson(),
    "download_count": downloadCount,
  };
}

class Formats {
  String textHtml;
  String applicationEpubZip;
  String applicationXMobipocketEbook;
  String applicationRdfXml;
  String imageJpeg;
  String textPlainCharsetUsAscii;
  String applicationOctetStream;

  Formats({
    required this.textHtml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.applicationRdfXml,
    required this.imageJpeg,
    required this.textPlainCharsetUsAscii,
    required this.applicationOctetStream,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    textHtml: json["text/html"],
    applicationEpubZip: json["application/epub+zip"],
    applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
    applicationRdfXml: json["application/rdf+xml"],
    imageJpeg: json["image/jpeg"],
    textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
    applicationOctetStream: json["application/octet-stream"],
  );

  Map<String, dynamic> toJson() => {
    "text/html": textHtml,
    "application/epub+zip": applicationEpubZip,
    "application/x-mobipocket-ebook": applicationXMobipocketEbook,
    "application/rdf+xml": applicationRdfXml,
    "image/jpeg": imageJpeg,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
    "application/octet-stream": applicationOctetStream,
  };
}
