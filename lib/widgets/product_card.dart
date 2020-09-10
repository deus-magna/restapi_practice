import 'package:flutter/material.dart';
import 'package:restapi_practice/framework/colors.dart';
import 'package:restapi_practice/models/products_models.dart';
import 'package:restapi_practice/widgets/rounded_card.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({@required this.product});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: product.available ? 1.0 : 0.3,
      child: RoundedCard(
        onPressed: () => onPressed(product),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _CardImage(product),
              Expanded(child: _cardDescription(context, product)),
              _addToCart(),
            ],
          ),
        ),
      ),
    );
  }

  onPressed(Product product) {
    print("Seleccionaste el producto: ${product.title}");
  }

  Widget _cardDescription(BuildContext context, Product product) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Q ${product.price}',
              style: TextStyle(fontWeight: FontWeight.bold, color: primary)),
          SizedBox(height: 5.0),
          Text('${product.title}',
              style: TextStyle(fontSize: 18, color: Colors.black), maxLines: 3),
          SizedBox(height: 5.0),
          Text(product.category.desc,
              style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  Widget _addToCart() {
    return IconButton(
        constraints: BoxConstraints(maxWidth: 28),
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () => print('add to cart'));
  }
}

class _CardImage extends StatelessWidget {
  final Product product;

  const _CardImage(this.product);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.width * 0.33,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/img/giphy.gif'),
              image: product.img != null
                  ? NetworkImage(product.img)
                  : AssetImage('assets/img/no-image.png'),
            ),
          ),
        ),
      ),
    );
  }
}
