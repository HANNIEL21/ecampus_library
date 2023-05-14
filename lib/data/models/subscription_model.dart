import 'dart:math';

import '../enums.dart';

class SubscriptionInfo {
  final int subscribedDate;
  final int expirationDate;
  final SubscriptionStatus status;

  const SubscriptionInfo(
      {required this.subscribedDate,
      required this.expirationDate,
      required this.status});

  Map<String, dynamic> toJson() {
    return {
      'subscribedDate': subscribedDate,
      'expirationDate': expirationDate,
      'status': status.index
    };
  }

  SubscriptionInfo copyWith(
      {int? subscribedDate, int? expirationDate, SubscriptionStatus? status}) {
    return SubscriptionInfo(
        subscribedDate: subscribedDate ?? this.subscribedDate,
        expirationDate: expirationDate ?? this.expirationDate,
        status: status ?? this.status);
  }

  factory SubscriptionInfo.fromJson(Map<String, dynamic> json) {
    return SubscriptionInfo(
        subscribedDate: json['subscribedDate'],
        expirationDate: json['expirationDate'],
        status: SubscriptionStatus.values[json['status'] as int]);
  }

  static SubscriptionInfo subscribe({bool isTrial = true}) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    SubscriptionStatus status = SubscriptionStatus.TRIAL;
    int duration = TRIAL_PERIOD;
    if (!isTrial) {
      duration = MONTHLY_SUB_DURATION;
      status = SubscriptionStatus.ACTIVE;
    }
    final newNow = now.add(Duration(days: duration));
    DateTime twoDaysLater = DateTime(newNow.year, newNow.month, newNow.day);
    return SubscriptionInfo(
        subscribedDate: date.millisecondsSinceEpoch,
        expirationDate: twoDaysLater.millisecondsSinceEpoch,
        status: status);
  }

  static SubscriptionInfo updateSubscription(
      {required SubscriptionInfo currentSubscriptionInfo}) {
    DateTime now = DateTime.now();
    DateTime expiredDate = DateTime.fromMillisecondsSinceEpoch(
        currentSubscriptionInfo.expirationDate);

    DateTime currentDateFormat = DateTime(now.year, now.month, now.day);
    DateTime expiredDateFormat =
        DateTime(expiredDate.year, expiredDate.month, expiredDate.day);
    if (currentDateFormat.toString() == expiredDateFormat.toString()) {
      return currentSubscriptionInfo.copyWith(
          status: SubscriptionStatus.EXPIRED);
    }
    return currentSubscriptionInfo;
  }
}
