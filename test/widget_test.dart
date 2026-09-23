import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/food_app.dart';

void main() {
  testWidgets('FoodApp loads', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodApp());

    expect(find.byType(FoodApp), findsOneWidget);
  });
}