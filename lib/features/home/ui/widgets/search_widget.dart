import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_music/features/home/ui/bloc/search/search_bloc.dart';
import 'package:app_music/shared/constants/app_color.dart';
import 'package:app_music/shared/constants/svg_icons.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onChanged: (value) {
        context.read<SearchBloc>().add(SearchMusicEvent(request: value));
      },
      decoration: InputDecoration(
        hintText: 'Buscar canción, artista...',
        hintStyle: textTheme.displayMedium,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        filled: true,
        fillColor: AppColors.greyOne,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: SvgPicture.asset(
            IconSvg.search,
            height: 20,
            colorFilter: const ColorFilter.mode(
              AppColors.greyTown,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
