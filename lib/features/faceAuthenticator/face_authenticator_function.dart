import 'package:face_authenticator/android/settings.dart';
import 'package:face_authenticator/face_authenticator.dart';
import 'package:face_authenticator/result/face_authenticator_failure.dart';
import 'package:face_authenticator/result/face_authenticator_result.dart';
import 'package:face_authenticator/result/face_authenticator_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdk_face_authenticator/main.dart';
import 'package:sdk_face_authenticator/settings/sdk_token.dart';

void startFaceAuthenticator(BuildContext context, String cpf) async {
  String result = "";
  String peopleId = "";
  String description = "";

  FaceAuthenticator faceAuthenticator = FaceAuthenticator(
    mobileToken: Token.sdkToken,
  );
  faceAuthenticator.setPeopleId(cpf);

  FaceAuthenticatorAndroidSettings androidSettings =
      FaceAuthenticatorAndroidSettings(
    useDeveloperMode: true,
    enableRootDevices: true,
    enableEmulator: true,
    useAdb: true,
    useDebug: true,
  );

  faceAuthenticator.setAndroidSettings(androidSettings);

  try {
    FaceAuthenticatorResult faceAuthenticatorResult =
        await faceAuthenticator.start();

    if (faceAuthenticatorResult is FaceAuthenticatorSuccess) {
      result = "Documento capturado!";
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: result,
          ),
        ),
      );
    } else if (faceAuthenticatorResult is FaceAuthenticatorFailure) {
      result = "Falha!";
      description = "Não foi possível capturar o documento";
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: result,
          ),
        ),
      );
    } else {
      result = "A câmera foi fechada";
    }
  } on PlatformException catch (err) {
    result = "Erro!";
    description = err.message!;
  }
}
