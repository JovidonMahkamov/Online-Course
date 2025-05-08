import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../domain/entities/sections.dart';

class CourseLessonWidget extends StatelessWidget {
  final List<Section> section;

  const CourseLessonWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: section.length,
      itemBuilder: (context, sectionIndex) {
        final currentSection = section[sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentSection.title,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: (18),
                  ),
                ),
                Text(
                  "${currentSection.lessons.length} lessons",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: (16),
                  ),
                ),
              ],
            ),
            SizedBox(height: (12)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currentSection.lessons.length,
              itemBuilder: (context, lessonIndex) {
                final lesson = currentSection.lessons[lessonIndex];
                return Container(
                  margin: EdgeInsets.only(bottom: (12)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: (12),
                        offset: Offset(0, (4)),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: (24),
                      child: Text(
                        "${lessonIndex + 1}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: (18),
                        ),
                      ),
                    ),
                    title: Text(
                      lesson.title,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: (18),
                      ),
                    ),
                    subtitle: Text(
                      lesson.videoUrl != null ? "Video lesson" : "Text content",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: (16),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        if (lesson.videoUrl != null) {
                          // Navigator.push(...);
                        }
                      },
                      child: Icon(
                        lesson.videoUrl == null
                            ? IconlyLight.lock
                            : IconlyBold.play,
                        size: (28),
                        color:
                        lesson.videoUrl == null
                            ? Colors.grey[500]
                            : Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
