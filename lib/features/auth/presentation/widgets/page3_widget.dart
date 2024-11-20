import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';
import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';
import 'package:eduplan/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:eduplan/features/auth/presentation/cubits/auth_states.dart';
import 'package:eduplan/features/components/app_button.dart';
import 'package:eduplan/features/components/my_snakebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page3 extends StatefulWidget {
  const Page3({
    super.key,
    required this.controller,
    required this.nameCtrl,
    required this.usernameCtrl,
    required this.contactCtrl,
    required this.passwordCtrl,
  });
  final PageController controller;
  final TextEditingController nameCtrl;
  final TextEditingController usernameCtrl;
  final TextEditingController contactCtrl;
  final TextEditingController passwordCtrl;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<SubjectModel> choices = [];
  Set<SubjectModel> selectedChoices = {};

  @override
  void initState() {
    super.initState();
    final authcubit = context.read<AuthCubit>();
    authcubit.fetchSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SubjectsLoaded) {
            choices = state.subjects ?? [];
          }
          if (state is AuthenticatedState) {
            mySnakeBar(
                context: context,
                title: 'Registration Form Submited Successfully!');
          }
          if (state is UnAuthenticatedState) {
            mySnakeBar(context: context, title: 'Registration Failed!');
          }
          if (state is AuthErrorState) {
            mySnakeBar(
                context: context,
                title: 'Registration Failed! Try again later');
          }
        },
        builder: (context, state) {
          return state is SubjectsLoading
              ? const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    Image.asset('assets/images/teacher_registration_4.jpg'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Please choose the subjects you handle in your classes.",
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          AppConstraints.smallH,
                          Wrap(
                            spacing: 10.0,
                            children: choices.map((choice) {
                              return ChoiceChip(
                                label: Text(choice.subject),
                                selected: selectedChoices.contains(choice),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedChoices.add(choice);
                                    } else {
                                      selectedChoices.remove(choice);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                          AppConstraints.smallH,
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  title: 'Submit',
                                  onTap: () async {
                                    await register().then(
                                      (value) => widget.controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }

  Future<void> register() async {
    final authcubit = context.read<AuthCubit>();
    final myChoices = selectedChoices.map((e) => e.subject).toList();
    final teacher = Teacher(
        uid: widget.usernameCtrl.text.replaceAll(' ', '') +
            widget.contactCtrl.text,
        name: widget.nameCtrl.text,
        userName: widget.usernameCtrl.text.replaceAll(' ', ''),
        contact: widget.contactCtrl.text,
        password: widget.passwordCtrl.text,
        subjects: myChoices);
    authcubit.register(teacher);
  }
}
