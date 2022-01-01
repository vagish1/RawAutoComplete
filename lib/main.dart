import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24.0),
          child: AutoComplete(),
        ),
      ),
    );
  }
}

class AutoComplete extends StatefulWidget {
  const AutoComplete({Key? key}) : super(key: key);

  @override
  State<AutoComplete> createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  final List<Users> optionListMap = [
    Users(
      name: 'Vishal Pathak',
      profilePhoto:
          'https://images.unsplash.com/photo-1519764622345-23439dd774f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'yoyovishalpathak2004@gmail.com',
    ),
    Users(
      name: 'Jhon Doe',
      profilePhoto:
          'https://images.unsplash.com/photo-1613940102159-1e7a40f2b60e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'doe@jhon.com',
    ),
    Users(
      name: 'Ramesh Kumar',
      profilePhoto:
          'https://images.unsplash.com/photo-1530648648507-b9056726849a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'kumarramesh@gmail.com',
    ),
    Users(
      name: 'Google',
      profilePhoto:
          'https://images.unsplash.com/photo-1482849737880-498de71dda8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=394&q=80',
      email: 'google@gmail.com',
    ),
    Users(
      name: 'Divyanka Shrivastav',
      profilePhoto:
          'https://images.unsplash.com/photo-1519764622345-23439dd774f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'Shrivastav@yahoo.com',
    ),
    Users(
      name: 'Alex Whitman',
      profilePhoto:
          'https://images.unsplash.com/photo-1613940102159-1e7a40f2b60e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'Whitman@hotmail.com',
    ),
    Users(
      name: 'Dr. Rakesh Kumar',
      profilePhoto:
          'https://images.unsplash.com/photo-1530648648507-b9056726849a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'drrakeshkumar@outlook.com',
    ),
    Users(
      name: 'Er. Jhon Sena',
      profilePhoto:
          'https://images.unsplash.com/photo-1482849737880-498de71dda8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=394&q=80',
      email: 'erjhonsena@example.com',
    ),
  ];
  final TextEditingController controller = TextEditingController();
  final FocusNode _node = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    _node.dispose();
    super.dispose();
  }

  static String _displayStringForOption(Users option) => option.name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return RawAutocomplete<Users>(
        optionsBuilder: (textEditingValue) {
          return optionListMap.where((element) =>
              element.toString().contains(textEditingValue.text.toLowerCase()));
        },
        displayStringForOption: _displayStringForOption,
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 16.0),
              width: constraint.maxWidth,
              height: 105.0 * options.length,
              child: Material(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  itemBuilder: (_, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(options.elementAt(index).profilePhoto),
                      ),
                      title: Text(options.elementAt(index).name),
                      subtitle: Text(options.elementAt(index).email),
                      onTap: () {
                        onSelected(options.elementAt(index));
                      },
                    );
                  },
                  itemCount: options.length,
                ),
              ),
            ),
          );
        },
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (val) {
              onFieldSubmitted();
            },
            decoration: const InputDecoration(
              label: Text("Search by name or type email"),
              // border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xFFF2f2f2),
              prefixIcon: Padding(
                child: CircleAvatar(
                  radius: 16.0,
                  child: Icon(
                    Icons.search,
                    size: 14,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          );
        },
        textEditingController: controller,
        focusNode: _node,
      );
    });
  }
}

class Users {
  final String name;
  final String profilePhoto;
  final String email;

  Users({
    required this.name,
    required this.profilePhoto,
    required this.email,
  });

  @override
  String toString() {
    return '$name, $email'.toLowerCase();
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Users && other.email == email && other.name == name;
  }

  @override
  int get hashCode => hashValues(email, name);
}
