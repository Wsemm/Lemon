import 'package:get/get.dart';
import '../model/login_model.dart';
import '../model/my_cart_model.dart';
import '../model/products_model.dart';
import '../model/profile_model.dart';
import '../model/sign_up_model.dart';
import '../model/store_Categories_model.dart';
import '../model/store_info_model.dart';
import '../model/stores_model.dart';

class ApiDataRepository extends GetxController {
  late LoginModel loginData = LoginModel();
  late SignUpModel signUpData = SignUpModel();
  late ProfileModel profileModel = ProfileModel();
  late StoreInfoModel storeInfoModel = StoreInfoModel();
  late StoreCategories_model storeCategories = StoreCategories_model();
  MyCartModel myCart = MyCartModel();

  int page = 1, pageById = 1, filter = 0;

  // late ProductsModel productsModel = ProductsModel();
  var searchStoreInfoData;
  var test, sections, test2;
  List productsModel = [],
      storesModel = [],
      storeProducts = [],
      productSearchData = [],
      prodcutDetails = [],
      addressList = [],
      storeProductSearchData = [];

// save all the data of the stores where beaning filtered by id example {"store id =11" : data}
  Map<String, dynamic> storesModelById = {},
      // save numper of the cuurent page sended by request for pagenation example {"store id": "1"} so this store current page is 1
      storesModelByIdPages = {},
      // saves if the current store have more data or not example {"store id 11":"1"} so the store have no more data
      storesModelByIdMoreData = {};

  // Uint8List? imageData;

  saveData(Type type, dynamic value) {
    switch (type) {
      case SignUpModel:
        signUpData = value;
        break;
      case LoginModel:
        loginData = value;
        break;
      case ProfileModel:
        profileModel = value;
        update();
        break;
      case ProductsModel:
        productsModel = value;
        break;
      case StoresModel:
        storesModel.addAll(value);

        break;
      case StoreInfoModel:
        storeInfoModel = value;

        break;
      case String:
        storeProducts = value["data"]["products"];
        break;
      case int:
        productSearchData = value;
        break;
      case StoreCategories_model:
        storeCategories = value;
        break;
      case bool:
        storeProductSearchData = value;
        break;
      default:

        // Handle unsupported types if necessary

        break;
    }

    @override
    void onInit() {
      loginData = LoginModel();
      signUpData = SignUpModel();
      profileModel = ProfileModel();
      storeInfoModel = StoreInfoModel();
      storeCategories = StoreCategories_model();

      // productsModel = ProductsModel();
      super.onInit();
    }
  }
}
