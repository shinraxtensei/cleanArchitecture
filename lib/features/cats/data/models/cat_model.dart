import 'package:clean_architecture/features/cats/domain/entities/cat_entity.dart';

class CatModel extends Cat {
  CatModel(
      {required super.id,
      required super.url,
      required super.width,
      required super.height});

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'url': super.url,
      'width': super.width,
      'height': super.height,
    };
  }
}
