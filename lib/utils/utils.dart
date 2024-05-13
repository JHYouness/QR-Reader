import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

Future<void> launchInBrowser(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  } else {
    final String cordenada = scan.valor;
    final splitted = cordenada.split(',');
    final latidud = double.parse(splitted[0]);
    final longitud = double.parse(splitted[1]);

    MapsLauncher.launchCoordinates(latidud, longitud);
  }
}
