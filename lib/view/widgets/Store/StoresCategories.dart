import 'package:flutter/material.dart';
import 'Custom_ListStoresCategories.dart';

class Storescategories extends StatelessWidget {
  Storescategories(
      {super.key,
      required this.selectedCat2,
      required this.selectedCat,
      required this.index,
      required this.selectedCatsList,
      required this.indexList,
      required this.storeCategories,
      required this.myUpdate});
  int selectedCat2, selectedCat, index;
  final List selectedCatsList, indexList;
  final storeCategories;
  final void Function() myUpdate;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {
            selectedCat2 = index;
            selectedCat = index;
            //  selectedCat = repository
            //     .storeCategories.data![index].id!;

            if (selectedCatsList.contains(storeCategories.data![index].id)) {
              selectedCatsList.remove(storeCategories.data![index].id);
            } else {
              selectedCatsList.add(storeCategories.data![index].id);
            }
            //  getStoresTag();

            if (indexList.contains(index)) {
              indexList.remove(index);
            } else {
              indexList.add(index);
            }
            myUpdate;
            // getStoresById();
            // update();

            //  getStoresById(
            //     "${  storeCategories.data![index].id}");
            //  getStoresById(
            //     "${  storeCategories.data![index].id}");
            // print(repository
            //     .storeCategories.data![index].id);
          },
          child: Container(
            child: CustomListStoresCategories(
              selectedCat: indexList,
              index: index,
              // selectedCat:
              //      selectedCat
            ),
          )),
    );
  }
}
