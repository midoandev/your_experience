import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class HelperFunction {
  saveDate({
    required DateTime startTime,
    required String location,
  }) async {
    const String title = 'Pernikahan Venty dan Mido';
    const String description =
        'Kami dengan sukacita mengundang Anda untuk menjadi saksi pernikahan kami. Mohon berkenan hadir dan menghiasi acara pernikahan kami dengan kehadiran Anda yang berarti.';
    final formattedStartTime = startTime
        .toUtc()
        .toIso8601String()
        .replaceAll(RegExp(r'[:-]|\.\d{3}'), '');
    final formattedEndTime = startTime
        .add(const Duration(hours: 12))
        .toUtc()
        .toIso8601String()
        .replaceAll(RegExp(r'[:-]|\.\d{3}'), '');

    final linkGoogle = 'https://www.google.com/calendar/render?action=TEMPLATE'
        '&text=${Uri.encodeComponent(title)}'
        '&dates=$formattedStartTime/$formattedEndTime'
        '&details=${Uri.encodeComponent(description)}'
        '&location=${Uri.encodeComponent(location)}';

    // final linkIos = 'x-apple-reminder://:'
    //     'add?title=${Uri.encodeComponent(title)}'
    //     '&startDate=$formattedStartTime'
    //     '&dueDate=$formattedEndTime'
    //     '&notes=${Uri.encodeComponent(description)}'
    //     '&location=${Uri.encodeComponent(location)}';

    // final link = isIos() ? linkIos : linkGoogle;
    // return link;
    // print('askdmsaklmd $linkGoogle');
    if (await canLaunchUrl(Uri.parse(linkGoogle))) {
      await launchUrl(Uri.parse(linkGoogle));
    } else {
      throw 'Could not open the map.';
    }
  }

  isIos() {
    // print('platfrom ${GetPlatform().toString()}');
    if (GetPlatform.isIOS) {
      return true;
    }
    return false;
  }

  openMaps(String googleUrl) async {
    // String googleUrl =
    //     'https://www.google.com/maps/place/Rumah+Vega/@-6.690666,108.5479344,17z/data=!3m1!4b1!4m6!3m5!1s0x2e6ee393372514dd:0x48ff053162ff671!8m2!3d-6.690666!4d108.5479344!16s%2Fg%2F11smnc0v6t?hl=id-ID&entry=ttu';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  static void copyToClipboard(String text) {
    final textarea = html.TextAreaElement();
    html.document.body?.append(textarea);
    textarea.style.position = 'fixed';
    textarea.style.left = '-9999px';
    textarea.value = text;
    textarea.select();
    html.document.execCommand('copy');
    textarea.remove();
  }

  static void showToast(String message) {
    var toast = html.DivElement();
    toast.text = message;
    var sty = toast.style;
    sty.position = 'fixed';
    sty.bottom = '16px';
    sty.left = '50%';
    sty.transform = 'translateX(-50%)';
    sty.padding = '12px 24px';
    sty.backgroundColor = '#333';
    sty.color = '#fff';
    sty.borderRadius = '4px';
    sty.zIndex = '9999';

    html.document.body?.append(toast);

    Future.delayed(const Duration(seconds: 2), () {
      toast.remove();
    });
  }


  static bool browserIsChrome() {
    if (GetPlatform.isIOS) {
      // print('Website dibuka di Safari');
      return false;
      // Tambahkan logika khusus untuk Safari di sini
    } else {
      // print('Website dibuka di browser lain');
      return true;
      // Tambahkan logika untuk browser lain di sini
    }
  }


}
