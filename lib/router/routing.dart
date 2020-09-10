import 'package:flutter/material.dart';
import 'package:restapi_practice/screens/products_screen.dart';

// Nos regresa todas las rutas de la app
Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
       
        '/products' : (BuildContext context) => ProductsScreen(),
  };
}