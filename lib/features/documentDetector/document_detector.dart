import 'package:flutter/material.dart';
import 'package:sdk_face_authenticator/features/documentDetector/document_detector_modal.dart';

Future<T?> documentDetector<T>(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ModalBottomSheet(
      label: "Captura de documentos",
      description:
          "SDK responsável por capturar uma RG, CNH e outros documentos genéricos de identificação com qualidade e garantia para a extração dos dados documentais.",
      onTap: () {},
    ),
  );
}
