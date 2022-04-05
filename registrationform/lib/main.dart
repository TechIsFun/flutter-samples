import 'package:flutter/material.dart';
import 'package:registrationform/registration_form_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login/Signup Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login/Signup Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 350,
          child: SingleChildScrollView(
            child: RegistrationFormWidget(
              formType: FORM_TYPE_LOGIN,
              onLoginFormValidated: (model) => doLogin(model),
              onRegistrationFormValidated: (model) => doSignup(model),
              labelEmail: "Email",
              labelFirstName: "Nome",
              labelLastName: "Cognome",
              labelPassword: "Password",
              labelPasswordConfirm: "Conferma password",
              labelPhone: "Telefono",
              labelProvince: "Provincia",
              labelUsername: "Username",
              labelAddress: "Indirizzo",
              labelZipcode: "CAP",
              labelMunicipality: "Comune",
              fieldFirstNameInitialValue: "Mario",
              fieldLastNameInitialValue: "Rossi",
              fieldPhoneInitialValue: "3335566778",
              fieldEmailInitialValue: "test@test.com",
              fieldAddressInitialValue: "Via mia",
              fieldZipcodeInitialValue: "30030",
              fieldMunicipalityInitialValue: "Mestre",
              fieldProvinceInitialValue: "VE",
            ),
          ),
        ),
      ),
    );
  }

  void doLogin(LoginDataModel model) {
    print("Do login with model $model");
  }

  void doSignup(RegistrationDataModel model) {
    print("Do login with model $model");
  }
}
