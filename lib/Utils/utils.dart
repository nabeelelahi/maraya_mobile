import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../utils/color_utils.dart';
import '../utils/font_utils.dart';
import 'image_utils.dart';


String? validateName(String? value, String? key) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return '${key} must be more than 2 characters';
  } else if (value.contains(' ')) {
    return 'Space is not allowed between name';
  }
}

String? validateEventName(String? value) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Name must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between name';
  }
}

String? validateNickName(String? value) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Nick Name must be more than 2 characters';
  } else if (value.contains(' ')) {
    return 'Space is not allowed between nick name';
  }
}

String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
  if (value == null) {
    return null;
  } else if (value.length <= 12) return 'Mobile Number must be of 10 digit';
  if (value.length > 15) return 'Mobile number cannot be more than 10 digits';
  // if (value.contains('-')) {
  //   return 'Only numbers are allowed';
  // }
}

String? validatePassword(String? value) {
  if(value == null || value.isEmpty){
    return 'Password is required';
  }
  else if (value != null && value.length < 8) {
    return 'Password must be atleast 8 charaters';
  } else {
    return null;
  }
}

String? validatePasswordCheck(String value, String key, {String confirmPass = ''}) {

  RegExp pass_valid = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#)(])[A-Za-z\d@$!%*?&#()]{8,}$");
  if (value.length == 0)
    return '$key is required';
  else if (value.length < 8)
    return '$key must be greater than 8 characters';
  else if (confirmPass.isNotEmpty && value != confirmPass) {
    return 'Password and confirm password must be same';
  }
  else if(!pass_valid.hasMatch(value)){
    return "Password should be one uppercase letter, one lowercase letter, one digit and one special character";
  }
  else {
    return null;
  }
}

String? validateEmail(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  if(value == null){
    return "Email is required";
  }
  if (value != null && !regex.hasMatch(value)) {
    return 'Enter valid email';
  } else {
    return null;
  }
}

String? validateField(String? value, String? key) {
  if (value != null && value.length == 0) {
    return '${key} is required';
  }
}

String? validateDescription(String? value) {
  if (value != null && value.length == 0 && value.length < 10) {
    return 'Description must be atleast of 10 characters';
  }
}

String? validateGraduationYear(String value) {
  if (value.length == 0) {
    return 'Required';
  } else if (value.contains('-')) {
    return 'Only numbers are allowed';
  } else if (value.length > 4) {
    return 'Example: 2005';
  } else {
    return null;
  }
}

Future<bool> isConnected() async {
  try {
//    final result = await InternetAddress.lookup('example.com');
//    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//      return true;
//    }else
//      return false;
    final result = await InternetAddress.lookup('example.com')
        .timeout(Duration(seconds: 3), onTimeout: () {
      return [];
    });
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

void IsConnected(Function(bool) connected) async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connected(true);
    } else {
      connected(false);
    }
  } on SocketException catch (_) {
    connected(false);
  }
}

Timer? _timer;

Future<void> showLoading() {
  _timer = Timer(const Duration(seconds: 25), () {
    if (EasyLoading.isShow) {
      hideLoading();
      EasyLoading.showToast("Something went Wrong!, Try Again");
    }
  });

  return EasyLoading.show(
    status: "Loading..",
    maskType: EasyLoadingMaskType.black,
  );
}

Future<void> hideLoading() {
  _timer?.cancel();
  return EasyLoading.dismiss();
}

String formatDate(
    {required int dateInMilliSeconds, String dateFormat = "dd/MMM/yyyy"}) {
  // DateTime dateTime = DateFormat("yyyy-MM-dd").parse(dateString);
  if (dateInMilliSeconds == null) {
    return dateFormat;
  } else {
    return DateFormat(dateFormat)
        .format(DateTime.fromMillisecondsSinceEpoch(dateInMilliSeconds));
  }
}

//Date: 'EEEE, dd MMMM yyyy'  Time: 'hh:mm a'"
String formatTime(String timeString, String timeFormat) {
  DateTime dateTime = DateFormat("H:m").parse(timeString);
  return DateFormat(timeFormat).format(dateTime);
}

String formatTimee(String timeString, String timeFormat) {
  DateTime dateTime = DateFormat("hh:mm:ss").parse(timeString);
  return DateFormat(timeFormat).format(dateTime);
}

String format24To12(String timeString, String timeFormat) {
  DateTime dateTime = DateFormat("HH:mm").parse(timeString);
  return DateFormat(timeFormat).format(dateTime);
}

String format12To24(String timeString, String timeFormat) {
  if(timeString.isEmpty){
    return "";
  }
  else{
    DateTime dateTime = DateFormat("hh:mm a").parse(timeString);
    return DateFormat(timeFormat).format(dateTime);
  }

}

String getDayName() {
  DateTime today = DateTime.now();
  DateFormat Format = DateFormat('EEE');
  return Format.format(today);
}



String formatDateAndTime(
    {required String dateString, String dateFormat = "MM-dd-yyyy hh:mm a"}) {
  DateTime dateTime = DateFormat("yyyy-MM-dd H:m:s").parse(dateString);
  return DateFormat(dateFormat).format(dateTime);
}

String formatDateAndTimeCopy(
    {required String dateString, String dateFormat = "dd MMM yyyy hh:mm a"}) {
  var CheckDate = dateString.replaceAll("T", " ");
  DateTime dateTime = DateFormat("yyyy-MM-dd H:m:s").parse(CheckDate.split(".")[0]);
  return DateFormat(dateFormat).format(dateTime);
}

String formatDatee(
    {required String dateString, String dateFormat = "dd MMM yyyy"}) {

  DateTime dateTime = DateFormat("yyyy-MM-dd").parse(dateString);
  return DateFormat(dateFormat).format(dateTime);
}


String durationToString(Duration d) {
  /// Returns a formatted string for the given Duration  [d] to be DD:HH:mm:ss
  /// and ignore if 0.
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('${days}d');
  }
  if (tokens.isNotEmpty || hours != 0) {
    tokens.add('${hours}h');
  }
  if (tokens.isNotEmpty || minutes != 0) {
    tokens.add('${minutes}m');
  }
  tokens.add('${seconds}s');

  return tokens.join(':');
}

/// Show option to select image from Gallery or Camera
void showImageSelectOption(context, Function completionHandler) {
  // if (Platform.isIOS) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => CupertinoActionSheet(
  //       actions: [
  //         CupertinoActionSheetAction(
  //           child: Text('Camera'),
  //           onPressed: () {
  //             Navigator.pop(context);
  //             addImageFromSource(
  //               ImageSource.camera,
  //                   (image) {
  //                 completionHandler(image);
  //               },
  //             );
  //           },
  //         ),
  //         CupertinoActionSheetAction(
  //           child: Text('Gallery'),
  //           onPressed: () {
  //             addImageFromSource(
  //               ImageSource.gallery,
  //                   (image) {
  //                 completionHandler(image);
  //               },
  //             );
  //             Navigator.pop(context);
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
  // else {}
  showModalBottomSheet(
    context: context,
    builder: (context) => Wrap(children: [
      ListTile(
        leading: Icon(Icons.camera_alt),
        title: Text('Camera'),
        onTap: () {
          Navigator.pop(context);
          addImageFromSource(
            ImageSource.camera,
                (image) {
              completionHandler(image);
            },
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.photo_album),
        title: Text('Gallery'),
        onTap: () {
          addImageFromSource(
            ImageSource.gallery,
                (image) {
              completionHandler(image);
            },
          );
          Navigator.pop(context);
        },
      ),
    ]),
  );
}

/// Add image from selected source
void addImageFromSource(ImageSource source, Function completionHandler) {
  ImagePicker().pickImage(source: source).then(
        (image) {
      if (image == null) return null;
      return completionHandler(File(image.path));
    },
  ).catchError(
        (error) {
      print('Failed to pick image: $error');
    },
  );
}

String timeAgoSinceDate(String datetime) {
  DateTime date = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(datetime.replaceAll("T", " ").replaceAll("Z", ""), true).toLocal();
  final date2 = DateTime.now().toLocal();
  final difference = date2.difference(date);

  if (difference.inSeconds < 5) {
    return 'Just now';
  } else if (difference.inSeconds <= 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes <= 1) {
    return '1 minute ago';
  } else if (difference.inMinutes <= 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours <= 1) {
    return '1 hour ago';
  } else if (difference.inHours <= 23) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays <= 1) {
    return '1 day ago';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays} days ago';
  } else if ((difference.inDays / 7).ceil() <= 1) {
    return '1 week ago';
  } else if ((difference.inDays / 7).ceil() <= 4) {
    return '${(difference.inDays / 7).ceil()} weeks ago';
  } else if ((difference.inDays / 30).ceil() <= 1) {
    return '1 month ago';
  } else if ((difference.inDays / 30).ceil() <= 30) {
    return '${(difference.inDays / 30).ceil()} months ago';
  } else if ((difference.inDays / 365).ceil() <= 1) {
    return '1 year ago';
  }
  return '${(difference.inDays / 365).floor()} years ago';
}

String DifferenceDate(String date1, String date2){
  DateTime dateTime = DateFormat("yyyy-MM-dd").parse(date1);
  DateTime dateTime2 = DateFormat("yyyy-MM-dd").parse(date2);
  final difference = dateTime.difference(dateTime2);
  var DAYS = difference.inDays + 1;
  return DAYS.toString();
}

String convertTimeToLocal(String Date){
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(Date.replaceAll("T", " ") ?? "", true);
  var dateLocal = dateTime.toLocal();
  return dateLocal.toString().split(" ")[1].substring(0,5);
}

String convertTimeToUtc(String Date){
  var dateTime = DateFormat("HH:mm").parse(Date.replaceAll("T", " ") ?? "", false);
  var dateLocal = dateTime.toUtc();
  String TIME = dateLocal.toString().split(" ")[1];
  List<String> ONLYTIME = TIME.toString().split(":");
  String TIMEE = ONLYTIME[0] + ":" + ONLYTIME[1];
  return TIMEE;
}

String convertTimeToLocalDisplay(String Date){
  var dateTime = DateFormat("HH:mm").parse(Date.replaceAll("T", " ") ?? "", true);
  var dateLocal = dateTime.toLocal();
  String TIME = dateLocal.toString().split(" ")[1];
  List<String> ONLYTIME = TIME.toString().split(":");
  String TIMEE = ONLYTIME[0] + ":" + ONLYTIME[1];
  return TIMEE;
}

String DifferenceTime(String startTime, String endTime, String formatTime){
  print("STARTTIME:" + startTime);
  print("ENDTIME:" + endTime);
  DateTime dateTime = DateFormat(formatTime).parse(startTime);
  DateTime dateTime1 = DateFormat(formatTime).parse(endTime);
  print("DATE:" + dateTime.toString());
  print("DATE1:" + dateTime1.toString());
  final difference = dateTime.difference(dateTime1);
  print("DIFFERECNE:" + difference.toString());
  return difference.inHours.toString().replaceAll("-", "");
}

String DifferenceTimeTotal(String startTime, String endTime, String formatTime){
  DateTime dateTime = DateFormat(formatTime).parse(startTime);
  DateTime dateTime1 = DateFormat(formatTime).parse(endTime);
  print("DATE:" + dateTime.toString());
  print("DATE1:" + dateTime1.toString());
  final difference = dateTime.difference(dateTime1);
  print("DIFFERECNE:" + difference.toString());
  String hour = difference.toString().split(":")[0].replaceAll("-", "");
  String minutes = difference.toString().split(":")[1];
  print("DIFFERECNE:" + hour);
  print("DIFFERECNE:" + minutes);
  // return difference.inHours.toString().replaceAll("-", "");
  return hour + ":" + minutes;
}

// void LogoutUser(){
//   Prefs.removeUser();
//   Prefs.removeFilter();
//   Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new LoginScreen()));
// }

int daysInMonth(DateTime date){
  var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}


Future<File> compressFile(File file) async {
  final filePath = file.absolute.path;
  final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
  final splitted = filePath.substring(0, (lastIndex));
  final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path, outPath,
    quality: 30,
  );
  File FILE = File(result!.path);
  return FILE;
}

Future<String?> getThumbnai(String URL) async {
  final fileName = await VideoThumbnail.thumbnailFile(
    // video: URL != "" ? URL : "https://res.cloudinary.com/dwjylowil/video/upload/v1672808780/uploads/gallery/edc5d29973/thumbnail/tsw5hmmwe6ewaf7znd8j.mp4",
    video: URL != "" ? URL : "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    thumbnailPath: (await getApplicationDocumentsDirectory()).path,
    imageFormat: ImageFormat.PNG,
    maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    quality: 75,
  );
  print("fileName");
  print(fileName);

  return fileName;

}

Future<String?> selectDate(BuildContext context, DateTime? InitialDateTime) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: InitialDateTime ?? DateTime(1998),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primaryColor: ColorUtils.black,
            // accentColor: ColorUtils.black,
            colorScheme: ColorScheme.light(primary: ColorUtils.black),
            disabledColor: Colors.brown,
            textTheme:
            TextTheme(bodyText1: TextStyle(color: ColorUtils.black)),
          ),
          child: child!,
        );
      });
  if (picked != null && picked != DateTime.now()){
    var DATE = picked.toString().split(" ");
    return DATE[0].toString();
  }

}

void LogoutUser(){
  hideLoading();
  // Prefs.removeUser();
  // Navigator.of(GlobalVariable.navState.currentContext!, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new LoginScreen()));
}

class GlobalVariable {
  /// [navState] usage can be found in [notification_notifier.dart] file.
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}

Future<String?> selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primaryColor: ColorUtils.black,
            // accentColor: ColorUtils.main_yellow,
            colorScheme: ColorScheme.dark(primary: ColorUtils.white),
            disabledColor: Colors.brown,
            textTheme:
            TextTheme(bodyText1: TextStyle(color: ColorUtils.black)),
          ),
          child: child!,
        );
      });
  if (picked != null && picked != DateTime.now()){
    print(picked);
    return format24To12(picked.hour.toString() + ":" + picked.minute.toString(), "hh:mm a");
  }

}



