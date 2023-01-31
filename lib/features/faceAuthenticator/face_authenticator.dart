import 'package:flutter/material.dart';
import 'package:sdk_face_authenticator/features/faceAuthenticator/face_authenticator_modal.dart';

Future<T?> faceAuthenticator<T>(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ModalBottomSheet(
      label: "Autenticação facial",
      description:
          "Facematch com prova de vida do usuário do seu app, ideal para fluxos de login ou de operações financeiras valiosas.",
      onTap: () {},
    ),
  );
}
