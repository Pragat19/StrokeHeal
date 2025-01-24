// ignore_for_file: unused_local_variable, unnecessary_string_interpolations, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../Classes/Language.dart';
import '../Classes/language_constants.dart';
import '../main.dart';

// Default Appbar for all Screens
AppBar default_appbar(context, text) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  return AppBar(
    title: Text(text),
    toolbarHeight: 70,
    backgroundColor: Theme.of(context).primaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(fontSize: 22, color: Colors.white),
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(right: width * 0.03),
        child: DropdownButton<Language>(
          underline: const SizedBox(),
          icon: const Icon(
            Icons.g_translate,
            color: Colors.white,
            size: 25,
          ),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        e.name,
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );
}

// Information Page Contant Widgets
Text titleTextStyle(text) {
  return Text("$text",
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 26,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ));
}

Text sub_titleTextStyle(text) {
  return Text("$text",
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ));
}

Text infoTextStyle(text) {
  return Text("$text",
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ));
}

// Self Evaluation Page Widgets.

// Input Field for Name, Address ......
TextFormField inputField(context, controller, keyboardType, String hintText,
    String labelText, String ValidatorMessage) {
  return TextFormField(
    controller: controller,
    enableSuggestions: true,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: "$hintText",
      labelText: "$labelText",
      labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red)),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "$ValidatorMessage";
      }
      return null;
    },
  );
}

// rehabitation Page

Text rehabi_sub_titleTextStyle(text) {
  return Text("$text",
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 23,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ));
}

Padding numbered_TextItem(int number, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 9,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    ),
  );
}
