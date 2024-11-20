import 'package:eduplan/admin/features/home/domain/entities/class_model.dart';
import 'package:eduplan/admin/features/home/presentation/cubit/home_cubit.dart';
import 'package:eduplan/admin/features/home/presentation/widgets/admin_top_widget.dart';
import 'package:eduplan/admin/features/home/presentation/widgets/class_list_widget.dart';
import 'package:eduplan/admin/features/home/presentation/widgets/create_class_widget.dart';
import 'package:eduplan/admin/features/home/presentation/widgets/service_widget.dart';
import 'package:eduplan/admin/features/home/presentation/widgets/teachers_widget.dart';
import 'package:eduplan/core/constants/app_constraints.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';
import 'package:eduplan/features/components/my_snakebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAdminHome extends StatefulWidget {
  const ScreenAdminHome({super.key});

  @override
  State<ScreenAdminHome> createState() => _ScreenAdminHomeState();
}

class _ScreenAdminHomeState extends State<ScreenAdminHome> {
  List<ClassModel> classes = [];
  List<Teacher> teachers = [];
  @override
  void initState() {
    super.initState();
    final classCubit = context.read<HomeCubit>();
    classCubit.fetchTeachers();
    classCubit.fetchClasses();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Principal',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              child: Icon(Icons.notifications_none),
            ),
          )
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is ClassesLoadedState) {
            classes = state.classes;
          }
          if (state is AddClassesLoadedState) {
            mySnakeBar(context: context, title: 'Class created successfully.');
            final classCubit = context.read<HomeCubit>();
            classCubit.fetchClasses();
          }
          if (state is AddClassesFailedState) {
            mySnakeBar(context: context, title: state.msg);
          }
          if (state is TeachersLoadedState) {
            teachers = state.teacahers;
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: AdminTopWidget(
                  totalStudents: '1500',
                  totalTeachers: '50',
                ),
              ),
              SliverToBoxAdapter(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    ServiceWidget(
                      title: 'Create Class',
                      icon: Icons.meeting_room,
                      onPressed: () => showAdaptiveDialog(
                          context: context,
                          builder: (context) => const CreateClassWidget()),
                    ),
                    ServiceWidget(
                        title: 'Subjects',
                        icon: Icons.menu_book_rounded,
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/subjects')),
                    const ServiceWidget(
                      title: 'Announcement',
                      icon: Icons.campaign,
                    ), 
                    const ServiceWidget(
                      title: 'Meetings',
                      icon: Icons.event,
                    ),
                    const ServiceWidget(
                      title: 'Add About',
                      icon: Icons.school,
                    ),
                    const ServiceWidget(
                      title: 'Leave letters',
                      icon: Icons.file_copy_sharp,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: state is TeachersLoadingState
                    ? const SizedBox(
                        height: 200,
                        child: CircularProgressIndicator(),
                      )
                    : TeachersWidget(size: size, teachers: teachers),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Classes',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 5.0)),
              state is ClassesLoadingState || state is AddClassesLoadingState
                  ? const SliverToBoxAdapter(
                      child: Column(
                        children: [
                          AppConstraints.mHeight,
                          CircularProgressIndicator(),
                        ],
                      ),
                    )
                  : classes.isEmpty
                      ? const SliverToBoxAdapter(
                          child: Column(
                            children: [
                              AppConstraints.mHeight,
                              Text('No Classes Found'),
                            ],
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final myClass = classes[index];
                              return ClassListWidget(
                                  className: myClass.className,
                                  division: myClass.division,
                                  index: index.toString());
                            },
                            childCount: classes.length,
                          ),
                        ),
            ],
          );
        },
      ),
    );
  }
}
