import 'package:eduplan/admin/features/home/domain/entities/class_model.dart';
import 'package:eduplan/admin/features/home/presentation/cubit/home_cubit.dart';
import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/components/app_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateClassWidget extends StatefulWidget {
  const CreateClassWidget({super.key});

  @override
  State<CreateClassWidget> createState() => _CreateClassWidgetState();
}

class _CreateClassWidgetState extends State<CreateClassWidget> {
  final _classCtrl = TextEditingController();
  final _divisionCtrl = TextEditingController();
  final List<String> defultClasses = List.generate(
    10,
    (index) => '${index + 1}',
  );
  final List<String> defaultDivisions = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );
  String? selectedValue;
  @override
  void dispose() {
    super.dispose();
    _classCtrl.dispose();
    _divisionCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new Class'),
      titleTextStyle: Theme.of(context).textTheme.titleMedium!,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppInputField(
            hint: 'Class',
            icon: Icons.subject,
            controller: _classCtrl,
            isReadOnly: true,
            onTap: () => _showDropdown(
                context: context,
                classes: defultClasses,
                controller: _classCtrl),
          ),
          AppConstraints.verySmallH,
          AppInputField(
            hint: 'Division',
            icon: Icons.abc,
            controller: _divisionCtrl,
            isReadOnly: true,
            onTap: () => _showDropdown(
                context: context,
                classes: defaultDivisions,
                controller: _divisionCtrl),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              final classData = ClassModel(
                  id: DateTime.now().toString(),
                  className: _classCtrl.text,
                  division: _divisionCtrl.text,
                  classTeacher: '',
                  subjects: <String>[],
                  teachers: <String>[],
                  students: <String, List<String>>{});
              final classCubit = context.read<HomeCubit>();
              classCubit.addSubject(classData);
              Navigator.pop(context);
            },
            child: const Text('Create')),
      ],
    );
  }

  void _showDropdown(
      {required BuildContext context,
      required List<String> classes,
      required TextEditingController controller}) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
          ),
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedValue = classes[index];
                  controller.text = selectedValue!;
                });
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  classes[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
