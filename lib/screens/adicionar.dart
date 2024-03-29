import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mini_projeto/model/registo.dart';
import 'package:mini_projeto/data/datasource.dart';
import 'package:mini_projeto/alerts/pop_up_submit.dart';

class AdicionarScreen extends StatefulWidget {
  const AdicionarScreen({Key? key}) : super(key: key);

  final String title = "Adicionar Registo";

  @override
  State<AdicionarScreen> createState() => _AdicionarScreenState();
}

class _AdicionarScreenState extends State<AdicionarScreen> {
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
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Qual o seu peso?',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.numeric(context),
                    FormBuilderValidators.min(context, 0),
                    FormBuilderValidators.max(context, 1000),
                  ]),
                  name: "form_peso",
                ),
                FormBuilderDropdown(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
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
                ),
                FormBuilderSlider(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                      labelText: 'Como se sente hoje?',
                      labelStyle: TextStyle(
                        fontSize: 22.0,
                      ),
                  ),
                  min: 1,
                  max: 5,
                  initialValue: 3,
                  divisions: 4,
                  name: "form_nota",
                  validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                  ]),
                ),
                FormBuilderTextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Observações (Entre 100 a 200 caracteres)',
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 6,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.maxLength(context, 200),
                  ]),
                  name: "form_observacoes",
                ),

              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                child: Text("Submeter", style: TextStyle(color: Colors.white),),
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

                      Registo novoRegisto = Registo(peso, alimentacao, nota, observacoes);
                      _dataSource.insert(novoRegisto);

                      showDialog(context: context,
                        builder: (BuildContext context) => popUpSubmit(context),
                      );

                    }
                },
              ),
              MaterialButton(
                child: Text("Limpar", style: TextStyle(color: Colors.white),),
                color: Colors.red,
                onPressed: () {
                  _fbKey.currentState!.reset();
                },
              ),
            ],
          )
        ],
      ),

    );
  }
}
