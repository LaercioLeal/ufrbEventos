import 'dart:ui';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrb_eventos/app/modules/user_commands/presenter/createSummary/radio_widget.dart';
import 'create_summary_controller.dart';

class CreateSummaryPage extends StatefulWidget {
  final String title;
  const CreateSummaryPage({Key key, this.title = "CreateSummary"})
      : super(key: key);
  @override
  _CreateSummaryPageState createState() => _CreateSummaryPageState();
}

class _CreateSummaryPageState
    extends ModularState<CreateSummaryPage, CreateSummaryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF343A40),
        body: Observer(
          builder: (_) {
            return Container(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 5),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 0.95 * MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          'assets/img/logo.png',
                          width: 150,
                          height: 20,
                        ),
                        Text(
                          'Submissão',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            onChanged: controller.setEntrolment,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Matricula',
                            ),
                          ),
                        ),
                        FindDropdown(
                          items: ["UFRB", "UFBA", "UEFS", "UESB", "Outros"],
                          label: "Instituição",
                          onChanged: controller.setInstituition,
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        if (controller.summaryModel.userInstitution == 'Outros')
                          TextFormField(
                            onChanged: controller.setInstituition,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Nome da instituição',
                              enabled: controller
                                              .summaryModel.userInstitution !=
                                          null &&
                                      controller.summaryModel.userInstitution ==
                                          'Outros'
                                  ? true
                                  : false,
                            ),
                          ),
                        FindDropdown(
                          labelStyle: TextStyle(color: Colors.white),
                          items: [
                            "Evento_1",
                            "Evento_2",
                            "Evento_3",
                            "Evento_4",
                            "Evento_4"
                          ],
                          label: "Evento*",
                          onChanged: controller.setEvent,
                        ),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            onChanged: controller.setTitle,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Titulo*',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            onChanged: controller.setDescription,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Informações adicionais',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('Necessita apresentação?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: RadioWidget(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                'assets/img/botaoSoma.png',
                                height: 50,
                                width: 50,
                              ),
                              onTap: controller.getPdf,
                            ),
                            GestureDetector(
                              child: Image.asset(
                                'assets/img/botaoVideo.png',
                                height: 50,
                                width: 50,
                              ),
                              onTap: controller.getMovie,
                            ),
                            Observer(builder: (_) {
                              return controller.upload ? CircularProgressIndicator() : GestureDetector(
                                child: Image.asset(
                                  'assets/img/botaoCadastrar.png',
                                  height: 50,
                                  width: 120,
                                ),
                                onTap: controller.sendSummary,
                              );
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
