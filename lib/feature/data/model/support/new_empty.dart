import 'dart:convert';

NewEmpty newEmptyFromJson(String str) => NewEmpty.fromJson(json.decode(str));

String newEmptyToJson(NewEmpty data) => json.encode(data.toJson());

class NewEmpty {
  int count;
  dynamic next;
  dynamic previous;
  List<dynamic> results;
  static NewEmpty? _instance;
  static get instance=>_instance??NewEmpty(count:0,next: null,previous: null,results: []);
  NewEmpty({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory NewEmpty.fromJson(Map<String, dynamic> json) => NewEmpty(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<dynamic>.from(json["results"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x)),
  };
}
