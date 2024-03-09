import 'dart:convert';

import 'package:clean_architecture/core/error/exception.dart';
import 'package:clean_architecture/features/cats/data/models/cat_model.dart';
import 'package:http/http.dart' as http;

abstract class GetCatsDataSource {
  Future<List<CatModel>> getRemoteCats();

  //more data sources can be added here
}

class GetRemoteCatsDataSource implements GetCatsDataSource {
  final http.Client client;

  GetRemoteCatsDataSource(this.client);

  @override
  Future<List<CatModel>> getRemoteCats() async {
    final response = await http
        .get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=100'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((dynamic cat) => CatModel.fromJson(cat)).toList();
    } else {
      throw ServerException();
    }
  }
}
