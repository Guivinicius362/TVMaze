import 'package:tvmaze_core/tvmaze_core.dart';

part 'link_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.linkTypeId)
class Link {
  @HiveField(0)
  final String href;

  Link({required this.href});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
