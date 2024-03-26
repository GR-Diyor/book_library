import 'dart:convert';

Empty emptyFromJson(String str) => Empty.fromJson(json.decode(str));

String emptyToJson(Empty data) => json.encode(data.toJson());

class Empty {
   String kind="books#volumes";
   int totalItems=0;

   static Empty? _instance;
   static get instance=>_instance??Empty(kind:"books#volumes",totalItems:0);

  Empty({
     required this.kind,
     required this.totalItems,
  });

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    kind: json["kind"],
    totalItems: json["totalItems"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "totalItems": totalItems,
  };
}
