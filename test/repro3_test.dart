import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:test/test.dart';

void main() {
  test("spawn", () async {
    final completer = new Completer();
    final p = new ReceivePort();
    final isolate = await Isolate.spawn(func, p.sendPort, paused: true);
    p.listen((_) async {
      await isolate.kill();
      completer.complete();
    });
    isolate.resume(isolate.pauseCapability);
    await completer.future;
    p.close();

    final current = await Process.run("ps", ["-p", "$pid", "-o", "command,vsize,rss,%mem,size"]);
    print("${current.stdout}");
  });
}

void func(SendPort p) async {
  p.send('ok');
}
