import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTitles extends StatelessWidget {
  
  final String tipo;

  const ScanTitles({required this.tipo}) : super(); 

  @override
  Widget build(BuildContext context) {
    final scanlistProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
      itemCount: scanlistProvider.scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scanlistProvider.scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
            this.tipo == 'http' 
            ? Icons.home_outlined
            : Icons.map_outlined,
             color: Theme.of(context).primaryColor,),
          title: Text(scanlistProvider.scans[i].valor),
          subtitle: Text(scanlistProvider.scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchInBrowser(context,scanlistProvider.scans[i]),
        ),
      ),
    );
  }
}
