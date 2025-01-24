import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class CallAndCopyButton extends StatelessWidget {
  final String phoneNumber;

  CallAndCopyButton({required this.phoneNumber});


  
  
  void _makePhoneCall(BuildContext context) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      _displayErrorMotionToast(context, "Error", "Could not launch $phoneNumber");
    }
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: phoneNumber));
    _displaySuccessMotionToast(context, "Number Copied", phoneNumber);
  }

  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _makePhoneCall(context),
          child: Icon(Icons.call),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _copyToClipboard(context),
          child: Text('Copy Number'),
        ),
      ],
    );
  }
  
  void _displaySuccessMotionToast(BuildContext context, String title, String description) {
    MotionToast.success(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(description),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }
  void _displayErrorMotionToast(BuildContext context, String title, String description) {
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(description),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }
}
