import 'package:flutter/material.dart';
import 'package:sdk_face_authenticator/components/button.dart';
import 'package:sdk_face_authenticator/features/passiveFaceLiveness/passive_face_liveness_function.dart';

class ModalBottomSheet extends StatelessWidget {
  final String label;
  final String description;
  final void Function()? onTap;

  ModalBottomSheet({
    super.key,
    required this.label,
    required this.onTap,
    this.description = "",
  });

  Color primaryColor = const Color(0xFF323751);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.81,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            button(
              "Ativo",
              () => startPassiveFaceLiveness(context),
            ),
            button(
              "Passivo",
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
