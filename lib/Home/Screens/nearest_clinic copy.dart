import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/mainDrawer.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class nearme_Doctor extends StatefulWidget {
  const nearme_Doctor({super.key});
  @override
  State<nearme_Doctor> createState() => _nearme_DoctorState();
}

// ignore: camel_case_types
class _nearme_DoctorState extends State<nearme_Doctor> {
  @override
  Widget build(BuildContext context) {
    var clinicname = <String>[
      'Healthcare physiotherapy clinic\n\nDr. Reema Vala (BPT)\nDr. Komal Vala (BPT)',
      'Manav physiotherapy clinic\n\nDr. Ajit Jadkat (BPT)',
      'Swara physiotherapy clinic and fitness center\n\nDr. Falguni labana (BPT)',
      'Ami physiotherapy clinic\n\nDr. Amisha Gariadhar',
      'Rays of hope super-specialty physiotherapy clinic\n\nDr. Jatin Patel (BPT)\nDr. Vishakha Patel ',
      'Aum physiotherapy clinic\n\nDr. Vivek Modi (BPT)',
      'Shishudeep Multispeciality Hospital\n\nDr. Pooja Patel ',
      'Astha Physiotherapy Clinic\n\nDr. Meet bhalara (BPT)',
      'Seecure Physiotherapy Clinic ',
      'Motion Pro Physiotherapy Clinic\n\nDr. Bhavik shah (BPT)',
      'Dr. Forum Shah Physiotherapy Clinic'
    ];

    var address = <String>[
      'Kodinar                                                              ',
      'Kodinar                                                              ',
      'Bapod, Vadodara                                      ',
      'Near SBI ATM, oppo shamla travels, palitana road, Gariadhar.',
      'Panchayat chowk, university road, Rajkot',
      'Gandhigram, Rajkot                                   ',
      'Station Road, Bardoli                                ',
      'Silicon Shoppers, G-67/68/69, Udhana Main Rd, opp Satyanagar, Surat, Gujarat 394210',
      'Heights apartment Plaza, Tithal Road, Valsad',
      'G4/5, Motion Pro physiotherapy Clinic Ambrosia Business Hub, VIP Road, Surat, Gujarat 395007',
      'B/205 Rameshwar Complex, opposite Jaltarang apartment,Valsad- 396001',
    ];

    var number = <num>[
      8849465565,
      9228165553,
      9427464637,
      8320987356,
      8200133691,
      9409655477,
      9925881421,
      9714657000,
      8980241241,
      9726807142,
      9408307360
    ];

    return Scaffold(
      appBar: default_appbar(context, translation(context).clinic_near),
      drawer: const MainDrawer(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
            ),
            title: Text(
              clinicname[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            subtitle: Wrap(
              alignment: WrapAlignment.start,
              
              
              children: [
                
                Text(address[index],
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start),
              ],
            ),
            trailing: IconButton(
                  onPressed: () => _makePhoneCall(context, number[index]),
                  icon: Icon(Icons.call),
                ),
          );
        },
        itemCount: clinicname.length,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 20,
            thickness: 1.5,
          );
        },
        padding: const EdgeInsets.only(bottom: 40),
      ),
    );
  }

  void _makePhoneCall(BuildContext context, phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      _displayErrorMotionToast(
          context, "Error", "Could not launch $phoneNumber");
    }
  }

  void _displayErrorMotionToast(
      BuildContext context, String title, String description) {
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
