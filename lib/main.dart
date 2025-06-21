import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _LotteryAppState();
}

int x = Random().nextInt(10);

class _LotteryAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("🎯 Lottery App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          backgroundColor:Colors.blueAccent ,
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.black.withAlpha((0.3 * 255).round()),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Today's Lucky Number is 5",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          padding: const EdgeInsets.all(20),
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: x == 5
                                  ? [Colors.greenAccent, Colors.teal]
                                  : x == 0
                                  ? [Colors.grey, Colors.black26]
                                  : [Colors.redAccent, Colors.deepOrange],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha((0.3 * 255).round()),

                                blurRadius: 15,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                x == 5
                                    ? Icons.emoji_events
                                    : x == 0
                                    ? Icons.hourglass_empty
                                    : Icons.sentiment_very_dissatisfied,
                                size: 50,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                x == 5
                                    ? '🎉 You WON!\nLottery Number = $x'
                                    : x == 0
                                    ? '⏳ Waiting...\nLottery Number = $x'
                                    : '😢 You Lost!\nLottery Number = $x',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                heroTag: 'reset',
                onPressed: () {
                  setState(() {
                    x = 0;
                  });
                },
                label: const Text("Reset"),
                icon: const Icon(Icons.refresh),
                backgroundColor: Colors.redAccent,
              ),
              const SizedBox(width: 15),
              FloatingActionButton.extended(
                heroTag: 'try',
                onPressed: () {
                  setState(() {
                    x = Random().nextInt(10);
                  });
                },
                label: const Text("Try Again"),
                icon: const Icon(Icons.casino),
                backgroundColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
