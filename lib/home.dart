import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_riverpod_flutter_counter/providers/counter_provider.dart';

 final counterProvider = StateNotifierProvider<CounterProvider, int>((ref) =>CounterProvider());

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
   
    print("Widget Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer(builder: (context, ref, child) {
        final count = ref.watch(counterProvider);
        return Center(
          child: Text(
            "$count",
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => ref.read(counterProvider.notifier).increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () => ref.read(counterProvider.notifier).decrement(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              )
            ],
          );
        }
      ),
    );
  }
}
