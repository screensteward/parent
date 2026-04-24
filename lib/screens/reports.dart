import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ipc/dto.dart';
import '../state/usage_report_controller.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(usageReportProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Rapport d\'usage')),
      body: report.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
        data: (r) {
          if (r == null || r.days.isEmpty) {
            return const Center(child: Text('Pas encore de données'));
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _rangeLabel(r),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Expanded(child: _UsageLineChart(days: r.days)),
              ],
            ),
          );
        },
      ),
    );
  }

  static String _rangeLabel(UsageReport r) =>
      'Du ${_ymd(r.from)} au ${_ymd(r.to)}';

  static String _ymd(DateTime d) {
    final l = d.toLocal();
    return '${l.day.toString().padLeft(2, '0')}/${l.month.toString().padLeft(2, '0')}';
  }
}

class _UsageLineChart extends StatelessWidget {
  final List<DailyUsage> days;
  const _UsageLineChart({required this.days});

  @override
  Widget build(BuildContext context) {
    final maxY = days
        .map((d) => d.minutes)
        .fold<int>(0, (a, b) => a > b ? a : b)
        .toDouble();
    final adjustedMaxY = maxY == 0 ? 60.0 : (maxY * 1.15).ceilToDouble();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (days.length - 1).toDouble(),
        minY: 0,
        maxY: adjustedMaxY,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            barWidth: 3,
            belowBarData: BarAreaData(show: true),
            spots: [
              for (var i = 0; i < days.length; i++)
                FlSpot(i.toDouble(), days[i].minutes.toDouble()),
            ],
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: (v, _) =>
                  Text('${v.toInt()}', style: const TextStyle(fontSize: 10)),
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (v, _) {
                final i = v.toInt();
                if (i < 0 || i >= days.length) return const SizedBox.shrink();
                final d = days[i].date.toLocal();
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: true),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
