import 'package:TeacherOnDemand/models/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';



class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {

  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  PhoneNumber phone = null;
  bool _userChecked = true, _teacherChecked = false;
 
  String initialCountry = 'ZA', role = '';
  PhoneNumber number = PhoneNumber(isoCode: 'ZA');
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child:Column(
          children: <Widget>[
               Card(
                    child: CheckboxListTile(
                    title: Text('User'),
                    secondary: const Icon(Icons.school),
                    value: _userChecked,
                    selected: _userChecked,
                    onChanged: (bool value) {
                      _teacherChecked = !value;
                    }, 
              )
              ),
              Card(
                    child: CheckboxListTile(
                    title: Text('Teacher'),
                    secondary: const Icon(Icons.people),
                    value: _teacherChecked,
                    selected: _teacherChecked,
                    onChanged: (bool value) {
                    _userChecked = value;
                    }
                    
              )
              ),

            TextFormField(
              validator: (input) {
          if (input.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
            controller: usernameController,
            decoration: InputDecoration( 
              labelText: 'Username',
            ),
              ),
        TextFormField(
          validator: (input) {
          if (input.isEmpty) {
                return 'Please enter a School name';
              }
              return null;
            },
          controller: schoolController,
          decoration: InputDecoration( 
            labelText: 'School',
          ),
        ),
        TextFormField(
          validator: (input) {
          if (input.isEmpty) {
                return 'Please enter an email address';
              }
              return null;
            },
          controller: emailController,
          decoration: InputDecoration( 
            labelText: 'Enter your email',
          ),
        ),
        
        //  InternationalPhoneNumberInput(
        //       onInputChanged: (PhoneNumber number) {
        //         print(number);
        //       },
        //       // onInputValidated: (bool value) {
        //       //   print(value);
        //       // },   
        //       //hintText: "072 033 0044",
        //       selectorConfig: SelectorConfig(
        //         selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        //       ),
        //       ignoreBlank: false,
        //       //autoValidateMode: AutovalidateMode.disabled,
        //       initialValue: number,
        //       formatInput: true,
        //       keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
        //       onSaved: (PhoneNumber number) {
        //         print('On Saved: $number');
        //         phone = number; 
        //         print(phone);  
        //       },
        //     ),
         TextFormField(
           validator: (input) {
          if (input.isEmpty) {
                return 'Please enter a Password';
              }
              return null;
            },
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration( 
            labelText: 'Enter your password',
          ),
         ),

       
         TextFormField(
          validator: (input) {
          if (input.isEmpty) {
                return 'Please renter your password';
              }
              return null;
            },
          obscureText: true,
          controller: repasswordController,
          decoration: InputDecoration( 
            labelText: 'Renter your password',
          ),
         ),
         RaisedButton(onPressed: (){ 
          if (_formKey.currentState.validate()) {
           context.read<AuthenticationService>().signUp(
             displayName: usernameController.text,
             role: role,
             school: schoolController.text,
             email: emailController.text,
             password: passwordController.text,
             context: context
           ); 
           }
         },
         child: Text("Sign Up"), 
         )

        ],
    ),
    )
    );
  }
}