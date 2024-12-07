import 'package:hive/hive.dart';
part 'movies_model.g.dart'; // Required for the generated adapter

@HiveType(typeId: 1)
class MoviesModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? posterURL;

  @HiveField(3)
  String? imdbId;

  @HiveField(4)
  bool? isFavourite;

  MoviesModel({
    this.id,
    this.title,
    this.posterURL,
    this.imdbId,
    this.isFavourite,
  });

  MoviesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterURL = json['posterURL'];
    imdbId = json['imdbId'];
    isFavourite = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['posterURL'] = posterURL;
    data['imdbId'] = imdbId;
    data['isFavourite'] = isFavourite;
    return data;
  }
}
