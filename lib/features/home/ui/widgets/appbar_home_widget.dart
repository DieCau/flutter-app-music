import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app_music/features/home/ui/delegate/search_music_delegate.dart';
import 'package:app_music/shared/constants/app_color.dart';
import 'package:app_music/shared/constants/svg_icons.dart';

class AppbarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, kToolbarHeight, 0, 0),
      height: preferredSize.height,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenido de Nuevo!",
                style: textTheme.bodyMedium,
              ),
              Text(
                "Cómo te sientes hoy?",
                style: textTheme.displayMedium,
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            child: SvgPicture.asset(
              IconSvg.search,
              height: 30,
              colorFilter: const ColorFilter.mode(
                AppColors.greyTown,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
