import 'package:flutter/material.dart';
import 'package:mercado_youtube/screen/aprobado_screen.dart';
import 'package:mercado_youtube/screen/item_screen.dart';
import 'package:mercado_youtube/screen/pago_screen.dart';
import 'package:mercado_youtube/screen/pendiente_screen.dart';
import 'package:mercado_youtube/screen/rechazado_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: ItemScreen.routename,
      debugShowCheckedModeBanner: false,
      routes: {
        ItemScreen.routename        :(context)=> const ItemScreen(),
        PagoScreen.routename        :(context)=> const PagoScreen(),
        AprobadoScreen.routename    :(context)=> const AprobadoScreen(),
        RechazadoScreen.routename   :(context)=> const RechazadoScreen(),
        PendienteScreen.routename   :(context)=> const PendienteScreen(),
      },
    );
  }
}

