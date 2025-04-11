import 'package:blood_bank/core/services/api_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'data_base_service.dart';

class FireStoreService extends ApiService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // @override
  // Future<void> addData({
  //   required String path,
  //   required Map<String, dynamic> data,
  //   String? documentId,
  // }) async {
  //   if (documentId != null) {
  //     firestore.collection(path).doc(documentId).set(data);
  //   } else {
  //     await firestore.collection(path).add(data);
  //   }
  // }

  // // @override
  // Future<void> updateData({
  //   required String path,
  //   required String docuementId,
  //   required Map<String, dynamic> data,
  // }) async {
  //   await firestore.collection(path).doc(docuementId).update(data);
  // }

  // // @override
  // Future<dynamic> getData({
  //   required String path,
  //   required String docuementId,
  // }) async {
  //   var data = await firestore.collection(path).doc(docuementId).get();
  //   return data.data();
  // }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    String? id,
  }) async {
    if (id != null) {
      await firestore.collection(path).doc(id).delete();
    }
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
  }) async {
    if (id != null) {
      var data = await firestore.collection(path).doc(id).get();
      return data.data();
    }
    var data = await firestore.collection(path).get();
    return data.docs.map((e) => e.data()).toList();
  }

  @override
  Future patch(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    String? id,
  }) async {
    await firestore.collection(path).doc(id).update(data);
  }

  @override
  Future post(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    String? id,
  }) async {
    if (id != null) {
      firestore.collection(path).doc(id).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }
}
