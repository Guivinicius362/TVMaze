import 'package:tvmaze_core/tvmaze_core.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ShowImage {
  final String medium;
  final String original;

  ShowImage({required this.medium, required this.original});

  factory ShowImage.fromJson(Map<String, dynamic> json) =>
      _$ShowImageFromJson(json);

  Map<String, dynamic> toJson() => _$ShowImageToJson(this);
}
