import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications(){

    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('==== FCM Token ====');
      print(token);
      // febkQ4ZO9BQ:APA91bG7o2gIe8Cz8Ozair76X-rw9M-6dVznLcfkmlQJtSNC-cm0VVX_BjSHZVi7VeZRtw95PJnfoKEKgIm2GZ1PDa5IZ1rr_ItABA0AmD0ldCd_5n-Z1HPMYnuuVB_H7nBHsCL2S6-s
    });


    _firebaseMessaging.configure(

      onMessage: (info){
        print('=== OnMessage ===');
        print(info);
      },

      onLaunch: (info){
        print('=== OnLaunch ===');
        print(info);
      },

      onResume: (info){
        print('=== OnResume ===');
        print(info);

        //final noti = info['data']['comida'];
        //print(noti);
      }

    );

  }

}