import 'dart:async';

import 'package:flutter/cupertino.dart';

/*
  اسم المزود لا يهم ف بامكانك تسميته كما شئت
  مهم جدا ان يتم توريث المزود خصائص ال
  ChangeNotifier
  حيث بذلك يمكن للمزود ان يرسل اشعارات للاجزاء المراقبة في التطبيق
*/
class ManagerProvider extends ChangeNotifier {
  int counter = 0; // متغير العداد
  Timer? timer; // المؤقت
  bool isCounting = false; // علامة للتفريق بين اوضاع العداد

  // هذا الكود يتم تفعيله في حال انهاء المزود لانه
  // من المهم انهاء المؤقت في حال الاستغناء عن المزود
  @override
  void dispose() {
    super.dispose();
    isCounting = false;
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
  }

  // دالة العداد حيث يتم زيادة العداد بمقدار 1 كل ثانية
  void startCounting() {
    isCounting = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      counter += 1;
      notifyListeners(); // اشعار المراقبين بالوضع الجديد
    });
  }

  // دالة ايقاف العداد
  void stopCounting() {
    isCounting = false;
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
    notifyListeners(); // اشعار المراقبين بالوضع الجديد
  }

  // دالة اعادة ضبط العداد
  void resetCounter() {
    counter = 0;
    notifyListeners(); // اشعار المراقبين بالوضع الجديد
  }
}
