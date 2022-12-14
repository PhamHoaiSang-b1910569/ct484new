import 'dart:io';

import 'package:flutter/material.dart';
import 'package:originner/common/widgets/error.dart';
import 'package:originner/features/auth/screens/login_screen.dart';
import 'package:originner/features/auth/screens/otp_screen.dart';
import 'package:originner/features/auth/screens/user_information_screen.dart';
import 'package:originner/features/landing/screens/landing_screen.dart';
// import 'package:originner/features/group/screens/create_group_screen.dart';
import 'package:originner/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:originner/features/chat/screens/mobile_chat_screen.dart';
import 'package:originner/features/status/screens/confirm_status_screen.dart';
import 'package:originner/features/status/screens/status_screen.dart';
import 'package:originner/models/status_model.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
      case LandingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LandingScreen(),
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
          
        ),
      );
    case ConfirmStatusScreen.routeName:
      final file = settings.arguments as File;
      return MaterialPageRoute(
        builder: (context) => ConfirmStatusScreen(
          file: file,
        ),
      );
    case StatusScreen.routeName:
      final status = settings.arguments as Status;
      return MaterialPageRoute(
        builder: (context) => StatusScreen(
          status: status,
        ),
      );
    
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}