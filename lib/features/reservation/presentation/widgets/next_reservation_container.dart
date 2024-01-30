import 'package:court_mate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/theme/tokens.dart' as t;

class NextReservationContainer extends StatelessWidget {
  const NextReservationContainer({
    super.key,
    required this.lastReservation,
  });

  final Reservation lastReservation;

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('EEE, M/D/yy - hh:mm a').format(lastReservation.date);
    final locale = S.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(t.BorderRadius.r16),
      child: Container(
        padding: const EdgeInsets.all(t.Spacing.s12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            t.BorderRadius.r16,
          ),
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/Tennis_court.png',
              ),
              fit: BoxFit.cover),
          color: t.Color.tennisGreen,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${locale.nextReservation} ${lastReservation.name}',
              style: const TextStyle(
                  color: t.Color.white,
                  fontSize: t.FontSize.xl,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: t.Spacing.s16,
              width: double.infinity,
            ),
            Text(
              lastReservation.court,
              style: const TextStyle(
                  color: t.Color.white,
                  fontSize: t.FontSize.md,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: t.Spacing.s4,
            ),
            Container(
              decoration: BoxDecoration(
                color: t.Color.black1.withOpacity(0.25),
                borderRadius: BorderRadius.circular(t.BorderRadius.r8),
              ),
              padding: const EdgeInsets.all(t.Spacing.s4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: t.Color.white,
                  ),
                  const SizedBox(
                    width: t.Spacing.s4,
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                        color: t.Color.courtWhite,
                        fontSize: t.FontSize.md,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
