import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(ReduxEx());
}

// Define actions
enum Actions { increment, decrement }

// Reducer to manage the state
int counterReducer(int state, dynamic action) {
  switch (action) {
    case Actions.increment:
      return state + 1;
    case Actions.decrement:
      return state - 1;
    default:
      return state;
  }
}

class ReduxEx extends StatelessWidget {
  final store = Store<int>(
    counterReducer,
    initialState: 0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redux Counter',
      home: StoreProvider<int>(
        store: store,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<int, int>(
              converter: (store) => store.state,
              builder: (context, count) {
                return Text(
                  'Counter Value: $count',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    StoreProvider.of<int>(context).dispatch(Actions.increment);
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    StoreProvider.of<int>(context).dispatch(Actions.decrement);
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
