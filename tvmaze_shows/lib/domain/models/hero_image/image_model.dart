import 'package:tvmaze_core/tvmaze_core.dart';

part 'image_model.g.dart';

@JsonSerializable()
class HeroImage {
  final String medium;
  final String original;

  HeroImage({required this.medium, required this.original});

  factory HeroImage.fromJson(Map<String, dynamic> json) =>
      _$HeroImageFromJson(json);

  Map<String, dynamic> toJson() => _$HeroImageToJson(this);
}
