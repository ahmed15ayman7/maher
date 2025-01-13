import 'package:flutter/material.dart';
import 'package:maher/components/ui/ProgressIndicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DynamicCard extends StatelessWidget {
  final String title;
  final int timesChanged;
  final String startDate;
  final String? endDate;
  final int approvals;
  final double? progressPercentage;
  final bool isProgressPercentage;
  final VoidCallback? onAdd;

  DynamicCard({
    required this.title,
    required this.timesChanged,
    required this.startDate,
    this.endDate,
    required this.approvals,
    this.progressPercentage,
    this.isProgressPercentage = false,
    this.onAdd,
  });

  Color _getProgressColor(double percentage) {
    if (percentage < 25) return Colors.red;
    if (percentage < 75) return Color(0xffBEAE02);
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color(0xFF00CED1),
            Color(0xFFFF5BF8),
            Color(0xFFC903C0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF263238),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Progress Indicator or Add Button
                if (progressPercentage != null)
                  isProgressPercentage
                      ? ProgressIndicatorComponent(
                          percentage: progressPercentage!)
                      : Container(
                          decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(30)),
                          child: CircularPercentIndicator(
                            radius: 30.0,
                            backgroundWidth: 1,
                            lineWidth: 6.0,
                            backgroundColor: Color(0xffD9D9D9),
                            animation: true,
                            animationDuration: 1200,
                            percent: progressPercentage! / 100,
                            center: new Text(
                              '$progressPercentage %',
                              style: TextStyle(
                                  color:
                                      _getProgressColor(progressPercentage!)),
                            ),
                            progressColor:
                                _getProgressColor(progressPercentage!),
                          ))
                else
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: onAdd,
                  ),
                const SizedBox(width: 16),
                // Details Section
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                                size: 10, Icons.sync, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              'عدد المرات: $timesChanged',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                                size: 10,
                                Icons.calendar_today_rounded,
                                color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              startDate,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                        if (endDate != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                  size: 10,
                                  Icons.notifications_outlined,
                                  color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                endDate!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                                size: 10,
                                Icons.photo_outlined,
                                color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              '$approvals موافقات',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
