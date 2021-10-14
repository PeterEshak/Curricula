import 'package:curricula_apple/widgets/main_drawer.dart';

import '../shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/curricula_products.dart';
import 'add_products_screen.dart';

class ProductMain extends StatelessWidget {
  const ProductMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> curriculaList =
        Provider.of<Products>(context, listen: true).curriculaList;

    Widget buildText(title, desc, double price) {
      var description =
          desc.length >= 20 ? desc.replaceRange(20, desc.length, '...') : desc;
      return Positioned(
        bottom: 10,
        right: 10,
        child: Container(
          width: 180,
          color: Colors.black54,
          margin: const EdgeInsets.only(left: 100, top: 20),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            '$title\n$description\n\$$price',
            style: const TextStyle(fontSize: 26, color: Colors.white),
            softWrap: true,
            overflow: TextOverflow.fade,
            maxLines: 4,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Curricula'),
        centerTitle: true,
      ),
      body: curriculaList.isEmpty
          ? const Center(
              child:
                  Text('No Curricula Added.', style: TextStyle(fontSize: 22)))
          : GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 500,
                childAspectRatio: 2,
              ),
              children: curriculaList
                  .map(
                    (item) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 6,
                      margin: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.file(item.image, fit: BoxFit.cover),
                          ),
                          buildText(item.title, item.description, item.price),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: FloatingActionButton(
                              heroTag: item.description,
                              backgroundColor: Theme.of(context).primaryColor,
                              onPressed: () =>
                                  Provider.of<Products>(context, listen: false)
                                      .delete(item.description),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
      floatingActionButton: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).primaryColor,
        ),
        child: TextButton.icon(
            label: const Text(
              'Add Curricula',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            icon: const Icon(Icons.add),
            onPressed: () => navigateAndFinish(context, const AddProduct())),
      ),
      drawer: const MainDrawer(),
    );
  }
}
