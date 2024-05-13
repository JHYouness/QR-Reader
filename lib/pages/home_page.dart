import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import '../providers/scan_list_provider.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Historial',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () => {
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos()
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu option
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOption;

    // TODO: Temporal leer la base de datos
    final tempScan = ScanModel(valor: 'http://Youness.com');
    //DBProvider.db.updateScan(tempScan);
    // DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.deleteScan(1);
    //DBProvider.db.deleteAllScans();
    // DBProvider.db.getTodosLosScans().then(print);

    // Usar el SanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
