import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mercado_youtube/screen/pago_screen.dart';


class ItemScreen extends StatelessWidget {
  static const String routename ='ItemScreen';
  const ItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
  final dio = Dio();
    return Scaffold(
      backgroundColor: const Color(0xfffefdfd),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Zapatillas', style: TextStyle(fontSize: 40),),
              SizedBox(
                child: Image.asset('assets/zapatillas.jpg'),
              ),
              ElevatedButton(
                onPressed: ()async{
                  try {
                    Response<Map> response;
                    response = await dio.post('http://127.0.0.1:3000/create_preferences');
                    var res = response.data;
                    if(context.mounted){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PagoScreen(
                          url: res?["url"],
                        )));
                    }
                  } catch (e) {
                    print(e);  
                  }
                }, 
                child: const Text('Pagar con MercadoPago')
              )
            ],
          ),
             ),
      ),
   );
  }
}