import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mercado_youtube/screen/aprobado_screen.dart';
import 'package:mercado_youtube/screen/pendiente_screen.dart';
import 'package:mercado_youtube/screen/rechazado_screen.dart';


class PagoScreen extends StatefulWidget {
  static const String routename ='PagoScreen';
  final String? url;
  const PagoScreen({super.key, this.url});

  @override
  State<PagoScreen> createState() => _PagoScreenState();
}

class _PagoScreenState extends State<PagoScreen> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(url: Uri.parse("${widget.url}")),
              onUpdateVisitedHistory: (controller, url, androidIsReload){
                print(url);
                if (url.toString().contains("https://www.papayasconcrema.cl/success")) {
                  webViewController?.goBack();
                  //You can do anything
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AprobadoScreen()),
                  );
                  //Prevent that url works
                  return;
                } else if (url.toString().contains("https://www.papayasconcrema.cl/failure")) {
                  //You can do anything
                  webViewController?.goBack();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RechazadoScreen()),
                  );
                  //Prevent that url works
                  return;
                } else if (url.toString().contains("https://www.papayasconcrema.cl/pending")) {
                  //You can do anything
                  webViewController?.goBack();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PendienteScreen()),
                  );
                }
              }
            )
          ],
        ),
      )
        
     
   );
  }
}