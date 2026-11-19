import 'package:flutter/material.dart';
import 'package:minha_loja/components/app_drawer.dart';
import 'package:minha_loja/components/product_item.dart';

import 'package:minha_loja/models/product_list.dart';
import 'package:minha_loja/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.productForm);
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => Column(
            children: [ProductItem(products.items[i]), const Divider()],
          ),
        ),
      ),
    );
  }
}
