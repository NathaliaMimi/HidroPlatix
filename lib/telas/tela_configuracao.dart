import 'package:flutter/material.dart';
import 'package:hidroplantix/widgets/widget_text_custom.dart';

class TelaConfiguracao extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextosCustom(
        "Tela de Configurações",
        22,
        Colors.white,
      ),
    );
  }
}