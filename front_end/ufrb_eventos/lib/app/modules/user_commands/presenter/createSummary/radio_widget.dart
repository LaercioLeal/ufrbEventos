import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ufrb_eventos/app/modules/user_commands/presenter/createSummary/create_summary_controller.dart';

class RadioWidget extends StatefulWidget {
  final Function setChange;

  const RadioWidget({Key key, this.setChange}) : super(key: key);
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  CreateSummaryController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.presentation = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
          Expanded(
            flex: 5,
                      child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'Sim',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              leading: Radio(
                value: true,
                groupValue: controller.presentation,
                onChanged: (value) {
                  setState(() {
                    controller.setPresentation(value);
                    controller.presentation = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
                      child: ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'Não',
                style: TextStyle(color: Colors.white, fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
              leading: Radio(
                value: false,
                groupValue: controller.presentation,
                onChanged: (value) {
                  setState(() {
                    controller.setPresentation(value);
                    controller.presentation = value;
                  });
                },
              ),
            ),
          ),
      ],
    );
  }
}
