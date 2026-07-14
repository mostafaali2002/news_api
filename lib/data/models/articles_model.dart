class ArticlesModel {
  String? title;
  String? description;
  String? imageUrl;
  ArticlesModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  ArticlesModel.fromjson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    imageUrl = json["urlToImage"];
  }
}
