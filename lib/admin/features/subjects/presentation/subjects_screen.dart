import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';
import 'package:eduplan/admin/features/subjects/presentation/cubit/subjects_cubit.dart';
import 'package:eduplan/features/components/app_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  final _subjectCtrl = TextEditingController();
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();

  List<SubjectModel> subjects = [];

  @override
  void initState() {
    super.initState();
    final authcubit = context.read<SubjectsCubit>();
    authcubit.fetchSubjects();
  }

  @override
  void dispose() {
    super.dispose();
    _subjectCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(
          'Subjects',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: BlocConsumer<SubjectsCubit, SubjectsState>(
        listener: (context, state) {
          if (state is SubjectsLoaded) {
            subjects = state.subjects ?? [];
          }
          if (state is AddSubjectSuccess) {
            final authcubit = context.read<SubjectsCubit>();
            authcubit.fetchSubjects();
          }
        },
        builder: (context, state) {
          if (state is SubjectsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SubjectsLoaded) {
            if (subjects.isEmpty) {
              return const Center(
                child: Text('No Subjects found'),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      tileColor: Theme.of(context).colorScheme.secondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      trailing: IconButton(
                          onPressed: () {
                            final authcubit = context.read<SubjectsCubit>();
                            authcubit.deleteSubject(subject.id);
                          },
                          icon: const Icon(Icons.delete_outline_outlined)),
                      title: Text(
                        subject.subject,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                },
                itemCount: subjects.length,
              );
            }
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Add a new Subject'),
                  titleTextStyle: Theme.of(context).textTheme.titleMedium!,
                  content: Form(
                    key: _dialogFormKey,
                    child: AppInputField(
                        hint: 'Subject',
                        icon: Icons.subject,
                        controller: _subjectCtrl),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (_dialogFormKey.currentState!.validate()) {
                            final authcubit = context.read<SubjectsCubit>();
                            authcubit.addSubject(_subjectCtrl.text.trim());
                            Navigator.pop(context);
                            _subjectCtrl.clear();
                          }
                        },
                        child: const Text('Create'))
                  ],
                ),
              )),
    );
  }
}
