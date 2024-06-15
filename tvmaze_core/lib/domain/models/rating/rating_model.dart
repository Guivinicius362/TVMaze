import 'package:tvmaze_core/tvmaze_core.dart';

part 'rating_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.ratingTypeId)
class Rating {
  @HiveField(0)
  final double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
