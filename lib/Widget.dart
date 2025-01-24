// ignore_for_file: file_names

import 'package:flutter/material.dart';

nextScreen(context, pageName) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageName,
      ));
}
