// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:build_buster/build_buster.dart';
import 'package:build_buster/view_model/providers/helper_source_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:build_buster/model/sources/helper_source.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([HelperSource])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockedHelperSource = MockHelperSource();

  testWidgets('App smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;

    when(mockedHelperSource.health()).thenAnswer((_) async => 'Halfway there!');

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [helperSourceProvider.overrideWithValue(mockedHelperSource)],
        child: const BuildBuster(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(BuildBuster), findsOneWidget);
  });
}
