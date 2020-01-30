import 'dart:io';
import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreen({Key key}) : super(key: key);

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String _qrCode;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _qrController;

  bool _cameraWasInit = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            body: SafeArea(
          child: Stack(
            children: <Widget>[

              _QRViewWidget(
                onQRViewCreated: _onQRViewCreated,
              ),

              Positioned.fill(
                child: Center(
                  child: SvgPicture.asset("assets/scanner_frame.svg"),
                ),
              ),
              Positioned(
                  top: .0,
                  child: _appBar()),
              Positioned(
                bottom: .0,
                child: BottomNav(
                  selectedPage: 1,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this._qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      _qrCode = scanData;
      print(_qrCode);
    });
  }

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }

  Widget _appBar() {
    return SizedBox(
      width: Dimens.Width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(Tools.queue.removeLast()),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (_qrController != null) {
                _qrController.toggleFlash();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 21.0,
                  left: 21.0,
                  bottom: 7.0),
              child: SvgPicture.asset("assets/ic_flash.svg"),
            ),
          ),
        ],
      ),
    );
  }
}

class _QRViewWidget extends StatefulWidget {

  final Function(QRViewController controller) onQRViewCreated;

  const _QRViewWidget({Key key, this.onQRViewCreated}) : super(key: key);


  createState() => _QrViewState();

}

class _QrViewState extends State<_QRViewWidget> {
  @override
  Widget build(BuildContext context) {
    return QRView(
      key: GlobalKey(),
      onQRViewCreated: widget.onQRViewCreated,
    );
  }
}
