import 'package:crud_api/RestAPI/RestClient.dart';
import 'package:crud_api/Screen/ProductCreateScreen.dart';
import 'package:crud_api/Screen/ProductUpdateScreen.dart';
import 'package:crud_api/style/style.dart';
import 'package:crud_api/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    isLoading = true;
    var data = await ProductGridViewRequest();
    setState(() {
      ProductList = data;
      isLoading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete ! "),
            content: const Text("Once delete, you can't get it back"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      isLoading = true;
                    });
                    await ProductDeleteRequest(id);
                    await CallData();
                  },
                  child: const Text("Yes")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
            ],
          );
        });
  }

  GotoUpdate(context, productItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ProductUpdateScreen(productItem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: isLoading
                ? (const Center(
                    child: CircularProgressIndicator(),
                  ))
                : RefreshIndicator(
                    onRefresh: () async {
                      await CallData();
                    },
                    child: (GridView.builder(
                      gridDelegate: ProductGridViewStyle(),
                      itemCount: ProductList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  ProductList[index]['Img'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ProductList[index]['ProductName']),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text("Price: " +
                                        ProductList[index]["UnitPrice"] +
                                        " BDT"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {
                                              GotoUpdate(
                                                  context, ProductList[index]['_id']);
                                            },
                                            child: const Icon(
                                              CupertinoIcons
                                                  .ellipsis_vertical_circle,
                                              size: 18,
                                              color: colorGreen,
                                            )),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              DeleteItem(
                                                  ProductList[index]['_id']);
                                            },
                                            child: const Icon(
                                              CupertinoIcons.delete,
                                              size: 18,
                                              color: colorRed,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ProductCreateScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
