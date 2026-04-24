import 'dart:convert';
import 'dart:io';

/// A tiny JSON-RPC 2.0 ND-JSON server over a Unix domain socket, for use in
/// widget tests. Records every inbound request and replies using a caller-
/// supplied [handler].
///
/// Usage:
///
/// ```dart
/// final mock = MockIpcServer();
/// await mock.start((req) {
///   switch (req['method']) {
///     case 'auth.login': return {'ok': true};
///     default: return null;
///   }
/// });
/// addTearDown(mock.stop);
/// ```
///
/// Uses real sockets, so callers must drive it inside
/// `tester.runAsync(...)` — the default Flutter test binding uses
/// fake-async timers and real I/O does not progress under a bare
/// `pumpAndSettle`.
class MockIpcServer {
  late ServerSocket _server;
  late Directory _dir;
  late String path;
  final received = <Map<String, dynamic>>[];

  Future<void> start(Map<String, Object?>? Function(Map<String, dynamic>) handler) async {
    _dir = await Directory.systemTemp.createTemp('ss_mock_');
    path = '${_dir.path}/s.sock';
    _server = await ServerSocket.bind(
      InternetAddress(path, type: InternetAddressType.unix),
      0,
    );
    _server.listen((sock) {
      sock
          .cast<List<int>>()
          .transform(utf8.decoder)
          .transform(const LineSplitter())
          .listen((line) {
            final req = json.decode(line) as Map<String, dynamic>;
            received.add(req);
            final result = handler(req);
            final resp = <String, Object?>{
              'jsonrpc': '2.0',
              'id': req['id'],
              if (result == null)
                'error': {
                  'code': -32601,
                  'message': "method '${req['method']}' not mocked",
                }
              else
                'result': result,
            };
            sock.write('${json.encode(resp)}\n');
          });
    });
  }

  Future<void> stop() async {
    await _server.close();
    await _dir.delete(recursive: true);
  }
}
