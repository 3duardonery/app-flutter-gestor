import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  final void Function(String, String) onSubmit;
  final bool loading;

  FormLogin(this.onSubmit, this.loading);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  _submitForm() {
    //captura as informações digitadas no form
    final email = emailController.text;
    final password = passwordController.text;

    if (!widget.loading) widget.onSubmit(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                labelText: 'Email',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Container(
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
                labelText: 'Senha',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: new OutlineButton(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xFF34495E),
                    ),
                    child: widget.loading
                        ? CircularProgressIndicator(
                            backgroundColor: Color(0xFF34495E),
                          )
                        : Text(
                            "Acessar",
                            style: TextStyle(
                                color: Color(0xFF34495E),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                    padding: EdgeInsets.all(20),
                    onPressed: _submitForm,
                    highlightColor: Colors.yellow,
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
