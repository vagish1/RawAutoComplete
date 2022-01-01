import 'package:flutter/material.dart';
import 'package:flutter_course/user_mode.dart';

class AutoComplete extends StatefulWidget {
  const AutoComplete({Key? key}) : super(key: key);

  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _node = FocusNode();

  List<UserModel> allUserModelModel = [
    UserModel(
      name: 'Vishal Pathak',
      profilePhoto:
          'https://images.unsplash.com/photo-1519764622345-23439dd774f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'yoyovishalpathak2004@gmail.com',
    ),
    UserModel(
      name: 'Jhon Doe',
      profilePhoto:
          'https://images.unsplash.com/photo-1613940102159-1e7a40f2b60e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'doe@jhon.com',
    ),
    UserModel(
      name: 'Ramesh Kumar',
      profilePhoto:
          'https://images.unsplash.com/photo-1530648648507-b9056726849a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'kumarramesh@gmail.com',
    ),
    UserModel(
      name: 'Google',
      profilePhoto:
          'https://images.unsplash.com/photo-1482849737880-498de71dda8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=394&q=80',
      email: 'google@gmail.com',
    ),
    UserModel(
      name: 'Divyanka Shrivastav',
      profilePhoto:
          'https://images.unsplash.com/photo-1519764622345-23439dd774f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'Shrivastav@yahoo.com',
    ),
    UserModel(
      name: 'Alex Whitman',
      profilePhoto:
          'https://images.unsplash.com/photo-1613940102159-1e7a40f2b60e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'Whitman@hotmail.com',
    ),
    UserModel(
      name: 'Dr. Rakesh Kumar',
      profilePhoto:
          'https://images.unsplash.com/photo-1530648648507-b9056726849a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      email: 'drrakeshkumar@outlook.com',
    ),
    UserModel(
      name: 'Er. Jhon Sena',
      profilePhoto:
          'https://images.unsplash.com/photo-1482849737880-498de71dda8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=394&q=80',
      email: 'erjhonsena@example.com',
    ),
  ];

  static String _displayBuildForOption(UserModel option) => option.name;
  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<UserModel>(
      textEditingController: _controller,
      focusNode: _node,
      optionsBuilder: (textEditingValue) {
        return allUserModelModel.where((element) =>
            element.toString().contains(textEditingValue.text.toLowerCase()));
      },
      displayStringForOption: _displayBuildForOption,
      optionsViewBuilder: (context, onSelected, options) {
        return Material(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(options.elementAt(index).profilePhoto),
              ),
              title: Text(options.elementAt(index).name),
              subtitle: Text(options.elementAt(index).email),
              onTap: () {
                onSelected(options.elementAt(index));
              },
            ),
            itemCount: options.length,
          ),
        );
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          onFieldSubmitted: (value) {
            onFieldSubmitted();
          },
          decoration: const InputDecoration(
            fillColor: Color(0xFFF2f2f2),
            filled: true,
            label: Text("Search by name or email"),
          ),
        );
      },
    );
  }
}
