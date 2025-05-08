import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../bloc/home_event.dart';
import '../../../bloc/mentors/mentors_bloc.dart';
import '../../../bloc/mentors/mentors_state.dart';
import '../../../widgets/chats_wg.dart';

class MentorsPage extends StatefulWidget {
  const MentorsPage({super.key});

  @override
  State<MentorsPage> createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MentorBloc>().add(GetMentors(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Top Mentors',
          style: TextStyle(fontSize: 25.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
        child: BlocBuilder<MentorBloc, MentorState>(
          builder: (context, state) {
            if (state is MentorLoading) {
              return const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: [Colors.blueAccent],
                    strokeWidth: 2,
                  ),
                ),
              );
            } else if (state is MentorLoaded) {
              final mentors = state.mentors.results;
              return ListView.builder(
                itemCount: mentors.length,
                itemBuilder: (BuildContext context, int index) {
                  final mentor = mentors[index];
                  return ChatsWidget(
                    imagePath: mentor.avatarUrl ?? 'Null',
                    name: mentor.fullName,
                    jobTitle: mentor.expertiseDisplay,
                  );
                },
              );
            } else if (state is MentorError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
