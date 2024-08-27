import 'package:brick_breaker/ball.dart';
import 'package:brick_breaker/coverscreen.dart';
import 'package:brick_breaker/player.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ball variables
  double ballX = 0;
  double ballY = 0;

  // game setting
  bool hasGameStarted = false;

  // player
  double playerX = 0;
  double playerWidth = 0.3;

  void startGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        ballY -= 0.005;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Center(
          child: Stack(
            children: [
              // tap to play
              CoverScreen(hasGameStarted: hasGameStarted),
              // ball
              MyBall(
                ballX: ballX,
                ballY: ballY,
              ),

              // player
              MyPlayer(playerX: playerX, playerWidth: playerWidth),
            ],
          ),
        ),
      ),
    );
  }
}
