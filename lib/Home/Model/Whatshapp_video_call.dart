import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppVideoCallButton extends StatelessWidget {
  final String phoneNumber;

  WhatsAppVideoCallButton({required this.phoneNumber});

  void _startWhatsAppVideoCall(BuildContext context) async {
    // Replace the phone number with the country code if needed
    String url = "https://wa.me/$phoneNumber?text=Hello"; // You can add more parameters here
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Could not launch WhatsApp"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _startWhatsAppVideoCall(context),
      child: Icon(Icons.video_call,color: Colors.green,),
    );
  }
}
