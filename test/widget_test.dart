import 'package:flutter_test/flutter_test.dart';

import 'package:screensteward_parent/app.dart';

void main() {
  testWidgets('renders the Phase 1 placeholder shell', (tester) async {
    await tester.pumpWidget(const ScreenStewardParentApp());
    expect(find.text('App parent — Phase 1'), findsOneWidget);
  });
}
