import 'package:tvmaze_core/domain/models/links/link_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
part 'links_model.g.dart';

@JsonSerializable()
class Links {
  final Link self;
  final Link? previousepisode;

  Links({required this.self, this.previousepisode});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
