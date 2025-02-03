import 'package:flutter/material.dart';
import 'package:maison_moel/components/DialogQRCode.dart';
import 'package:maison_moel/data/services/Api.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key, required this.title, required this.token});
  final String title;
  final String token;

  @override
  State<Scanner> createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
  final controller = PageController(initialPage: 1);
  Barcode? _barcode;
  bool _canScan = true;
  final MobileScannerController _mobileScannerController = MobileScannerController(facing: CameraFacing.back);
  bool _isTorchOn = false;


  void formReservation(BuildContext context, String token) {
    TextEditingController textUuid = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF323232),
            title: const Text(
              'Réservation',
              style: TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 20,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textUuid,
                  style: const TextStyle(
                    color: Color(0xFFFFEB99),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'ID de réservation',
                    hintStyle: TextStyle(
                      color: Color(0xFFFFEB99),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFEB99),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFEB99),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      print(textUuid.text);
                      API.verificationQRCode(textUuid.text, token).then((response) {
                        Navigator.pop(context);
                        afficheDialogQRCode(context, response, '', '', textUuid.text, () {
                          setState(() {
                            _canScan = true;
                          });
                        });
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF292929)),
                      side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
                    ),
                    child: const Text(
                      'Confirmer',
                      style: TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF292929)),
                      side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
                    ),
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }

  void _detectQRCode(BarcodeCapture barcodes) {
    if (_canScan && mounted) {
      setState(() {
        _canScan = false;
        _barcode = barcodes.barcodes.firstOrNull;
      });

      if (_barcode != null && _barcode!.rawValue != null) {
        String nom = _barcode!.rawValue!.split(';')[0];
        String date = _barcode!.rawValue!.split(';')[1];
        String id = _barcode!.rawValue!.split(';')[2];

        API.verificationQRCode(id, widget.token).then((response) {
          afficheDialogQRCode(context, response, nom, date, id, () {
            setState(() {
              _canScan = true;
            });
          });
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323232),
      body:Stack(
        children: [
          MobileScanner(
            controller: _mobileScannerController,
            onDetect: _detectQRCode,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 30), // Ajoute une marge de 8 pixels autour
              child: Text('Présenter le QR Code', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
              child: IconButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(10),
                  shadowColor: WidgetStateProperty.all<Color>(Colors.black38),
                  backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF292929)),
                  side: WidgetStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
                ),
                icon: const Icon(Icons.arrow_back, color: Color(0xFFFFEB99)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
              child: IconButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(10),
                  shadowColor: WidgetStateProperty.all<Color>(Colors.black38),
                  backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF292929)),
                  side: WidgetStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
                ),
                icon: const Icon(Icons.autorenew, color: Color(0xFFFFEB99)),
                onPressed: () {
                  setState(() {
                    _mobileScannerController.switchCamera();
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 30),
              child: IconButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(10),
                  shadowColor: WidgetStateProperty.all<Color>(Colors.black38),
                  backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF292929)),
                  side: WidgetStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
                ),
                icon: Icon(
                  _isTorchOn ? Icons.lightbulb : Icons.lightbulb_outline,
                  color: const Color(0xFFFFEB99),
                ),
                onPressed: () {
                  setState(() {
                    _isTorchOn = !_isTorchOn;
                    _mobileScannerController.toggleTorch();
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 30),
              child: IconButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(10),
                  shadowColor: WidgetStateProperty.all<Color>(Colors.black38),
                  backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF292929)),
                  side: WidgetStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
                ),
                icon: const Icon(Icons.space_bar, color: Color(0xFFFFEB99)),
                onPressed: () {
                  formReservation(context, widget.token);
                },
              ),
            ),
          ),
          if (!_canScan)
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.black45,
                child: const Center(
                  child: Text(
                    'Scan en cours...',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

