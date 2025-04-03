import 'package:flutter/material.dart';
import 'package:medsega/components/constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../Group/helper/helper_function.dart';

class VideoChatting extends StatelessWidget {
  const VideoChatting({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    // Initialize DataController to fetch user information
    final dataController = DataController();

    return FutureBuilder(
      future: dataController.getUserProfileData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // You can show a loading indicator here while fetching user data.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors here
          return Text('Error: ${snapshot.error}');
        } else {
          // Once user data is fetched, use it in the ZegoUIKitPrebuiltCall widget.
          return ZegoUIKitPrebuiltCall(
              appID: Myconst.appId,
              appSign: Myconst.appSign,
              userID: 'test',
              userName: 'test',
              callID: callID,
              config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                ..onOnlySelfInRoom = (context) => Navigator.of(context).pop());
        }
      },
    );
  }
}
