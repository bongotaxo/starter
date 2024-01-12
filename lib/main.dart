import 'dart:async';
import 'package:dart_appwrite/dart_appwrite.dart';

// This is your Appwrite function
// It's executed each time we get a request
Future<dynamic> main(final context) async {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('bongotakso')
      .setKey(
          '1c822e7306250836f8cc5e7a533d68afeaeb50807e01f2e21abc9c70d03c3306027c7382bfc0716e9de4e1168f54a9bcfaf9a213c644ec4227ef7113275272a3ede51c1508459c24ba0939e23bed35a93447a8155c927851e22ab5b819dd9e886bca52b17848c8c59d80ed86958358858fd8986b6cec8d04fede28c0c4ce3fdd');

  // You can log messages to the console
  context.log('Hello, Logs HIIIIIII-222!');

  final req = await context.req.body;



  // If something goes wrong, log an error
  context.error('Hello, Errors!');

  // The `req` object contains the request data
  if (context.req.method == 'GET') {
    // Send a response with the res object helpers
    // `res.send()` dispatches a string back to the client
    return context.res.send('Hello, World! АААГГГССы');
  }

  // `res.json()` is a handy helper for sending JSON
  return context.res.json({
    'context.req': req,
  });
}
