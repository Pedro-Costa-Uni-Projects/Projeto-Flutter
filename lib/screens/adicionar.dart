import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mini_projeto/model/registo.dart';
import 'package:mini_projeto/data/datasource.dart';

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
                    labelText: 'Qual o seu peso?',
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.numeric(context),
                  ]),
                  name: "form_peso",
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
                  initialValue: 3,
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
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 100),
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
                      print(formData);
                      Registo novoRegisto = Registo(formData!['form_peso'], formData['form_alimentacao'], formData['form_nota'], formData['form_observacoes']);
                      _dataSource.insert(novoRegisto);
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