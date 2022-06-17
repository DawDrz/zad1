import 'dart:io';

import 'package:dio/dio.dart' show Dio;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final _router = Router()..get('/', _rootHandler);

final _dio = Dio();

Future<Response> _rootHandler(Request req) async {
  final connectionInfo =
      req.context['shelf.io.connection_info'] as HttpConnectionInfo;
  final ip = connectionInfo.remoteAddress.address;
  final response = await _dio.get("http://ipwho.is/$ip");
  final success = response.data["success"];
  if (!success) return Response.ok("$ip Adres prywatny!");
  final date = response.data['timezone']['current_time'];
  return Response.ok("$ip $date");
}

void main() async {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_router, ip, port);
  DateTime now = new DateTime.now();
  print('Dawid Drzewiecki');
  print('Data ${now.toLocal()}');
  print('Port ${server.port}');
}
