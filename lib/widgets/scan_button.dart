import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
            //const barcodeScanRes = 'https://google.com';
            //const barcodeScanRes = 'geo:45.280089, -75.922405';

            if (barcodeScanRes == '-1') {
              return;
            }

            final scanListProvider =
                Provider.of<ScanListProvider>(context, listen: false);
            final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

            launchInBrowser(context, nuevoScan);
          },
          child: const Icon(
            Icons.filter_center_focus,
            color: Colors.white,
          )),
    );
  }
}
