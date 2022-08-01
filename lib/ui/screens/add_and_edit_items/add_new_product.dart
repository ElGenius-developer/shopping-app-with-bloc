import 'package:bag_app/data/constants/static_data.dart';
import 'package:bag_app/data/models/products.dart';
import 'package:bag_app/data/repository/products_repository.dart';
import 'package:bag_app/logic/blocs/products_bloc/products_bloc.dart';
import 'package:bag_app/logic/cubits/thems/them_cubit.dart';
import 'package:bag_app/ui/adaptive_ui_component/responsive_widget/responsive_widget.dart';
import 'package:bag_app/ui/screens/add_and_edit_items/scroll_row_text_field_for_add.dart';
 import 'package:bag_app/ui/widgets/custom_text.dart';
import 'package:bag_app/ui/widgets/custom_text_field.dart';
import 'package:bag_app/ui/widgets/my_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatelessWidget {
  final product = Products();
  final repository = ProductsRepository();
  final List<TextEditingController> controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  static String? categoryDropdownValue = 'electronics';
  static String? typeDropdownValue;
  final Products? editedProduct;

  AddNewProduct({Key? key, this.editedProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    typeDropdownValue = StaticData()
        .typesList[StaticData().categoriesList.indexOf(categoryDropdownValue!)]
        .first;
    if (editedProduct != null) {
      controllers[0].text = editedProduct!.title!;
      controllers[1].text = editedProduct!.id.toString();
      controllers[2].text = editedProduct!.image!;
      controllers[3].text = editedProduct!.price!;
      controllers[4].text = editedProduct!.oldPrice!;
      controllers[5].text = editedProduct!.rate.toString();
      controllers[6].text = editedProduct!.color!;
      controllers[7].text = editedProduct!.size!;
      controllers[8].text = editedProduct!.description!;
      categoryDropdownValue = editedProduct!.category;
      typeDropdownValue = editedProduct!.type;
    }

    return Scaffold(
      appBar: MyCustomAppBar(
        title: (editedProduct == null) ? 'Add new ' : 'Edit product',
        actions: [],
        showDrawer: false,
        textColor: Colors.black,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      //// #Body
      body: ResponsiveWidget(
        builder: (context, deviceInfo)
        {

              return    SingleChildScrollView(
                child: Container(
                    width: deviceInfo.screenWidth! *.4,
                    height: deviceInfo.screenHeight ,
                    padding: EdgeInsets.symmetric(
                      horizontal:deviceInfo.localWidth!/22,

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //**********************
                        //Drop Down buttons    *
                        //**********************

                      Container(
                       width: deviceInfo.localWidth,
                      height: deviceInfo.localHeight! / 15,
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton<String>(
                                value: categoryDropdownValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    categoryDropdownValue = newValue;
                                    typeDropdownValue = StaticData()
                                        .typesList[StaticData()
                                        .categoriesList
                                        .indexOf(categoryDropdownValue!)]
                                        .first;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.arrow_down,
                                  size: deviceInfo.localWidth!/67,
                                  color: Colors.red.shade700,
                                ),
                                items: StaticData()
                                    .categoriesList
                                    .map((categoriesListItem) =>
                                    DropdownMenuItem<String>(
                                      child: CustomText(
                                        text: categoriesListItem,
                                        color: Colors.red.shade700,
                                      ),
                                      value: categoriesListItem,
                                    ))
                                    .toList(),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 15,
                              ),
                              DropdownButton<String>(
                                value: typeDropdownValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    typeDropdownValue = newValue;
                                    print("$categoryDropdownValue");
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.arrow_down,
                                  color: Colors.red.shade700,
                                  size: deviceInfo.localWidth!/67,

                                ),
                                items: StaticData()
                                    .typesList[StaticData()
                                    .categoriesList
                                    .indexOf(categoryDropdownValue!)]
                                    .map<DropdownMenuItem<String>>(
                                        (categoriesListItem) =>
                                        DropdownMenuItem<String>(
                                          child: CustomText(
                                              text: categoriesListItem,
                                              color: Colors.red.shade700),
                                          value: categoriesListItem,
                                        ))
                                    .toList(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                        //**********************
                        //title and id     *
                        //**********************
                        ScrollRowTextFieldForAdd(
                          'Title',
                          'ID',
                          controllers[0],
                          controllers[1],
                          2,
                          deviceInfo: deviceInfo,
                        ),
                        //**********************
                        //image url    *
                        //**********************
                        CustomTextField(
                          type: 'Image URL',
                          color: Colors.pink,
                          width: deviceInfo.localWidth  ,
                          controller: controllers[2],
                        ),
                        //**********************
                        //prices and rate    *
                        //**********************
                        ScrollRowTextFieldForAdd(
                          'Price',
                          'Old Price',
                          controllers[3],
                          controllers[4],
                          3,
                          type3: 'Rate',
                          controller3: controllers[5],
                          deviceInfo: deviceInfo,
                        ),
                        //**********************
                        //Color and size    *
                        //**********************
                        ScrollRowTextFieldForAdd(
                          'Color',
                          'Size',
                          controllers[6],
                          controllers[7],
                          2,
                          deviceInfo: deviceInfo,
                        ),
                        //**********************
                        //Description    *
                        //**********************
                        CustomTextField(
                          type: 'Description',
                          color: Colors.pink,
                          controller: controllers[8],
                          width: deviceInfo.localWidth  ,
                          height: deviceInfo.localHeight! / 6,
                          maxLines: 15,
                        ),
                        Container(
                          margin: EdgeInsets.all(deviceInfo.localWidth!*.01),
                          height: deviceInfo.localHeight!*.08,
                          width: deviceInfo.localWidth!*.55,
                          child: CupertinoButton(
                            color: ThemeCubit().alternativeColor,
                            child: CustomText(
                              fontSize: deviceInfo.localHeight!/50,
                              text: (editedProduct == null)
                                  ? 'Add Product'
                                  : 'Edit product',
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              product.title = controllers[0].text.trim();
                              product.id = int.parse(controllers[1].text.trim());
                              product.image = controllers[2].text.trim();
                              product.price = controllers[3].text.trim();
                              product.oldPrice = controllers[4].text.trim();
                              product.rate = double.parse(
                                controllers[5].text.trim(),
                              );
                              product.color = editedProduct == null
                                  ? '0xff' + controllers[6].text.trim()
                                  : controllers[6].text.trim();
                              product.size = controllers[7].text.isNotEmpty
                                  ? controllers[7].text.trim()
                                  : null;
                              product.description = controllers[8].text.trim();
                              product.category = categoryDropdownValue!.trim();
                              product.type = typeDropdownValue!.trim();
                              if (editedProduct == null)
                                await repository.addProductToFirebase(product);
                              else {
                                await repository.editProduct(editedProduct!.id,
                                    editedProduct!.category!, product);


                                 context.read<ProductsBloc>()..add(FetchProductsByCategory(categoryDropdownValue),)..add(FetchProductsByType(typeDropdownValue));
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                              controllers.forEach((controller) {
                                controller.clear();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              );
              }),
    );
  }
}
