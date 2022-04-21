import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../provider/2team/teams_provider.dart';

class CustomTextInputFieldWidget extends StatefulWidget {
  CustomTextInputFieldWidget({
    Key? key,
    required this.id,
    required this.initialValue,
    required this.value,
    required this.lableText,
  }) : super(key: key);

  final int id;
  final String initialValue;
  final String? value;
  final String lableText;

  final _fieldFocusNode = FocusNode();

  final _valueController = TextEditingController();

  @override
  State<CustomTextInputFieldWidget> createState() =>
      _CustomTextInputFieldWidgetState();
}

class _CustomTextInputFieldWidgetState
    extends State<CustomTextInputFieldWidget> {
  @override
  void didChangeDependencies() {
    widget._valueController.text = widget.value ?? widget.initialValue;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TeamsProvider teamsData = Provider.of<TeamsProvider>(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(35, 60, 128, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 50,
            child: TextFormField(
                focusNode: widget._fieldFocusNode,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textInputAction: TextInputAction.send,
                controller: widget._valueController,
                onTap: () {
                  setState(() {
                    widget._fieldFocusNode.requestFocus();
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38)),
                  label: Text(widget.lableText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      )),
                ),
                onFieldSubmitted: (value) {
                  setState(() {
                    teamsData.updateName(widget.id, value);
                  });
                }),
          ),
          widget._fieldFocusNode.hasFocus
              ? IconButton(
                  icon: const Icon(
                    Icons.save,
                    color: Colors.green,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      teamsData.updateName(
                          widget.id, widget._valueController.text);

                      widget._fieldFocusNode.unfocus();
                    });
                  },
                )
              : const Gap(0)
        ],
      ),
    );
  }
}
