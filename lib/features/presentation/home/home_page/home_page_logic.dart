import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_experience/features/presentation/home/home_logic.dart';

import 'home_page_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();
  final logicMain = Get.find<HomeLogic>();

  @override
  void onReady() {
    var contacts = logicMain.app.getContacts().last;

    state.contact.value = contacts;
    state.contact.refresh();
    super.onReady();
  }

  Future<void> gotoAddress() async {
    final Uri url = Uri.parse(state.contact.value.link);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  downloadCv() async {
    // final pdf = pw.Document()
    ;final img = await rootBundle.load('assets/file/cv_mido.pdf');
    final savedFile = img.buffer.asUint8List();
    List<int> fileInts = List.from(savedFile);
    html.AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
      ..click();
  }


// downloadCv() async {
  //   // Replace "assets/pdfs/nama_file.pdf" with your actual file path
  //   final file = File('assets/file/cv_mido.pdf');
  //   final pdfData = await file.readAsBytes();
  //   return pdfData;
  // }
}
