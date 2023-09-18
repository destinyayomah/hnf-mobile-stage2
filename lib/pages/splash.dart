import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hngmobilestage2/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // HIDE TOP AND BOTTOM SYSTEM UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // SPLASH SCREEN TIMER
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Home(),
        ),
      );
    });
  }

  // RE-SHOW TOP AND BOTTOM SYSTEM UI
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(''),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 200,
                width: 200,
              ),
            ),
            const Text(
              'Cv Viewer',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
