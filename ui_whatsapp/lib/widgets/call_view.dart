import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_whatsapp/models/call.dart';
import 'package:ui_whatsapp/theme.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callList.length,
      itemBuilder: (context, index) {
        final call = callList[index];
        return ListTile(
          leading:
              const Icon(Icons.account_circle, color: Colors.black45, size: 58),
          title: Text(
            call.name,
            style: customTextStyle,
          ),
          subtitle: Text(
            call.callDate,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Icon(Icons.call, color: whatsAppGreen),
          ),
        );
      },
    );
  }
}
