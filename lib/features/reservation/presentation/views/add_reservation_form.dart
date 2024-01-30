import 'package:court_mate/features/reservation/domain/entities/reservation.dart';
import 'package:court_mate/features/reservation/presentation/providers/reservation_provider.dart';
import 'package:court_mate/generated/l10n.dart';
import 'package:court_mate/shared/helpers/snackbars.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

import 'package:court_mate/theme/tokens.dart' as t;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddReservationForm extends ConsumerStatefulWidget {
  final int availableA;
  final int availableB;
  final int availableC;
  const AddReservationForm({
    super.key,
    required this.availableA,
    required this.availableB,
    required this.availableC,
  });

  @override
  _AddReservationFormState createState() => _AddReservationFormState();
}

class _AddReservationFormState extends ConsumerState<AddReservationForm> {
  final _nameController = TextEditingController();
  bool _userTriedToSubmit = false;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String _selectedCourt = "";
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: locale.username,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(t.BorderRadius.r32)),
              errorText: _validateName(_nameController.text),
            ),
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(t.BorderRadius.r32),
                border: Border.all(color: t.Color.black1)),
            padding: const EdgeInsets.symmetric(
                vertical: t.Spacing.s4, horizontal: t.Spacing.s8),
            child: Row(
              children: [
                Text('${locale.court}: '),
                const SizedBox(
                  width: t.Spacing.s8,
                ),
                DropdownButton<String>(
                  value: _selectedCourt,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedCourt = value!;
                    });
                  },
                  items: [
                    "",
                    "${locale.court} A",
                    "${locale.court} B",
                    "${locale.court} C"
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null && pickedDate != _selectedDate) {
                setState(() {
                  _selectedDate = pickedDate;
                });
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Fecha',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(t.BorderRadius.r32)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${_selectedDate.toLocal()}".split(' ')[0],
                  ),
                  const Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () async {
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: _selectedTime,
              );
              if (pickedTime != null && pickedTime != _selectedTime) {
                setState(() {
                  _selectedTime = pickedTime;
                });
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Hora',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(t.BorderRadius.r32)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedTime.format(context),
                  ),
                  const Icon(Icons.access_time),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _userTriedToSubmit = true;
              });
              _addReservation(context);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  void _addReservation(BuildContext context) {
    final name = _nameController.text;
    final court = _selectedCourt;
    final date = _selectedDate;
    final time = _selectedTime.format(context);
    const uuid = Uuid();
    final id = uuid.v1();

    final nameError = _validateName(name);
    final reservationsList = ref.read(reservationsListNotifierProvider);
    final locale = S.of(context);

    final usedSpaces = reservationsList
        .where((element) => (element.court == court &&
            (element.date.day == date.day &&
                element.date.month == date.month &&
                element.date.year == date.year)))
        .length;
    if (usedSpaces >= 3) {
      showTextSnackbar(context, locale.onlyThree);
    } else {
      if (nameError == null && _selectedCourt != "") {
        final message =
            'Reserva agregada:\nNombre: $name\nCancha: $court\nFecha: $date.toString()\nHora: $time';
        ref.read(reservationsListNotifierProvider.notifier).addNewReservation(
            Reservation(
                id: id,
                name: name,
                court: court,
                date: date.copyWith(
                    hour: _selectedTime.hour, minute: _selectedTime.minute)));
        ref
            .read(reservationsListNotifierProvider.notifier)
            .getAllReservations();
        Navigator.pop(context, message);
      }
    }
  }

  String? _validateName(String value) {
    final locale = S.of(context);
    if (_userTriedToSubmit && value.isEmpty) {
      return locale.validatorNameEmpty;
    } else if (_userTriedToSubmit && value.length < 2) {
      return locale.validatorNameLength;
    }
    return null;
  }
}
