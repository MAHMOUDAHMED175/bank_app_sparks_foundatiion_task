
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'component/component.dart';
import 'component/observer.dart';
import 'layout/Todo_layout.dart';
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async{
//   print('on background');
//   print(message.data.toString());
//   showToast(text: 'اللهم صلى على الحبيب محمدا صلوات الله وسلامه عليه ', state: ToastStates.WARNING);
// }

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('on message');
  //   print(event.data.toString());
  //   showToast(text: 'اللهم صلى سلم وبارك على سيدنا محمد', state: ToastStates.SUCCECC);
  // });
  // //  دى هيبعت اشعار
  // //  دى والتطبيق فى ال background يعنى  لسه مفتوح  فى الخلفيه
  // //ولما تدوس على الاشعار يفتح التطبيق
  // //دى هتنفذ حاجه معينه لما التطبيق يفتح
  // //زى مثلا اظهر showtoast
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('on message opened app [[[[[[[[[[[[[[[[[[[[');
  //
  //   print(event.data.toString());
  //   showToast(text: 'صلى على محمد', state: ToastStates.ERROR);
  //
  // });
  //
  //
  // //دى والتطبيق مفتوح فى الخلفيه
  // // دى هنفذ حاجه معينه والتطبيق فى الخلفيه زى مثلا اظهر  showtoast  على الشاشه الرئيسيه
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //

  Bloc.observer = MyBlocObserver();

  runApp(Files());
}
class Files extends StatefulWidget {

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Files',
      debugShowCheckedModeBanner: false,
      home:TodoLayout() ,
    );
  }
}
