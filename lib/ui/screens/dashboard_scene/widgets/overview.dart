import 'package:flutter/material.dart';

import '../../../../utils/app_constants.dart';
import '../../../../utils/app_padding.dart';
import '../../../widgets/section_title.dart';
import '../../../../utils/app_colors.dart';
import 'overview_tabs.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.padding),
      decoration:   BoxDecoration(
        
      color: Theme.of(context).cardColor,
        borderRadius:
            BorderRadius.all(Radius.circular(AppConstants.borderRadius)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SectionTitle(title: "Overview"),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppConstants.borderRadius)),
                  border: Border.all(width: 2, color: AppColors.highlightLight),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.padding, vertical: 0),
                  style: Theme.of(context).textTheme.labelLarge,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppConstants.borderRadius)),
                  underline: const SizedBox(),
                  value: "All time",
                  items: const [
                    DropdownMenuItem(
                      value: "All time",
                      child: Text("All time"),
                    ),
                    DropdownMenuItem(
                      value: "This year",
                      child: Text("This year"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          AppPadding.paddingH24,
          const OverviewTabs(),
        ],
      ),
    );
  }
}
