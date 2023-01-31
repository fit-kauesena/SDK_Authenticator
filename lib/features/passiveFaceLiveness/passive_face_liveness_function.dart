import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passive_face_liveness/android/settings.dart';
import 'package:passive_face_liveness/passive_face_liveness.dart';
import 'package:passive_face_liveness/result/passive_face_liveness_failure.dart';
import 'package:passive_face_liveness/result/passive_face_liveness_result.dart';
import 'package:passive_face_liveness/result/passive_face_liveness_success.dart';
import 'package:sdk_face_authenticator/main.dart';
import 'package:sdk_face_authenticator/settings/sdk_token.dart';

void startPassiveFaceLiveness(BuildContext context) async {
  String result = "";
  String peopleId = "";
  String description = "";

  PassiveFaceLiveness passiveFaceLiveness =
      PassiveFaceLiveness(mobileToken: Token.sdkToken);

  PassiveFaceLivenessAndroidSettings androidSettings =
      PassiveFaceLivenessAndroidSettings(
    emulatorSettings: true,
    rootSettings: true,
    useDeveloperMode: true,
    useAdb: true,
    useDebug: true,
  );

  passiveFaceLiveness.setAndroidSettings(androidSettings);

  try {
    PassiveFaceLivenessResult passiveFaceLivenessResult =
        await passiveFaceLiveness.start();

    if (passiveFaceLivenessResult is PassiveFaceLivenessSuccess) {
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
    } else if (passiveFaceLivenessResult is PassiveFaceLivenessFailure) {
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
