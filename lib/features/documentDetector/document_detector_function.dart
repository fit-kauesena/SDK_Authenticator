import 'package:document_detector/android/android_settings.dart';
import 'package:document_detector/android/capture_stage/capture_mode.dart';
import 'package:document_detector/android/capture_stage/capture_stage.dart';
import 'package:document_detector/android/capture_stage/detection_settings.dart';
import 'package:document_detector/android/capture_stage/quality_settings.dart';
import 'package:document_detector/android/customization.dart';
import 'package:document_detector/android/maskType.dart';
import 'package:document_detector/document_detector.dart';
import 'package:document_detector/document_detector_step.dart';
import 'package:document_detector/result/document_detector_failure.dart';
import 'package:document_detector/result/document_detector_result.dart';
import 'package:document_detector/result/document_detector_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdk_face_authenticator/main.dart';
import 'package:sdk_face_authenticator/settings/sdk_token.dart';

void startDocumentDetector(
    List<DocumentDetectorStep> documentSteps, BuildContext context) async {
  String result = "";
  String peopleId = "";
  String description = "";

  DocumentDetector documentDetector = DocumentDetector(
    mobileToken: Token.sdkToken,
  );

  QualitySettings qualitySettings = QualitySettings(1.8);
  DetectionSettings detectionSettings = DetectionSettings(0.91, 5);

  List<CaptureStage> captureStages = [
    CaptureStage(
      durationMillis: 20000,
      wantSensorCheck: true,
      qualitySettings: qualitySettings,
      detectionSettings: detectionSettings,
      captureMode: CaptureMode.AUTOMATIC,
    ),
    CaptureStage(
      durationMillis: 15000,
      wantSensorCheck: false,
      qualitySettings: qualitySettings,
      detectionSettings: detectionSettings,
      captureMode: CaptureMode.AUTOMATIC,
    ),
    CaptureStage(
      durationMillis: 15000,
      wantSensorCheck: false,
      qualitySettings: qualitySettings,
      detectionSettings: detectionSettings,
      captureMode: CaptureMode.MANUAL,
    ),
    CaptureStage(
      durationMillis: 0,
      wantSensorCheck: false,
      qualitySettings: null,
      detectionSettings: null,
      captureMode: CaptureMode.MANUAL,
    ),
  ];

  DocumentDetectorCustomizationAndroid androidA =
      DocumentDetectorCustomizationAndroid(
    maskType: MaskType.DEFAULT,
  );

  DocumentDetectorAndroidSettings androidSettings =
      DocumentDetectorAndroidSettings(
    captureStages: captureStages,
    useEmulator: true,
    useAdb: true,
    useDebug: true,
    useDeveloperMode: true,
    useRoot: true,
    customization: androidA,
  );

  documentDetector.setAndroidSettings(androidSettings);
  documentDetector.setPeopleId(peopleId);
  documentDetector.setDocumentFlow(documentSteps);

  try {
    DocumentDetectorResult documentResult = await documentDetector.start();

    if (documentResult is DocumentDetectorSuccess) {
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
    } else if (documentResult is DocumentDetectorFailure) {
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
