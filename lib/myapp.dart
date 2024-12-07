import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/navigation_service.dart';
import 'core/styles/app_theme.dart';
import 'features/splash/presentation/views/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRoutes.generateRoute,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        initialRoute: SplashScreen.route,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late VlcPlayerController _videoPlayerController;

//   Future<void> initializePlayer() async {}

//   @override
//   void initState() {
//     super.initState();

//     initVlcPlayer();
//   }

//   Future<void> initVlcPlayer() async {
//     _videoPlayerController = VlcPlayerController.network(
//       'https://media.w3.org/2010/05/sintel/trailer.mp4',
//       hwAcc: HwAcc.full,
//       allowBackgroundPlayback: true,
//       autoInitialize: true,
//       options: VlcPlayerOptions(
//         advanced: VlcAdvancedOptions([]),
//         subtitle: VlcSubtitleOptions([
//           VlcSubtitleOptions.boldStyle(true),
//           VlcSubtitleOptions.fontSize(12),
//           VlcSubtitleOptions.outlineColor(VlcSubtitleColor.yellow),
//           VlcSubtitleOptions.outlineThickness(VlcSubtitleThickness.normal),
//           // works only on externally added subtitles
//           VlcSubtitleOptions.color(VlcSubtitleColor.navy),
//         ]),
//         http: VlcHttpOptions([
//           VlcHttpOptions.httpReconnect(true),
//         ]),
//         rtp: VlcRtpOptions([
//           VlcRtpOptions.rtpOverRtsp(true),
//         ]),
//       ),
//     );
//     _videoPlayerController.addOnInitListener(() async {
//       await _videoPlayerController.startRendererScanning();
//     });
//     _videoPlayerController.addOnRendererEventListener((type, id, name) {
//       debugPrint('OnRendererEventListener $type $id $name');
//     });
//     _videoPlayerController.addListener(
//       () {
//         log("============================= The app is running =============================");
//         log(_videoPlayerController.value.position.inSeconds.toString());
//       },
//     );
//   }

//   @override
//   void dispose() async {
//     super.dispose();
//     await _videoPlayerController.stopRendererScanning();
//     await _videoPlayerController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey,
//         appBar: AppBar(),
//         body: Center(
//           child: VlcPlayer(
//             controller: _videoPlayerController,
//             aspectRatio: 16 / 9,
//             placeholder: Center(child: CircularProgressIndicator()),
//           ),
//         ));
//   }
// }
