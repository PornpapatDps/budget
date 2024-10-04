import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

class DatabaseHelper {
  final CollectionReference collection = 
   FirebaseFirestore.instance.collection(Product.collectionName);

  //insert product
  Future<DocumentReference>insertProduct(Product product)  {
    return collection.add(product.toJson());
  }

  //update product
  void updateProduct(Product product) async {
    await collection.doc(product.referenceId).update(product.toJson());
  }

  //delete product
  void deleteProduct(Product product) async {
    await collection.doc(product.referenceId).delete();
  }

  //get all documents from collection
  Stream<QuerySnapshot>getStream() {
    return collection.snapshots();
  }

  Future<QuerySnapshot> searchProduct(String keyValue) {
    
    return collection.where(Product.colName, isEqualTo: keyValue).get();
  }
}