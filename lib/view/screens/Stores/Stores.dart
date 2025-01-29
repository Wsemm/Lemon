import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../controller/Store_Controller.dart';
import '../../../core/functions/requestStatusControl.dart';
import '../../../routs.dart';
import '../../widgets/Store/StoreSkelton.dart';
import '../../widgets/Store/Custom_ListStoresSkelton.dart';
import '../../widgets/Store/Custom_ListStores.dart';
import '../../widgets/Store/Custom_ListStoresCategories.dart';
import '../../widgets/Store/Custom_StoreAppBar.dart';

class Stores extends StatelessWidget {
  const Stores({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoreController());
    ApiDataRepository repository = Get.find();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: GetBuilder<StoreController>(
        builder: (controller) => Column(
          children: [
            // if (repository.storeCategories.data != null)
            const CustomStoreAppBar(),
            repository.storeCategories.data != null
                ? SizedBox(
                    height: Get.height - 100,
                    child: ListView(
                        controller: controller.scrollController,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: Get.width * 0.010,
                              left: Get.width * 0.010,
                              // bottom: Get.height * 0.010
                            ),
                            height: Get.height * 0.11,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...List.generate(
                                    repository.storeCategories.data!.length,
                                    (index) => Container(
                                          child: InkWell(
                                              onTap: () {
                                                controller.selectedCat2 = index;
                                                controller.selectedCat = index;
                                                // controller.selectedCat = repository
                                                //     .storeCategories.data![index].id!;

                                                if (controller.selectedCatsList
                                                    .contains(repository
                                                        .storeCategories
                                                        .data![index]
                                                        .id)) {
                                                  controller.selectedCatsList
                                                      .remove(repository
                                                          .storeCategories
                                                          .data![index]
                                                          .id);
                                                } else {
                                                  controller.selectedCatsList
                                                      .add(repository
                                                          .storeCategories
                                                          .data![index]
                                                          .id);
                                                }
                                                // controller.getStoresTag();

                                                if (controller.indexList
                                                    .contains(index)) {
                                                  controller.indexList
                                                      .remove(index);
                                                } else {
                                                  controller.indexList
                                                      .add(index);
                                                }
                                                controller.getStoresById();

                                                print(controller.indexList);
                                                print(controller
                                                    .selectedCatsList);
                                                controller.update();

                                                // controller.getStoresById(
                                                //     "${repository.storeCategories.data![index].id}");
                                                // controller.getStoresById(
                                                //     "${repository.storeCategories.data![index].id}");
                                                // print(repository
                                                //     .storeCategories.data![index].id);
                                              },
                                              child: Container(
                                                child:
                                                    CustomListStoresCategories(
                                                  selectedCat:
                                                      controller.indexList,
                                                  index: index,
                                                  // selectedCat:
                                                  //     controller.selectedCat
                                                ),
                                              )),
                                        ))
                              ],
                            ),
                          ),
                          ...List.generate(
                              controller.filter == 0
                                  ? repository.storesModel.length
                                  // : repository.storesModelById[
                                  //             "${repository.storeCategories.data![controller.selectedCat].id}"] !=
                                  //         null
                                  //     ? repository
                                  //         .storesModelById[
                                  //             "${repository.storeCategories.data![controller.selectedCat].id}"]
                                  //         .length
                                  : repository.test2 != null
                                      ? repository.test2.length
                                      : 3,
                              (index) => InkWell(
                                  onTap: () {
                                    // print(
                                    //     "${repository.storesModelById["${repository.storeCategories.data![controller.selectedCat].id}"][0]["id"]}");
                                    if (controller.filter == 1 &&
                                        repository.searchStoreInfoData !=
                                            null) {
                                      repository.searchStoreInfoData.clear();
                                    }
                                    Get.toNamed(AppRout.storeProfile,
                                        arguments: {
                                          "storeId": controller.filter == 1
                                              ? repository.storesModelById[
                                                      "${repository.storeCategories.data![controller.selectedCat].id}"]
                                                  [index]["id"]
                                              : index,
                                          "details": controller.filter == 1
                                              ? "filteredStore"
                                              : "store",
                                          // "data": controller.filter == 0
                                          //     ? "${repository.storesModel}"
                                          //     : "${repository.storesModelById}"
                                        });
                                  },
                                  child: handlingRequestStatus(
                                      customWidget: 1,
                                      secondWidget:
                                          const CustomListStoresSkelton(),
                                      statusRequest: controller.statusRequest2,
                                      widget: Container(
                                        margin: EdgeInsets.only(
                                            top: Get.height * 0.010),
                                        child: CustomListStores(
                                            home: 1,
                                            index: index,
                                            data: controller.filter == 0
                                                ? repository.storesModel
                                                : repository.test2),
                                      ))
                                  // : repository.storesModelById[
                                  //     "${repository.storeCategories.data![controller.selectedCat].id}"])),
                                  )),
                          if (controller.isMoreData == false &&
                              controller.filter == 0)
                            const Center(child: Text("No More Data")),
                          if (controller.isMoreData2 == false &&
                              controller.filter == 1 &&
                              repository.storesModelByIdMoreData[
                                      "${repository.storeCategories.data![controller.selectedCat].id}"] ==
                                  1)
                            const Center(child: Text("No More Data"))
                        ]),
                  )
                : const StoreSkelton()
          ],
        ),
      ),
    );
  }
}
