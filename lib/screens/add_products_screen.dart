import 'dart:io';
import '../shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import 'product_main_screen.dart';
import '../widgets/curricula_products.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var priceController = TextEditingController();

  Builder buildDialogItem(
    BuildContext context,
    String text,
    IconData icon,
    ImageSource src,
  ) =>
      Builder(
        builder: (innerContext) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(text),
            onTap: () {
              context.read<Products>().getImage(src);
              navigatePop(context);
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    File _image = Provider.of<Products>(context, listen: true).image;

    return WillPopScope(
      // onWillPop: () => Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (_) => ProductMain())),
      onWillPop: () =>
          navigateAndFinish(context, const ProductMain()) as Future<bool>,
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (_) => )) as Future<bool>,
      // onWillPop: () {
      //   Future<bool> hi = true as Future<bool>;
      //   return hi;
      // },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const ProductMain())),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'اسم الكتاب',
                  hintText: 'أضف اسم الكتاب',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'المرحله التعليميه',
                  hintText: 'اضف المرحله التعليميه',
                ),
                controller: descController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: 'Add Price',
                ),
                controller: priceController,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // color: Theme.of(context).primaryColor,
                  // textColor: Colors.white,
                  child: const Text('Choose Image'),
                  onPressed: () async {
                    var ad = AlertDialog(
                      title: const Text('Choose Picture from:'),
                      content: SizedBox(
                        height: 150,
                        child: Column(
                          children: [
                            const Divider(color: Colors.black),
                            buildDialogItem(context, 'Camera',
                                Icons.add_a_photo_outlined, ImageSource.camera),
                            const SizedBox(height: 10),
                            buildDialogItem(context, 'Gallery',
                                Icons.image_outlined, ImageSource.gallery),
                          ],
                        ),
                      ),
                    );
                    showDialog(builder: (context) => ad, context: context);
                  },
                ),
              ),
/*
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("Choose PDF"),
                  onPressed: () {
                    List<File> files = await FilePicker.getMultiFile(
                      type: FileType.image,
                    );
                    var ad = AlertDialog(
                      title: Text("Choose PDF from:"),
                      content: Container(
                        height: 150,
                        child: Column(
                          children: [
                            Divider(color: Colors.black),
                            buildDialogItem(context, "Camera", Icons.add_a_photo_outlined, ImageSource.camera),
                            SizedBox(height: 10),
                            buildDialogItem(context, "Gallery", Icons.image_outlined, ImageSource.gallery),
                          ],
                        ),
                      ),
                    );
                    showDialog(builder: (context) => ad, context: context);
                  },
                ),
              ),
*/
              const SizedBox(height: 30),
              Consumer<Products>(
                builder: (ctx, value, _) => ElevatedButton(
                  // color: Colors.orangeAccent,
                  // textColor: Colors.black,
                  child: const Text('Add Curricula'),
                  onPressed: () async {
                    if (titleController.text.isEmpty ||
                        descController.text.isEmpty ||
                        priceController.text.isEmpty) {
                      showToast(
                          text: 'Please enter all Fields',
                          state: ToastStates.wARNING);
                      // Fluttertoast.showToast(
                      //     msg: 'Please enter all Fields',
                      //     toastLength: Toast.LENGTH_LONG);
                    } else if (_image.isAbsolute) {
                      showToast(
                          text: 'Please select an image',
                          state: ToastStates.wARNING);
                      // Fluttertoast.showToast(
                      //     msg: 'Please select an image',
                      //     toastLength: Toast.LENGTH_LONG);
                    } else {
                      try {
                        value.add(
                          title: titleController.text,
                          description: descController.text,
                          price: double.parse(priceController.text),
                        );
                        value.deleteImage();
                        navigateAndFinish(context, const ProductMain());
                        // await Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const ProductMain()));
                      } catch (e) {
                        showToast(
                            text: 'Please enter a valid price\n $e',
                            state: ToastStates.wARNING);
                        // Fluttertoast.showToast(
                        //     msg: 'Please enter a valid price\n $e',
                        //     toastLength: Toast.LENGTH_LONG);
                        print(e);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
