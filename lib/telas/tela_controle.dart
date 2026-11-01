import 'package:flutter/material.dart';
import 'package:hidroplantix/widgets/widget_text_custom.dart';

class TelaControle extends StatefulWidget {
  @override
  State<TelaControle> createState() => _TelaControleState();
}

class _TelaControleState extends State<TelaControle> {

  bool valvula1 = false;
  bool valvula2 = false;
  bool modoAutomatico = false;

  // Card de cada setor
  Widget cardSetor(String nome, bool ligado, int setor) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Color(0xFF18352A),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(
                Icons.eco,
                color: Color(0xFF69DCA4),
                size: 28,
              ),

              SizedBox(width: 10),

              TextosCustom(nome, 18, Colors.white),
            ],
          ),

          SizedBox(height: 20),

          TextosCustom(
            "Status da irrigação",
            14,
            Colors.white70,
          ),

          SizedBox(height: 5),

          TextosCustom(
            ligado ? "Ligada" : "Desligada",
            22,
            ligado ? Color(0xFF69DCA4) : Colors.white70,
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: TextosCustom(
                  "Válvula:",
                  15,
                  Colors.white,
                ),
              ),

              TextosCustom(
                ligado ? "Ativada" : "Desativada",
                15,
                ligado ? Color(0xFF69DCA4) : Colors.white70,
              ),
            ],
          ),

          SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: modoAutomatico
                  ? null
                  : () {
                setState(() {
                  if (setor == 1) {
                    valvula1 = !valvula1;
                  } else {
                    valvula2 = !valvula2;
                  }
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF69DCA4),
                foregroundColor: Color(0xFF10271E),
                disabledBackgroundColor: Colors.grey.shade800,
                disabledForegroundColor: Colors.white54,
                padding: EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              child: Text(
                ligado ? "Desligar irrigação" : "Ligar irrigação",
              ),
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF10271E),

      child: Padding(
        padding: EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              TextosCustom(
                "Controle de irrigação",
                26,
                Colors.white,
              ),

              SizedBox(height: 5),

              TextosCustom(
                "Gerencie seus setores de irrigação",
                15,
                Colors.white70,
              ),

              SizedBox(height: 25),

              // MODO DE OPERACAO
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Color(0xFF18352A),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  children: [

                    Icon(
                      Icons.settings,
                      color: Color(0xFF69DCA4),
                      size: 28,
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          TextosCustom(
                            "Modo de operação",
                            17,
                            Colors.white,
                          ),

                          SizedBox(height: 5),

                          TextosCustom(
                            modoAutomatico ? "Automático" : "Manual",
                            13,
                            Colors.white70,
                          ),

                        ],
                      ),
                    ),

                    Switch(
                      value: modoAutomatico,
                      activeColor: Color(0xFF69DCA4),

                      onChanged: (valor) {
                        setState(() {
                          modoAutomatico = valor;

                          if (modoAutomatico) {
                            valvula1 = false;
                            valvula2 = false;
                          }
                        });
                      },
                    ),

                  ],
                ),
              ),

              SizedBox(height: 25),

              TextosCustom(
                "Setores de irrigação",
                20,
                Colors.white,
              ),

              SizedBox(height: 15),

              cardSetor("Setor 1", valvula1, 1),

              cardSetor("Setor 2", valvula2, 2),

            ],
          ),
        ),
      ),
    );
  }
}