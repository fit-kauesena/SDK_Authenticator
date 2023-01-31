import 'package:flutter/material.dart';
import 'package:sdk_face_authenticator/features/passiveFaceLiveness/passive_face_liveness_modal.dart';

Future<T?> passiveFaceLiveness<T>(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ModalBottomSheet(
      label: "Prova de vida",
      description:
          "Câmera inteligente que captura uma selfie confiável do seu usuário utilizando inteligência artificial. É capaz de detectar e reprovar fotos de foto e gravações. Ideal para o seu onboarding.",
      onTap: () {},
    ),
  );
}
