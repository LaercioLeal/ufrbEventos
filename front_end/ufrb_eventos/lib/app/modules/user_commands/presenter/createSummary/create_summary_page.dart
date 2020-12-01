import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('assets/img/logo.png'),
          Text('Submissão'),
          TextFormField(
            onChanged: controller.setRegistration,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Matricula',
            ),
          ),
          FindDropdown(
            items: ["UFRB", "UFBA", "UEFS", "UESB", "Outros"],
            label: "Instituição",
            onChanged: controller.setInstituition,
          ),
          TextFormField(
            onChanged: controller.setInstituition,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome da instituição',
              enabled: controller.summaryModel.userInstitution != null &&
                      controller.summaryModel.userInstitution == 'Outros'
                  ? true
                  : false,
            ),
          ),
          FindDropdown(
            items: ["Evento_1", "Evento_2", "Evento_3", "Evento_4", "Evento_4"],
            label: "Evento*",
            onChanged: controller.setEvent,
          ),
          TextFormField(
            onChanged: controller.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Titulo*',
            ),
          ),
          TextFormField(
            onChanged: controller.setDescription,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Informações adicionais',
            ),
          ),
          Text('Necessita apresentação?'),
          Row(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Sim',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                leading: Radio(
                  value: true,
                  groupValue: controller.presentation,
                  onChanged: controller.setPresentation
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Não',
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: Radio(
                  value: false,
                  groupValue: controller.presentation,
                  onChanged: controller.setPresentation
                ),
              ),
            ],
          ),
          Row(children: [
            GestureDetector(
              child: Image.asset('/assets/img/botaoSoma.png'),
            ),
            GestureDetector(
              child: Image.asset('/assets/img/botaoVideo.png'),
            ),
            GestureDetector(
              child: Image.asset('/assets/img/botaoCadastrar.png'),
              onTap: controller.sendSummary,
            ),
            
          ],)
        ],
      ),
    );
  }
}
