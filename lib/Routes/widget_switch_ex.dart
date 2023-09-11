import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WidgetSwitchEx extends StatefulWidget {
  const WidgetSwitchEx({Key? key}) : super(key: key);

  @override
  State<WidgetSwitchEx> createState() => _WidgetSwitchExState();
}

class _WidgetSwitchExState extends State<WidgetSwitchEx> {
  bool _switchValue1 = false;
  bool _switchValue2 = true;
  bool _switchValue3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: const Text('Switch 1'),
              value: _switchValue1,
              onChanged: (value) {
                setState(() {
                  _switchValue1 = value;
                });
              },
            ),
            ListTile(
              title: const Text('Cupertino Switch'),
              trailing: CupertinoSwitch(
                value: _switchValue2,
                onChanged: (value) {
                  setState(() {
                    _switchValue2 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Custom Toggle Switch'),
              trailing: SizedBox(
                width: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _switchValue3 = true;
                        });
                      },
                      child: Container(
                        width: 40.0,
                        height: 30.0,
                        color: _switchValue3 ? Colors.green : Colors.grey,
                        child: const Center(
                          child: Text(
                            'On',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _switchValue3 = false;
                        });
                      },
                      child: Container(
                        width: 40.0,
                        height: 30.0,
                        color: _switchValue3 ? Colors.grey : Colors.red,
                        child: const Center(
                          child: Text(
                            'Off',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
