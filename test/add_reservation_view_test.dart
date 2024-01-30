import 'package:court_mate/features/reservation/presentation/views/add_reservation_form.dart';
import 'package:court_mate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('AddReservationForm Widget - Add Reservation',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: AddReservationForm(
            availableA: 1,
            availableB: 1,
            availableC: 1,
          ),
        ),
      ),
    );

    // Act
    await tester.enterText(find.byType(TextField), 'John Doe');
    await tester.tap(find.text('Agregar'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Cancha:'), findsOneWidget);
    expect(find.text('Fecha'), findsOneWidget);
    expect(find.text('Hora'), findsOneWidget);
  });

  testWidgets('AddReservationForm Widget - Validation: Short Name',
      (WidgetTester tester) async {
    var locale = S();
    // Arrange
    await tester.pumpWidget(
      Builder(builder: (BuildContext context) {
        locale = S.of(context);
        return const MaterialApp(
          home: AddReservationForm(
            availableA: 1,
            availableB: 1,
            availableC: 1,
          ),
        );
      }),
    );

    // Act
    await tester.enterText(find.byType(TextField), 'A');
    await tester.tap(find.text('Agregar'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text(locale.validatorNameLength), findsOneWidget);
  });

  testWidgets('AddReservationForm Widget - Validation: Empty Name',
      (WidgetTester tester) async {
    // Arrange
    (WidgetTester tester) async {
      var locale = S();
      // Arrange
      await tester.pumpWidget(Builder(builder: (BuildContext context) {
        locale = S.of(context);
        return const MaterialApp(
          home: AddReservationForm(
            availableA: 1,
            availableB: 1,
            availableC: 1,
          ),
        );
      }));

      // Act

      await tester.tap(find.text('Agregar'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(locale.validatorNameEmpty), findsOneWidget);
    };
  });
}
