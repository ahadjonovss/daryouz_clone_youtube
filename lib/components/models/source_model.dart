class Source {
  // "id": "business-insider",
  // "name": "Business Insider"

  String id;
  String name;

  Source({
    required this.name,
    required this.id,
  });

  factory Source.fromJson(Map<String,dynamic> json){
    return Source(name: json["name"]??"no data", id: json["id"]??"no data");
  }

}
