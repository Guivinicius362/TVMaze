import 'package:tvmaze_core/tvmaze_core.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class Schedule {
  final String time;
  final List<String> days;

  Schedule({required this.time, required this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
