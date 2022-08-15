import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:signup_page/homepage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {




  
  TextEditingController firstC = TextEditingController();
  TextEditingController lasttC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswrdC = TextEditingController();
  TextEditingController datepickC = TextEditingController();

  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String confirmpass = '';

  bool isvisiblep = true;
  bool isvisiblepc = true;

  final _formkey = GlobalKey<FormState>();

  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  int _value = 1;
  setSelectedRadioTile(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textfield(
                      (value) {
                        setState(() {
                          firstname = value;
                        });
                      },
                      (val) {
                        if (val.isEmpty || val == null) {
                          return "First name can't be empty";
                        }
                      },
                      firstC,
                      "First Name",
                      false,
                      Container(
                        height: 5,
                        width: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textfield(
                      (value) {
                        setState(() {
                          lastname = value;
                        });
                      },
                      (val) {
                        if (val.isEmpty || val == null) {
                          return "Last name can't be empty";
                        }
                      },
                      lasttC,
                      "Last Name",
                      false,
                      Container(
                        height: 5,
                        width: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textfield(
                      (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      (val) {
                        if (val.isEmpty) {
                          return "Email badly formated";
                        } else if (!val.contains("@gmail.com")) {
                          return "Email badly formated";
                        }
                      },
                      emailC,
                      "Email",
                      false,
                      Container(
                        height: 5,
                        width: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textfield(
                      (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      (val) {
                        if (val == null) {
                          return "Password can't be empty";
                        }
                      },
                      passwordC,
                      "Password",
                      isvisiblep,
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isvisiblep = !isvisiblep;
                          });
                        },
                        icon: Icon(isvisiblep
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textfield(
                      (value) {
                        setState(() {
                          confirmpass = value;
                        });
                      },
                      (val) {
                        if (val.isEmpty) {
                          return "Please re-enter password";
                        } else if (passwordC.text != confirmPasswrdC.text) {
                          return "Password should be same as above";
                        }
                      },
                      confirmPasswrdC,
                      "Confirm Password",
                      isvisiblepc,
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isvisiblepc = !isvisiblepc;
                          });
                        },
                        icon: Icon(
                          isvisiblepc ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DateTimePicker(
                      autovalidate: true,
                      controller: datepickC,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.event),
                        hintText: "dd,MM,yyyy",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      type: DateTimePickerType.date,
                      dateMask: 'd MMM, yyyy',
                      firstDate: DateTime(2000),
                      dateHintText: 'd,MM, yyyy',
                      lastDate: DateTime(2100),
                      selectableDayPredicate: (date) {
                        if (date.weekday == 6 || date.weekday == 7) {
                          return false;
                        }

                        return true;
                      },
                      onChanged: (val) {
                        print(val);
                        datepickC.text = val;
                      },
                      validator: (val) {
                        print(val);
                        if (val!.isEmpty) {
                          return "Date can't be empty";
                        }

                        return null;
                      },
                      onSaved: (val) => print(val),
                    ),
                  ),
                  DropdownButton(
                    value: _value,
                    items: const [
                      DropdownMenuItem(
                        child: Text("1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("4"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("5"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("6"),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("7"),
                        value: 7,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                      });
                    },
                    hint: const Text('No of siblings'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: RadioListTile(
                          value: 1,
                          groupValue: selectedRadio,
                          title: const Text("Male"),
                          onChanged: (val) {
                            print("Radio Tile pressed $val");
                            setSelectedRadioTile(val);
                          },
                          selected: true,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: RadioListTile(
                          value: 2,
                          groupValue: selectedRadio,
                          title: const Text("Female"),
                          onChanged: (val) {
                            print("Radio Tile pressed $val");
                            setSelectedRadioTile(val);
                          },
                          selected: false,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              // fname: firstname,
                              // lname: lastname,
                              // email: email,
                              // password: password,
                              // confirmpass: confirmpass,
                              // datePick: datepickC.text,
                            ),
                          ),
                        );
                      }
                      return;
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField textfield(
    var onchanged,
    var val,
    var controller,
    String? hintText,
    bool? visible,
    Widget? suffixicon1,
  ) {
    return TextFormField(
      obscureText: visible!,
      onChanged: onchanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.words,
      validator: val,
      controller: controller,
      decoration: InputDecoration(
        suffixIconColor: Colors.red,
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10)),
        suffixIcon: suffixicon1!,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
