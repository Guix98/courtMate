import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/presentation/providers/weather_provider.dart';
import 'package:court_mate/features/reservation/presentation/widgets/next_reservation_container.dart';
import 'package:court_mate/features/reservation/presentation/widgets/reservation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:court_mate/features/reservation/presentation/providers/reservation_provider.dart';
import 'package:court_mate/features/reservation/presentation/views/add_reservation_form.dart';
import 'package:court_mate/generated/l10n.dart';
import 'package:court_mate/shared/helpers/snackbars.dart';
import 'package:court_mate/theme/tokens.dart' as t;

class ReservationsPage extends ConsumerStatefulWidget {
  const ReservationsPage({super.key});

  @override
  _ReservationsPageState createState() => _ReservationsPageState();
}

class _ReservationsPageState extends ConsumerState<ReservationsPage> {
  @override
  Widget build(BuildContext context) {
    final reservationsList = ref.watch(reservationsListNotifierProvider);
    Reservation lastReservation = Reservation(
        id: 'id', name: 'name', court: 'court', date: DateTime.now());
    if (reservationsList.isNotEmpty) {
      lastReservation = reservationsList.last;
    }
    final locale = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.appTitle,
        ),
        centerTitle: true,
        backgroundColor: t.Color.courtWhite,
      ),
      backgroundColor: t.Color.courtWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final a = reservationsList
              .where(
                (element) => element.court == '${locale.court} A',
              )
              .length;
          final b = reservationsList
              .where(
                (element) => element.court == '${locale.court} B',
              )
              .length;
          final c = reservationsList
              .where(
                (element) => element.court == '${locale.court} C',
              )
              .length;
          _showAddReservationModal(context, a, b, c);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(t.Spacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (reservationsList.isNotEmpty) ...[
                NextReservationContainer(lastReservation: lastReservation),
                const SizedBox(height: t.Spacing.s12),
                const Divider(),
              ],
              const SizedBox(height: t.Spacing.s12),
              Text(
                locale.upcomingReservations,
                style: const TextStyle(
                    color: t.Color.black1,
                    fontSize: t.FontSize.xl,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: t.Spacing.s12),
              Expanded(
                child: reservationsList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        clipBehavior: Clip.antiAlias,
                        physics: const BouncingScrollPhysics(),
                        itemCount: reservationsList.length,
                        itemBuilder: (context, index) {
                          return ReservationCard(
                            reservation: reservationsList[index],
                            onDelete: () {
                              ref
                                  .read(
                                      reservationsListNotifierProvider.notifier)
                                  .removeReservation(index);
                              ref
                                  .read(
                                      reservationsListNotifierProvider.notifier)
                                  .getAllReservations();
                            },
                          );
                        },
                      )
                    : const Center(
                        child: Text('Aun no tienes reservaciones'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddReservationModal(BuildContext context, int a, int b, int c) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddReservationForm(availableA: a, availableB: b, availableC: c);
      },
    ).then((result) {
      if (result != null) {
        _showSnackbar(result);
      }
    });
  }

  void _showSnackbar(String message) {
    showTextSnackbar(context, message);
  }
}
