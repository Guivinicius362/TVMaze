import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';
import 'package:tvmaze_core/domain/models/links/link_model.dart';
import 'package:tvmaze_core/domain/models/links/links_model.dart';
import 'package:tvmaze_core/domain/models/rating/rating_model.dart';

Future<void> initHive() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(HeroImageAdapter())
    ..registerAdapter(LinkAdapter())
    ..registerAdapter(LinksAdapter())
    ..registerAdapter(RatingAdapter());
}

class TVMazeHiveKeys {
  // box names
  static const favoriteShowsBoxName = 'favorite_shows';
  // typeId
  static const heroImageTypeId = 0;
  static const linkTypeId = 1;
  static const linksTypeId = 2;
  static const ratingTypeId = 3;
  static const countryTypeId = 4;
  static const networkTypeId = 5;
  static const seasonTypeId = 6;
  static const showTypeId = 7;
  static const externalTypeId = 8;
  static const scheduleTypeId = 9;
}
