
import 'package:flutter/material.dart';
import 'package:hidroplantix/widgets/widget_text_custom.dart';
import 'package:hidroplantix/telas/tela_controle.dart';
import 'package:hidroplantix/telas/tela_historico.dart';
import 'package:hidroplantix/telas/tela_configuracao.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Barra de navegacao inferior
  int paginaAtual = 0;

  // Tela inicial
  Widget telaInicio() {
    return Padding(
      padding: EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          TextosCustom("Olá!", 26, Colors.white),

          SizedBox(height: 5),

          TextosCustom(
            "Acompanhe sua irrigação",
            15,
            Colors.white70,
          ),

          SizedBox(height: 25),

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
                  Icons.wifi,
                  color: Color(0xFF69DCA4),
                  size: 30,
                ),

                SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    TextosCustom(
                      "Sistema de irrigação",
                      17,
                      Colors.white,
                    ),

                    SizedBox(height: 5),

                    TextosCustom(
                      "Aguardando conexão...",
                      13,
                      Colors.white70,
                    ),

                  ],
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

          Expanded(
            child: ListView(
              children: [

                Container(
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

                          TextosCustom(
                            "Setor 1",
                            18,
                            Colors.white,
                          ),

                        ],
                      ),

                      SizedBox(height: 20),

                      TextosCustom(
                        "Umidade do solo",
                        14,
                        Colors.white70,
                      ),

                      SizedBox(height: 5),

                      TextosCustom(
                        "-- %",
                        28,
                        Color(0xFF69DCA4),
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [

                          TextosCustom(
                            "Válvula:",
                            15,
                            Colors.white,
                          ),

                          SizedBox(width: 8),

                          TextosCustom(
                            "Desligada",
                            15,
                            Colors.white70,
                          ),

                        ],
                      ),

                    ],
                  ),
                ),

                Container(
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

                          TextosCustom(
                            "Setor 2",
                            18,
                            Colors.white,
                          ),

                        ],
                      ),

                      SizedBox(height: 20),

                      TextosCustom(
                        "Umidade do solo",
                        14,
                        Colors.white70,
                      ),

                      SizedBox(height: 5),

                      TextosCustom(
                        "-- %",
                        28,
                        Color(0xFF69DCA4),
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [

                          TextosCustom(
                            "Válvula:",
                            15,
                            Colors.white,
                          ),

                          SizedBox(width: 8),

                          TextosCustom(
                            "Desligada",
                            15,
                            Colors.white70,
                          ),

                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

  // Escolher qual tela sera exibida
  Widget escolherTela() {

    if (paginaAtual == 0) {
      return telaInicio();
    }

    else if (paginaAtual == 1) {
      return TelaControle();
    }

    else if (paginaAtual == 2) {
      return TelaHistorico();
    }

    else {
      return TelaConfiguracao();
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF10271E),

      appBar: AppBar(
        title: Image.asset(
          'assets/img/logo_hidroplantix.png',
          height: 45,
        ),
        backgroundColor: Color(0xFF18352A),
      ),

      // Conteudo das telas
      body: escolherTela(),

      // Navegacao inferior
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: paginaAtual,

        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },

        backgroundColor: Color(0xFF18352A),
        selectedItemColor: Color(0xFF69DCA4),
        unselectedItemColor: Colors.white70,

        type: BottomNavigationBarType.fixed,

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: "Controle",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Histórico",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configurações",
          ),

        ],
      ),

    );
  }
}
