import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sdk_face_authenticator/components/button.dart';
import 'package:sdk_face_authenticator/features/documentDetector/document_detector.dart';
import 'package:sdk_face_authenticator/features/faceAuthenticator/face_authenticator.dart';
import 'package:sdk_face_authenticator/features/passiveFaceLiveness/passive_face_liveness.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBank 450',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  void requestPermissions() async {
    await [
      Permission.camera,
    ].request();
  }

  final Color primaryColor = const Color(0xFF323751);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/fitbank.png",
          height: 20,
          width: 67,
        ),
        backgroundColor: primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    button(
                      "Captura de documento",
                      () {
                        documentDetector(context);
                      },
                    ),
                    button(
                      "Prova de vida",
                      () {
                        passiveFaceLiveness(context);
                      },
                    ),
                    button(
                      "Autenticação facial",
                      () {
                        faceAuthenticator(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: primaryColor,
            height: 30,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Kauê Sena",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      result,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 120),
                    Icon(
                      result == "Documento capturado!"
                          ? Icons.check_circle
                          : Icons.error,
                      size: 150,
                      color: result == "Documento capturado!"
                          ? primaryColor
                          : Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
                      child: Text(
                        result == "Documento capturado!"
                            ? "O documento foi capturado e\nserá analisado."
                            : "A câmera foi fechada ou aconteçeu um erro, tente novamente mais tarde!",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            button(
              "Voltar",
              () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
