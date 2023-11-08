import 'package:crud_api/RestAPI/RestClient.dart';
import 'package:crud_api/style/style.dart';
import 'package:crud_api/utility/utility.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool loading = false;

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['Img']!.isEmpty) {
      ErrorToast("Img Url Required!");
    } else if (FormValues['ProductCode']!.isEmpty) {
      ErrorToast("Product Code Required!");
    } else if (FormValues['ProductName']!.isEmpty) {
      ErrorToast("Product Name Required!");
    } else if (FormValues['Qty']!.isEmpty) {
      ErrorToast("Product Quantity Required!");
    } else if (FormValues['TotalPrice']!.isEmpty) {
      ErrorToast("Product Total Price Required!");
    } else if (FormValues['UnitPrice']!.isEmpty) {
      ErrorToast("Product Unit Price Required!");
    } else {
      setState(() {
        loading = true;
      });
      await ProductCreateRequest(FormValues);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child:loading?(const Center(child: CircularProgressIndicator(),)) : (SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange("ProductName", TextValue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (TextValue) {
                      InputOnChange("ProductCode", TextValue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (ImgUrl) {
                      InputOnChange("Img", ImgUrl);
                    },
                    decoration: AppInputDecoration('Product Image Url'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (Price) {
                      InputOnChange("UnitPrice", Price);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                      value: FormValues['Qty'],
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text('Select Qty'),
                        ),
                        DropdownMenuItem(
                          value: '1 pcs',
                          child: Text('1 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '2 pcs',
                          child: Text('2 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '3 pcs',
                          child: Text('3 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '4 pcs',
                          child: Text('4 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '5 pcs',
                          child: Text('5 pcs'),
                        ),
                      ],
                      onChanged: (value) {
                        InputOnChange("Qty", value);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (TotalPrice) {
                      InputOnChange("TotalPrice", TotalPrice);
                    },
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Submit"),
                    ),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
