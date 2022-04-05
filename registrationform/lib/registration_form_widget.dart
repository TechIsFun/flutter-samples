import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Pattern per password con
/// - almeno 1 numero
/// - almeno 1 lettera maiuscola
/// - almeno 1 lettera minuscola
/// - almeno 1 simbolo
/// - almeno 8 caratteri
const Pattern PASSWORD_PATTERN =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*\d)(?=.*?[!@#\$&*~€£%\^\(\)\-_=;:,<>\.\[\]\+\{\}\\]).{8,}$';

/// Regex per indirizzo email
const Pattern EMAIL_PATTERN =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

const int FORM_TYPE_LOGIN = 0;
const int FORM_TYPE_REGISTRATION = 1;

class LoginDataModel {
  final String username;
  final String password;

  LoginDataModel({@required this.username, @required this.password});
}

class RegistrationDataModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final String zipCode;
  final String municipality; // comune
  final ProvinceModel province; // provincia
  final String password;
  final String passwordConfirm;

  RegistrationDataModel(
      {@required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.phone,
      @required this.address,
      @required this.zipCode,
      @required this.municipality,
      @required this.province,
      @required this.password,
      @required this.passwordConfirm});
}

class ProvinceModel {
  final String code;
  final String name;

  ProvinceModel({@required this.code, @required this.name});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      code: json['sigla'],
      name: json['nome'],
    );
  }
}

typedef LoginFormValidatedCallback = Function(LoginDataModel);
typedef RegistrationFormValidatedCallback = Function(RegistrationDataModel);

class RegistrationFormWidget extends StatefulWidget {
  final int formType;
  final String fieldFirstNameInitialValue;
  final String fieldLastNameInitialValue;
  final String fieldPhoneInitialValue;
  final String fieldEmailInitialValue;
  final String fieldAddressInitialValue;
  final String fieldZipcodeInitialValue;
  final String fieldMunicipalityInitialValue;
  final String fieldProvinceInitialValue;
  final String errorMessageEmptyField;
  final String errorMessagePasswordInvalidFormat;
  final String errorMessagePhoneInvalidFormat;
  final String errorMessagePasswordConfirmMismatch;
  final String errorMessageEmailInvalidFormat;
  final String errorMessagePrivacyNotAccepeted;
  final String passwordCriteriaText;
  final String labelUsername;
  final String labelFirstName;
  final String labelLastName;
  final String labelEmail;
  final String labelPhone;
  final String labelPassword;
  final String labelPasswordConfirm;
  final String labelProvince;
  final String labelAddress;
  final String labelZipcode;
  final String labelMunicipality;
  final LoginFormValidatedCallback onLoginFormValidated;
  final RegistrationFormValidatedCallback onRegistrationFormValidated;

  const RegistrationFormWidget({
    Key key,
    @required this.formType,
    @required this.onLoginFormValidated,
    @required this.onRegistrationFormValidated,
    this.fieldFirstNameInitialValue = "",
    this.fieldLastNameInitialValue = "",
    this.fieldPhoneInitialValue = "",
    this.fieldEmailInitialValue = "",
    this.fieldAddressInitialValue = "",
    this.fieldZipcodeInitialValue = "",
    this.fieldMunicipalityInitialValue = "",
    this.fieldProvinceInitialValue = "",
    this.errorMessageEmptyField = "",
    this.errorMessagePasswordInvalidFormat = "",
    this.errorMessagePhoneInvalidFormat = "",
    this.errorMessagePasswordConfirmMismatch = "",
    this.errorMessageEmailInvalidFormat = "",
    this.errorMessagePrivacyNotAccepeted = "",
    this.passwordCriteriaText = "",
    this.labelUsername = "",
    this.labelFirstName = "",
    this.labelLastName = "",
    this.labelPhone = "",
    this.labelEmail = "",
    this.labelPassword = "",
    this.labelPasswordConfirm = "",
    this.labelProvince = "",
    this.labelAddress = "",
    this.labelZipcode = "",
    this.labelMunicipality = "",
  }) : super(key: key);

  @override
  _RegistrationFormWidgetState createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode;
  int _formType;
  String _loginUsernameValue = "";
  String _loginPasswordValue = "";
  String _fieldFirstNameValue = "";
  String _fieldLastNameValue = "";
  String _fieldPhoneValue = "";
  String _fieldEmailValue = "";
  String _fieldAddressValue = "";
  String _fieldZipCodeValue = "";
  String _fieldMunicipalityValue = "";
  ProvinceModel _fieldProvinceValue;
  String _fieldPasswordValue = "";
  String _fieldPasswordConfirmValue = "";
  Future<List<ProvinceModel>> provinceList;

  @override
  void initState() {
    super.initState();

    _autovalidateMode = AutovalidateMode.disabled;
    _formType = widget.formType;

    provinceList = _fetchProvinceList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /// FORM START
          Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                /// Login - Username
                if (_formType == FORM_TYPE_LOGIN)
                  new TextFormField(
                    key: Key("login_input_username"),
                    decoration:
                        InputDecoration(labelText: widget.labelUsername),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateNotBlank,
                    onSaved: (String val) {
                      _loginUsernameValue = val;
                    },
                  ),

                /// Login - Password
                if (_formType == FORM_TYPE_LOGIN)
                  new TextFormField(
                    key: Key("login_input_password"),
                    decoration:
                        InputDecoration(labelText: widget.labelPassword),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: _validateNotBlank,
                    onSaved: (String val) {
                      _loginPasswordValue = val;
                    },
                  ),

                /// Registration - Firstname
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration:
                        InputDecoration(labelText: widget.labelFirstName),
                    key: Key("firstname"),
                    initialValue: widget.fieldFirstNameInitialValue,
                    keyboardType: TextInputType.text,
                    validator: _validateNotBlank,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldFirstNameValue = val;
                    },
                  ),

                /// Registration - Lastname
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration:
                        InputDecoration(labelText: widget.labelLastName),
                    key: Key("lastname"),
                    initialValue: widget.fieldLastNameInitialValue,
                    keyboardType: TextInputType.text,
                    validator: _validateNotBlank,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldLastNameValue = val;
                    },
                  ),

                /// Registration - Phone
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration: InputDecoration(labelText: widget.labelPhone),
                    key: Key("phone"),
                    keyboardType: TextInputType.phone,
                    initialValue: widget.fieldPhoneInitialValue,
                    validator: _validatePhone,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldPhoneValue = val;
                    },
                  ),

                /// Registration - Email
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration: InputDecoration(labelText: widget.labelEmail),
                    key: Key("email"),
                    initialValue: widget.fieldEmailInitialValue,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldEmailValue = val;
                    },
                  ),

                /// Registration - Address
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration: InputDecoration(labelText: widget.labelAddress),
                    key: Key("address"),
                    initialValue: widget.fieldAddressInitialValue,
                    keyboardType: TextInputType.streetAddress,
                    validator: _validateNotBlank,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldAddressValue = val;
                    },
                  ),

                /// Registration - Zip code
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration: InputDecoration(labelText: widget.labelZipcode),
                    key: Key("zipcode"),
                    initialValue: widget.fieldZipcodeInitialValue,
                    keyboardType: TextInputType.text,
                    validator: _validateNotBlank,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldZipCodeValue = val;
                    },
                  ),

                /// Registration - Municypality
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration:
                        InputDecoration(labelText: widget.labelMunicipality),
                    key: Key("municipality"),
                    initialValue: widget.fieldMunicipalityInitialValue,
                    keyboardType: TextInputType.text,
                    validator: _validateNotBlank,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldMunicipalityValue = val;
                    },
                  ),

                /// Registration - Provincia
                if (_formType == FORM_TYPE_REGISTRATION)
                  FormField<ProvinceModel>(
                    builder: (FormFieldState<ProvinceModel> state) {
                      return FutureBuilder(
                        future: provinceList,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ProvinceModel>> snapshot) {
                          if (snapshot.data == null) {
                            return Container();
                          }

                          _fieldProvinceValue = _provinceLookup(
                              snapshot.data, widget.fieldProvinceInitialValue);

                          return InputDecorator(
                            decoration:
                                InputDecoration(hintText: widget.labelProvince),
                            isEmpty: _fieldProvinceValue == null,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<ProvinceModel>(
                                value: _fieldProvinceValue,
                                isDense: true,
                                onChanged: (ProvinceModel newValue) {
                                  setState(() {
                                    _fieldProvinceValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: snapshot.data.map((ProvinceModel value) {
                                  return DropdownMenuItem<ProvinceModel>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                /// Registration - Password
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration:
                        InputDecoration(labelText: widget.labelPassword),
                    key: Key("password"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: _validatePassword,
                    textInputAction: TextInputAction.next,
                    onSaved: (String val) {
                      _fieldPasswordValue = val;
                    },
                    onChanged: (String val) {
                      _fieldPasswordValue = val;
                    },
                  ),
                if (_formType == FORM_TYPE_REGISTRATION &&
                    widget.passwordCriteriaText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.passwordCriteriaText,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),

                /// Registration - Password Confirm
                if (_formType == FORM_TYPE_REGISTRATION)
                  new TextFormField(
                    decoration:
                        InputDecoration(labelText: widget.labelPasswordConfirm),
                    key: Key("password_confirm"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: _validatePasswordConfirm,
                    textInputAction: TextInputAction.done,
                    onSaved: (String val) {
                      _fieldPasswordConfirmValue = val;
                    },
                  ),

                Container(height: 24),
                // Privacy checkboxes
                _CheckboxFormField(
                  title: _LinkWidget(
                      url: "https://www.google.it/",
                      title: "Terms and Conditions"),
                  context: context,
                  validator: _validateCheckboxChecked,
                  autovalidateMode: _autovalidateMode,
                ),
                _CheckboxFormField(
                  title: _LinkWidget(
                      url: "https://www.google.it/", title: "Privacy Policy"),
                  context: context,
                  validator: _validateCheckboxChecked,
                  autovalidateMode: _autovalidateMode,
                ),
                _CheckboxFormField(
                  title: _LinkWidget(
                      url: "htwww.google.it/", title: "Cookie Policy"),
                  context: context,
                  validator: _validateCheckboxChecked,
                  autovalidateMode: _autovalidateMode,
                ),
              ],
            ),
          ),

          /// FORM END

          /// SUBMIT BUTTONS
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: getFirstButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: getSecondButton(),
          ),
        ],
      ),
    );
  }

  Widget getFirstButton() {
    if (_formType == FORM_TYPE_LOGIN) {
      return getLoginButton();
    } else {
      return getRegistrationButton();
    }
  }

  Widget getSecondButton() {
    if (_formType == FORM_TYPE_LOGIN) {
      return getRegistrationButton();
    } else {
      return getLoginButton();
    }
  }

  /// Build login button
  Widget getLoginButton() {
    Color buttonColor =
        _formType == FORM_TYPE_LOGIN ? Colors.blueAccent : Colors.white;
    Color textColor =
        _formType == FORM_TYPE_LOGIN ? Colors.white : Colors.blueAccent;
    return _RegistrationButton(
      text: "LOGIN",
      key: Key("login"),
      buttonColor: buttonColor,
      textColor: textColor,
      onPressed: () {
        if (_formType == FORM_TYPE_LOGIN) {
          if (_validateInputs()) {
            widget.onLoginFormValidated.call(LoginDataModel(
                username: _loginUsernameValue, password: _loginPasswordValue));
          }
        } else {
          setState(() {
            _formType = FORM_TYPE_LOGIN;
          });
        }
      },
    );
  }

  /// Build registration button
  Widget getRegistrationButton() {
    Color buttonColor =
        _formType == FORM_TYPE_REGISTRATION ? Colors.blueAccent : Colors.white;
    Color textColor =
        _formType == FORM_TYPE_REGISTRATION ? Colors.white : Colors.blueAccent;
    return _RegistrationButton(
      text: "SIGNUP",
      key: Key("signup"),
      buttonColor: buttonColor,
      textColor: textColor,
      onPressed: () {
        if (_formType == FORM_TYPE_REGISTRATION) {
          if (_validateInputs()) {
            widget.onRegistrationFormValidated.call(RegistrationDataModel(
                firstName: _fieldFirstNameValue,
                lastName: _fieldLastNameValue,
                email: _fieldEmailValue,
                phone: _fieldPhoneValue,
                password: _fieldPasswordValue,
                passwordConfirm: _fieldPasswordConfirmValue,
                address: _fieldAddressValue,
                zipCode: _fieldZipCodeValue,
                municipality: _fieldMunicipalityValue,
                province: _fieldProvinceValue));
          }
        } else {
          setState(() {
            _formType = FORM_TYPE_REGISTRATION;
          });
        }
      },
    );
  }

  bool _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
      return false;
    }
  }

  String _validateNotBlank(String value) {
    if (value == null || value.length < 1)
      return widget.errorMessageEmptyField;
    else
      return null;
  }

  String _validatePassword(String value) {
    if (value == null || value.length < 1) {
      return widget.errorMessageEmptyField;
    } else if (!_validatePasswordPattern(value)) {
      return widget.errorMessagePasswordInvalidFormat;
    } else {
      return null;
    }
  }

  String _validatePhone(String value) {
    if (value == null || value.length < 9)
      return widget.errorMessagePhoneInvalidFormat;
    else
      return null;
  }

  String _validatePasswordConfirm(String value) {
    if (value == null || value != _fieldPasswordValue)
      return widget.errorMessagePasswordConfirmMismatch;
    else
      return null;
  }

  String _validateEmail(String value) {
    if (!_validateEmailPattern(value))
      return widget.errorMessageEmailInvalidFormat;
    else
      return null;
  }

  String _validateCheckboxChecked(bool value) {
    if (value) {
      return null;
    } else {
      return widget.errorMessagePrivacyNotAccepeted;
    }
  }

  bool _validatePasswordPattern(String password) {
    var regex = new RegExp(PASSWORD_PATTERN);
    return regex.hasMatch(password);
  }

  bool _validateEmailPattern(String password) {
    var regex = new RegExp(EMAIL_PATTERN);
    return regex.hasMatch(password);
  }

  ProvinceModel _provinceLookup(
      List<ProvinceModel> data, String fieldProvinceInitialValue) {
    return data
        .firstWhere((province) => province.code == fieldProvinceInitialValue);
  }
}

class _CheckboxFormField extends FormField<bool> {
  _CheckboxFormField(
      {Widget title,
      @required BuildContext context,
      FormFieldSetter<bool> onSaved,
      FormFieldValidator<bool> validator,
      bool initialValue = false,
      @required AutovalidateMode autovalidateMode})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: title,
                value: state.value,
                onChanged: state.didChange,
                subtitle: state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(color: Theme.of(context).errorColor),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              );
            });
}

class _LinkWidget extends StatelessWidget {
  final String title;
  final String url;

  const _LinkWidget({Key key, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _launchURL(url),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(decoration: TextDecoration.underline),
        ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}

Future<List<ProvinceModel>> _fetchProvinceList() async {
  var data = await rootBundle.loadString("assets/province.json");
  Iterable<dynamic> list = jsonDecode(data);
  return list.map((e) => ProvinceModel.fromJson(e)).toList();
}

class _RegistrationButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const _RegistrationButton(
      {Key key, this.text, this.buttonColor, this.textColor, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: buttonColor)),
        onPressed: onPressed,
        color: buttonColor,
        textColor: textColor,
        child: Text(text.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(fontSize: 15, color: textColor)),
      ),
    );
  }
}
