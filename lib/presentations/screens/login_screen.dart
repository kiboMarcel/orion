import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:validators/validators.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../widgets/button.dart';
import '../widgets/password_input_field.dart';
import '../widgets/text_input_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  String? mtoken = '';
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void _submit() {
    /* setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save(); */
  }

  requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    } else {
      print('user declined or has not accepted permission');
    }
  }

  getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print('My token is $mtoken');
      });
      saveToken(mtoken!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("UserToken")
        .doc("User1")
        .set({'token': token});
  }

  initInfo() {
    var androidInitilize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: androidInitilize);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      try {
        if (notificationResponse.notificationResponseType ==
            NotificationResponseType.selectedNotification) {}
      } catch (e) {}
      /* switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          //selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == navigationActionId) {
            //selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      } */
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('***********************************************');
      print('Message data: ${message.data}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContent: true,
      );
      AndroidNotificationDetails androidPlatformSpecifics =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: false,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformSpecifics);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  @override
  void initState() {
    requestPermission();
    getToken();
    initInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
                child: Align(
                  child: Text(
                    'ManTech',
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextInputField(
                labelText: 'Entrez votre Nom',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => {
                  _authData['email'] = value,
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez fournir un email.';
                  }
                  if (!isEmail(value.trim())) {
                    return 'Email  incorrect.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 2.0,
              ),
              PasswordInputField(
                labelText: 'Entrez votre mot de passe',
                onChanged: (value) => {_authData['password'] = value},
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mot de passe requis.';
                  }
                  if (value.trim().length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères.';
                  }
                  return null;
                },
              ),
              Button(
                child: Text('Se Connecter'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
