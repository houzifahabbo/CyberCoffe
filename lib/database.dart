import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/view/order_select/order_select_view_model/product_model.dart';

class DataBaseService{

  final CollectionReference productCollection = FirebaseFirestore.instance.collection('products');
  final CollectionReference userInfoCollection = FirebaseFirestore.instance.collection('uInfo');
  final String? uid;
  DataBaseService({this.uid});

  Future updateProductData(String pName, String pPrice, String pImage , String pSize ,String pDescription) async {
    return await productCollection.doc().set({
      'pName': pName,
      'pPrice':pPrice,
      'pImage':pImage,
      'pSize':pSize,
      'pDescription':pDescription,
    });
  }

  Future updateUserData(String uFName, String uLName, String uBalance, String uPhoneNum ) async {
    return await userInfoCollection.doc(uid).set({
      'uFName': uFName,
      'uLName': uLName,
      'uBalance':uBalance,
      'uPhoneNum':uPhoneNum,
    });
  }

  Stream<List<ProductModel>> get products {
    return productCollection.snapshots().map(_productList);
  }

  List<ProductModel> _productList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return ProductModel(
        name: doc['pName']?? '',
        price: doc["pPrice"]?? '',
        image: doc["pImage"]?? '',
        size:doc["pSize"]?? '',
        description: doc["pDescription"]?? '',
      );
    }).toList();
  }

  Stream<QuerySnapshot> get userInfo {
    return userInfoCollection.snapshots();
  }
}