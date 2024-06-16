import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/presentation/shows_list/shows_list.dart';

void main() {
  testWidgets('ShowItemWidget displays show name and image',
      (WidgetTester tester) async {
    final show = ShowModel(
        name: 'Test Show',
        image: HeroImage(
          original: 'https://example.com/image.jpg',
          medium: 'https://example.com/image.jpg',
        ));

    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ShowItemWidget(
            show: show,
          ),
        ),
      ));

      expect(find.text('Test Show'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });

  testWidgets('ShowItemWidget displays placeholder when image is null',
      (WidgetTester tester) async {
    final show = ShowModel(name: 'Test Show', image: null);

    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ShowItemWidget(
            show: show,
          ),
        ),
      ));

      expect(find.text('Test Show'), findsOneWidget);
      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}
