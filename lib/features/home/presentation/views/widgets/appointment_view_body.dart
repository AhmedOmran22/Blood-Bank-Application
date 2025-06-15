import 'package:blood_bank/core/utils/app_colors.dart';
// import 'package:blood_bank/features/home/data/models/appointment_request_model.dart';
import 'package:blood_bank/features/home/presentation/cubits/appointment/appointment_cubit.dart';
import 'package:blood_bank/features/home/presentation/cubits/appointment/appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppointmentViewBody extends StatefulWidget {
  const AppointmentViewBody({super.key});

  @override
  State<AppointmentViewBody> createState() => _AppointmentViewBodyState();
}

class _AppointmentViewBodyState extends State<AppointmentViewBody> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final List<String> bloodBankNames = [
    'Al-Delengat Central Hospital Blood Bank',
    'Abu Al-Matamir Central Hospital Blood Bank',
    'Shubra General Hospital Blood Bank',
    'Al-Munira General Hospital Blood Bank',
    'Manshiet El-Bakri General Hospital Blood Bank',
    "Dar Al-Salam Central Hospital Blood Bank",
    "Al-Khazindara General Hospital Blood Bank",
    "Bulaq General Hospital Blood Bank",
    "Chest Hospital Al-Abbasiya Blood Bank",
    "Al-Zawiya Al-Hamra General Hospital Blood Bank",
  ];
  String? selectedBankName;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment booked successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AppointmentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message,
                  style: const TextStyle(color: Colors.black)),
              backgroundColor: Colors.deepOrange[200],
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Blood Bank',
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decorationColor: Colors.deepOrange[200]),
                    border: const OutlineInputBorder(),
                  ),
                  style: TextStyle(
                      color: Colors.deepOrange[200],
                      fontWeight: FontWeight.bold),
                  dropdownColor: Colors.white,
                  items: bloodBankNames
                      .map((bank) => DropdownMenuItem(
                            value: bank,
                            child: Text(bank),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBankName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a blood bank';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  child: Text(
                    selectedDate == null
                        ? 'Select Date'
                        : DateFormat.yMMMd().format(selectedDate!),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  child: Text(
                    selectedTime == null
                        ? 'Select Time'
                        : selectedTime!.format(context),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: SizedBox(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            selectedDate != null &&
                            selectedTime != null) {
                          final formattedDate =
                              DateFormat('yyyy-MM-dd').format(selectedDate!);
                          final formattedTime = selectedTime!.format(context) ==
                                  "12:00 AM"
                              ? "00:00:00"
                              : "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}:00";

                          // final model = AppointmentRequestModel(
                          //   dateOnly: formattedDate,
                          //   timeOnly: formattedTime,
                          // );

                          context.read<AppointmentCubit>().bookAppointment(
                              date: formattedDate, time: formattedTime);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: state is AppointmentLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Book Appointment',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
