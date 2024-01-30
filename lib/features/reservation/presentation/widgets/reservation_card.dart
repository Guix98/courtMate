import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/presentation/providers/weather_provider.dart';
import 'package:court_mate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:court_mate/theme/tokens.dart' as t;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ReservationCard extends ConsumerWidget {
  final Reservation reservation;
  final void Function()? onDelete;

  const ReservationCard({super.key, required this.reservation, this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = S.of(context);
    DateTime reservationDate = reservation.date;
    int nightStartHour = 18;
    int nightEndHour = 4;
    bool isNightTime = reservationDate.hour >= nightStartHour ||
        reservationDate.hour < nightEndHour;

    Color tileColor = isNightTime ? t.Color.nightPurple : t.Color.dayBlue;
    Color textColor = isNightTime ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.only(bottom: t.Spacing.s12),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: FutureBuilder(
            future: ref.read(forecastFutureProvider.future),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mientras carga
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // En caso de error
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                // Si no hay datos disponibles
                return const Center(
                  child: Text('No hay datos disponibles'),
                );
              } else {
                // Si la carga fue exitosa
                final clouds = snapshot.data!.clouds.all;

                return SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animations/cloudy.json',
                        width: (MediaQuery.of(context).size.width / 10) - 5,
                      ),
                      Text(
                        "${clouds.toString()}%",
                        style: TextStyle(
                            color: textColor, fontSize: t.FontSize.xxs),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          contentPadding:
              const EdgeInsets.only(left: t.Spacing.s16, right: t.Spacing.s4),
          tileColor: tileColor,
          title: Text(
            reservation.name,
            style: TextStyle(color: textColor),
          ),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\"${reservation.court}\" ",
                style: TextStyle(color: textColor),
              ),
              Text(
                DateFormat('EEE, M/D/yy - hh:mm a')
                    .format(reservation.date)
                    .toString(),
                style: TextStyle(color: textColor),
              ),
            ],
          ),
          trailing: InkWell(
            onTap: onDelete,
            child: const Icon(
              Icons.delete,
              color: t.Color.white,
            ),
          ),
        ),
      ),
    );
  }
}
