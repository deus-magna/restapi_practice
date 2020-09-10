import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapi_practice/framework/colors.dart';
import 'package:restapi_practice/router/routing.dart';
import 'package:restapi_practice/states/products_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ProductsChangeNotifier()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/products',
        routes: getApplicationRoutes(),
        theme: ThemeData(
          accentColor: primary,
          primaryColor: primary,
          cursorColor: primary,
        ),
      ),
    );
  }
}
