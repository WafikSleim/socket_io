import 'dart:developer';

import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late IO.Socket socket;

  initSocketIoClient() {
    socket = IO.io(
      '', // url or API
      [],
    );
    socket.connect(); // connect to API or url
    socket.onConnect((_) {
      // on connect
      log('connect successfully');
    });
    socket.onConnectError((_) {
      // on connect error
      log('on connect error');
    });
    socket.onError((_) {
      // on error
      log('connect error');
    });
    socket.onDisconnect((_) {
      // on disconnect
      log('Connection Disconnection');
    });

    socket.on(
      // listen to events
      "sendNewMessage", // event name
      (data) {
        // data or messages
      },
    );
  }

  @override
  void initState() {
    initSocketIoClient(); // call
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void sendMessage() {
    var message = {"id": 5, "text": "hello world"};
    socket.emit( // emit to event (send message)
      'sendMessage', // event name
      message, // data or message data
    );
  }
}
