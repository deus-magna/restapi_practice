import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapi_practice/models/products_models.dart';
import 'package:restapi_practice/states/products_state.dart';
import 'package:restapi_practice/widgets/error_container.dart';
import 'package:restapi_practice/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {

    // Dependiendo del ESTADO de la clase de ProductsChangeNotifier cambiamos el UI
    return Consumer<ProductsChangeNotifier>(
        builder: (context, productsChangeNotifier, _) {
          
      switch (productsChangeNotifier.state) {
        case ProductState.INITIAL:
          return Expanded(child: Center(child: CircularProgressIndicator()));
        case ProductState.LOADING:
          return Expanded(child: Center(child: CircularProgressIndicator()));
        case ProductState.LOADED:
          return _buildOrdersList(productsChangeNotifier.products);
        case ProductState.EMPTY:
          return Center(child: Text('EMPTY'));
        case ProductState.ERROR:
          String image = 'assets/img/illustration_wrong.png';
          switch (productsChangeNotifier.failure.code) {
            case 401:
              image = 'assets/img/illustration_stop.png';
              break;
            case 404:
              image = 'assets/img/illustration_not_found.png';
              break;
            case 500:
              image = 'assets/img/illustration_error.png';
              break;
            default:
          }
          return ErrorContainer(
            context: context,
            img: image,
            title: productsChangeNotifier.failure.prefix,
            message: productsChangeNotifier.failure.message,
            buttonText: 'Inténtalo de nuevo',
            onPressed: () => productsChangeNotifier.getProducts(code: 200),
            heightMultiplier: 0.35,
          );
        default:
          return Expanded(child: Center(child: CircularProgressIndicator()));
      }
    });
  }

  Widget _buildOrdersList(List<Product> products) {
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: products[index]);
          }),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text('Productos'),
      actions: <Widget>[
        _build500ErrorAction(context),
        _build404ErrorAction(context),
        _buildCustomErrorAction(context),
        _build400ErrorAction(context),
      ],
    );
  }

  Widget _build404ErrorAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.cancel),
      onPressed: () =>
          Provider.of<ProductsChangeNotifier>(context, listen: false)
              .getProducts(code: 401),
    );
  }

  Widget _buildCustomErrorAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.error),
      onPressed: () =>
          Provider.of<ProductsChangeNotifier>(context, listen: false)
              .getProducts(code: 404),
    );
  }

  Widget _build400ErrorAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.category),
      onPressed: () =>
          Provider.of<ProductsChangeNotifier>(context, listen: false)
              .getProducts(code: 400),
    );
  }

  Widget _build500ErrorAction(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.report_problem),
      onPressed: () =>
          Provider.of<ProductsChangeNotifier>(context, listen: false)
              .getProducts(code: 500),
    );
  }
}
