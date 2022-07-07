import 'package:game_news/app/features/home/domain/entity/noticia_game_entity.dart';

class NoticiaGameModel extends NoticiaGameEntity {
  
  NoticiaGameModel({
    required String author, 
    required String title, 
    required String description, 
    required String url, 
    required String urlImage,
    }) : super(
      author: author, 
      title: title, 
      description: description, 
      url: url, 
      urlImage: urlImage
    );

  factory NoticiaGameModel.fromJson(Map<String, dynamic> map) {
    return NoticiaGameModel(
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlImage: map['urlToImage'] ?? '',
    );
  }

  static List<NoticiaGameModel> jsonToList(List list){
    return list.map((e) => NoticiaGameModel.fromJson(e)).toList();
  }
}