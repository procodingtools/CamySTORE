import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class AccountEdit extends StatefulWidget {
  AccountEdit({Key key, this.nameController, this.formKey}) : super(key: key);

  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;

  @override
  _AccountEditState createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _groupName("Mes infos"),
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: _textField(
                controller: widget.nameController,
                hint: 'Nom'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: _textField(
                controller: TextEditingController(
                    text: "Karim"),
                hint: "Prénom"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    width: Dimens.Width * .18,
                    child: _textField(hint: "Age"),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0),
                  child: DropdownButton(
                    hint: Text('Sexe', style: TextStyle(color: Values.greyedTextLight),),
                    items: [
                      DropdownMenuItem(
                        child: Text("Homme",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 14.0)),
                        value: 'h',
                      ),
                      DropdownMenuItem(
                        child: Text("Femme",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 14.0)),
                        value: 'f',
                      ),
                    ],
                    itemHeight: 55.0,
                    onChanged: (o) => print(o.value),
                    //value: 'n',
                    //validator: (item) => item == null ? "Verifier le champ" : null,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                    isDense: true,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: _groupName('Information commande'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: _textField(hint: "Adresse"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: _textField(hint: "Adresse suite"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: Dimens.Width * .465,
                  child: _textField(hint: "Commune"),
                ),
                Flexible(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(
                          left: 35.0),
                      child:
                      _textField(hint: "Code postal"),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: DropdownButton(

              hint: Text('Wilaya                              ', style: TextStyle(color: Values.greyedTextLight),),
              items: [
                DropdownMenuItem(
                    child: Text(
                        ""), value: 'n',)
              ],
              onChanged: (o) => print(o),
              //validator: (item) => item == null ? "Verifier le champ" : null,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0, right: Dimens.Width * .35),
            child: _textField(hint: "Mobile pricipale"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: _textField(hint: "Mobile 2"),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 35.0,
                bottom: Dimens.Height * .09),
            child: _textField(hint: "Email 1"),
          ),
        ],
      ),
    );
  }


  Widget _groupName(String name) {
    return Text(
      name,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12.0),
    );
  }

  Widget _textField({String hint, TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Values.greyedTextLight),
        contentPadding: EdgeInsets.only(bottom: 5.0, left: 2.0),
      ),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
    );
  }
}