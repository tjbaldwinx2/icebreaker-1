import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {

  State<StatefulWidget> createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        logo(),
        emailField()
      ],
    );
  }

  Widget logo(){
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 150.0,
          child: Image.asset('images/Logo.png'),
        ),
      ),
      /*child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 200.0,
        child: Image.asset('images/Logo.png'),
      ),*/
    );
  }
  
  Widget emailField(){
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: new Text(
              "EMAIL",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
    /*return new Expanded(
      child: TextField(
          obscureText: false,
          //style: ,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
          ),
        )
    );*/
  }
}

/*class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('IceBreaker'),
        ),
        body: Stack(
          children: <Widget>[
            showForm(),
            showCircularProgress(),
          ],
        ));
  }

  Widget showCircularProgress(){

    if (_isLoading){
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo(){
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('images/assets/Logo.png'),
        ),
      )
    );
  }

  Widget showEmailInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )
        ),
        validator: (value) => value.isEmpty ? "Email can't be empty" : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )
        ),
        validator: (value) => value.isEmpty ? "Password can't be empty" : null,
        onSaved: (value) => _password = value.trim(),
      )
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          color: Colors.blue,
          child: new Text(_isLoginForm ? 'Login' : 'Create account',
            style: new TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: validateAndSubmit,
        ),
      )
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }

  void toggleFormMode(){
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget showErrorMessage() {
    if(_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300),
      );
    }
    else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage(),
          ],
        )
      ),
    );
  }*/
//}