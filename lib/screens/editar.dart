import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../alerts/pop_up_success_delete_or_edit.dart';
import '../data/datasource.dart';

class EditarScreen extends StatefulWidget {
  EditarScreen(this.id, {Key? key});

  //Ver Melhor Forma de Fazer
  final int id;
  final String title = "Editar Registo";

  @override
  State<EditarScreen> createState() => _EditarScreenState(this.id);
}

class _EditarScreenState extends State<EditarScreen> {
  _EditarScreenState(this.id);

  //Ver Melhor Forma de Fazer
  final int id;

  final  _fbKey = GlobalKey<FormBuilderState>();

  DataSource _dataSource = DataSource.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FormBuilder(
            key: _fbKey,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  decoration: InputDecoration(
                    labelText: 'Qual o seu peso?',
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.numeric(context),
                  ]),
                  name: "form_peso",
                  initialValue: _dataSource.getAll()[id].peso.toString(),
                ),
                FormBuilderDropdown(
                  decoration: InputDecoration(
                    labelText: 'Alimentou-se nas últimas 3 horas?',
                  ),
                  items: ['Sim', 'Não']
                      .map((opcao) => DropdownMenuItem(
                      value: opcao, child: Text("$opcao")))
                      .toList(),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  name: "form_alimentacao",
                  initialValue: _dataSource.getAll()[id].alimentacao,
                ),
                FormBuilderSlider(
                  decoration: InputDecoration(
                    labelText: 'Como se sente hoje?',
                    labelStyle: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  min: 1,
                  max: 5,
                  initialValue: _dataSource.getAll()[id].nota.toDouble(),
                  divisions: 4,
                  name: "form_nota",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                FormBuilderTextField(
                  decoration: InputDecoration(
                    labelText: 'Observações (Entre 100 a 200 caracteres)',
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 6,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.maxLength(context, 200),
                  ]),
                  name: "form_observacoes",
                  initialValue: _dataSource.getAll()[id].observacoes,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2,
                child: Text("Submeter Edição", style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () {
                  _fbKey.currentState?.save();
                  if (_fbKey.currentState!.validate()) {
                    final formData = _fbKey.currentState?.value;

                    double peso = double.parse(formData!['form_peso']);
                    String alimentacao = formData['form_alimentacao'];
                    int nota = formData['form_nota'].toInt();
                    String observacoes = "";
                    if(formData['form_observacoes'] != null) {
                      observacoes = formData['form_observacoes'];
                    }

                    _dataSource.edit(id, peso, alimentacao, nota, observacoes);;

                    showDialog(context: context,
                      builder: (BuildContext context) => popUpSuccessDeleteOrEdit(context, "editado"),
                    );

                  }
                },
              )
            ],
          )
        ],
      )
    );
  }
}