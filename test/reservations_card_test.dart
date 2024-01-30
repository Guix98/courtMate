import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:court_mate/features/reservation/presentation/widgets/reservation_card.dart';

void main() {
  testWidgets('ReservationCard Widget - Night Time',
      (WidgetTester tester) async {
    // Arrange
    final reservation = Reservation(
      id: "id",
      name: 'John Doe',
      court: 'Court A',
      date: DateTime(2023, 1, 18, 20, 0), // Night time
    );

    // Act
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ReservationCard(
            reservation: reservation,
            onDelete: () {},
          ),
        ),
      ),
    );

    // Assert
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Court A'), findsOneWidget);
    expect(find.text('50%'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('ReservationCard Widget - Date Format',
      (WidgetTester tester) async {
    // Arrange
    final reservation = Reservation(
      id: "id",
      name: 'John Doe',
      court: 'Court A',
      date: DateTime(2023, 1, 18, 20, 0),
    );

    // Act
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ReservationCard(
            reservation: reservation,
            onDelete: () {},
          ),
        ),
      ),
    );

    // Assert
    expect(find.text('Wed, 1/18/23 - 08:00 PM'), findsOneWidget);
  });
}
