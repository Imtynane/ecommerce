import 'package:ecommerce/core/models/product.dart';
import 'package:ecommerce/core/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> listProduct = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    var data = await ProductService.getAll();
    setState(() {
      listProduct = data.map((data) => Product.fromJson(data)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listProduct.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listProduct[index].title),
            subtitle: Text(listProduct[index].description),
            leading: const CircleAvatar(),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () async {
                    
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    await ProductService.delete(listProduct[index].id);
                    loadData();
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
