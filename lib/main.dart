import 'dart:async';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/dart_appwrite.dart' as ap;

import 'order_model.dart';


Future<dynamic> main(final context) async {

  const parkId = '1704454476566';

  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('bongotakso')
      .setKey(
          '1c822e7306250836f8cc5e7a533d68afeaeb50807e01f2e21abc9c70d03c3306027c7382bfc0716e9de4e1168f54a9bcfaf9a213c644ec4227ef7113275272a3ede51c1508459c24ba0939e23bed35a93447a8155c927851e22ab5b819dd9e886bca52b17848c8c59d80ed86958358858fd8986b6cec8d04fede28c0c4ce3fdd');
  Databases? db = Databases(client);


  final req = await context.req.body;
  final String phone = context.req.body.toString().split('-').first;
  final String dispId = context.req.body.toString().split('-').last;

  final id = DateTime.now().millisecondsSinceEpoch;

  var businessClient = '';
  var clientId = '';
  var clientName = '';
  var businessClientIdd = '';
  num posadkaDisp = 0.0;
  num eachKmDisp = 0.0;
  num eachMinuteDisp = 0.0;


  final clients = await db.listDocuments(
    databaseId: 'bongoDb',
    collectionId: 'clients',
    queries: [
      ap.Query.equal('phone', phone),
    ],
  ).catchError((e) {
    print(e);
  });
  if (clients.documents.isNotEmpty &&
      clients.documents[0].data['businessClient'] != '') {
    businessClient = clients.documents[0].data['businessClient'] as String;
    clientId = clients.documents[0].data['id'] as String;

    if (businessClient.isNotEmpty) {
      final businessClientDocument = await db
          .getDocument(
        databaseId: 'bongoDb',
        collectionId: 'businessClients',
        documentId: businessClient,
      )
          .catchError((e) {
        print(e);
      });

      clientName = clients.documents[0].data['name'] as String;
      posadkaDisp = businessClientDocument.data['posadkaDisp'] as num;
      eachKmDisp = businessClientDocument.data['eachKmDisp'] as num;
      eachMinuteDisp = businessClientDocument.data['eachMinuteDisp'] as num;
      businessClientIdd = businessClientDocument.data['id'] as String;
    }
  } else {
    final park = await db
        .getDocument(
      databaseId: 'bongoDb',
      collectionId: 'parks',
      documentId: parkId,
    )
        .catchError((e) {
      print(e);
    });
    posadkaDisp = park.data['posadkaDisp'] as num;
    eachKmDisp = park.data['eachKmDisp'] as num;
    eachMinuteDisp = park.data['eachMinuteDisp'] as num;
    clientId = phone;
    clientName = phone;
  }

  final orderModel = OrderModel(
    id: id.toString(),
    createDate: id,
    status: 'new',
    dispId: dispId,
    clientSours: 'call',
    businessClient: businessClientIdd,
    clientPhoneNumber: phone,
    startFare: posadkaDisp,
    kmFare: eachKmDisp,
    timeFare: eachMinuteDisp,
    clientId: clientId,
    parkId: parkId,
    clientName: clientName,
  );

  await db
      .createDocument(
    databaseId: 'bongoDb',
    collectionId: 'orders',
    documentId: id.toString(),
    data: orderModel.toFirestore(id.toString()),
  )
      .catchError((e) {
    print(e);
  });




  context.error('SERVER add order, Errors!');
  return context.res.json({
    'status': 'success',
  });
}
