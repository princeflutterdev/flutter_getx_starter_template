// ignore_for_file: no_wildcard_variable_uses

import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/validators.dart';

class CustomCheckboxWidget extends FormField<bool> {
  CustomCheckboxWidget({
    super.key,
    required bool value,
    required FormFieldSetter<bool> super.onSaved,
    required Widget titleWidget,
  }) : super(
          initialValue: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) => Validators.validateCheckbox(v: v!),
          builder: (state) {
            return CheckboxListTile(
              dense: state.hasError,
              value: state.value,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: state.didChange,
              title: titleWidget,
              subtitle: state.hasError
                  ? Builder(
                      builder: (_) => Text(
                        state.errorText!,
                        style: TextStyle(color: Theme.of(_).colorScheme.error),
                      ),
                    )
                  : null,
            );
          },
        );
}
