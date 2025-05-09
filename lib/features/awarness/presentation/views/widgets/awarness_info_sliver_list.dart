import 'package:blood_bank/features/awarness/presentation/views/widgets/awarness_info_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/blood_awarness_info_model.dart';

class AwarnessInfoSliverList extends StatelessWidget {
  const AwarnessInfoSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: bloodAwarenessInfoList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AwarnessInfoItem(
            bloodAwarmessInfoModel: bloodAwarenessInfoList[index],
          ),
        );
      },
    );
  }
}
