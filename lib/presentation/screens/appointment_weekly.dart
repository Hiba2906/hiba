import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';
import 'package:projet_fin_etude/presentation/widgets/confirme_dailog.dart';
import 'package:projet_fin_etude/presentation/widgets/confirmed_dailog.dart';




class AppointmentWeekly extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentWeekly> {
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;
  final List<String> _weekDays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  List<DateTime> _getCurrentWeekDates() {
    DateTime startOfWeek =
        _currentDate.subtract(Duration(days: _currentDate.weekday % 7));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void _goToNextWeek() {
    setState(() {
      _currentDate = _currentDate.add(Duration(days: 7));
      _selectedDate = null;
    });
  }

  void _goToPreviousWeek() {
    setState(() {
      _currentDate = _currentDate.subtract(Duration(days: 7));
      _selectedDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentWeek = _getCurrentWeekDates();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryColor,
      ),
            //nav bar
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'SELECT TIME',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _goToPreviousWeek,
                ),
                Text(
                  '${DateFormat('d MMM').format(currentWeek.first)} - ${DateFormat('d MMM').format(currentWeek.last)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _goToNextWeek,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: _weekDays
                  .map(
                    (day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              child: Row(
                children: currentWeek.map((day) {
                  bool isSelected = _selectedDate != null &&
                      day.day == _selectedDate!.day &&
                      day.month == _selectedDate!.month &&
                      day.year == _selectedDate!.year;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDate = day;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : null,
                          shape: BoxShape.circle,
                        ),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                
  onPressed: () {
   showDialog(
  context: context,
  builder: (context) => ConfirmDialog(
    date: "2025-04-20",
    onCancel: () {
      Navigator.of(context).pop(); // غلق Dialog الأول
    },
    onConfirm: () {
      Navigator.of(context).pop(); // غلق Dialog الأول
      showDialog(
        context: context,
        builder: (context) =>  ConfirmedDialog(turnNumber: 5),
      );
    },
  ),
);




                },
                child: const Text(
                  'BOOK NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
