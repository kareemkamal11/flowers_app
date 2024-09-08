import 'package:flowers/core/app_styles.dart';
import 'package:flowers/core/assets_util.dart';
import 'package:flutter/material.dart';

class AppSearchWidget extends StatelessWidget {
  const AppSearchWidget({
    super.key,
    required this.onSearchTapped,
    required this.hintText,
    required this.suffinxIcon,
    required this.onSaved, required this.searchController,
  });

  final Function() onSearchTapped;
  final Function(dynamic) onSaved;

  final String hintText;
  final Widget suffinxIcon;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchFieldWidget(
            searchController: searchController,
            suffinxIcon: suffinxIcon,
            onSaved: (value) => onSaved(value),
            onSearchTapped: onSearchTapped,
            hintText: hintText,
          ),
        ),
        const SizedBox(width: 15),
        ButtonSearch(onSearchTapped: onSearchTapped),
      ],
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.suffinxIcon,
    required this.hintText,
    required this.onSaved,
    required this.onSearchTapped,
    required this.searchController,
  });

  final Function(dynamic) onSaved;
  final Function() onSearchTapped;
  final Widget? suffinxIcon;
  final String hintText;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: (value) => onSearchTapped, //
      onChanged: (value) => onSaved(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.hintStyle.copyWith(fontSize: 15),
        suffixIcon: suffinxIcon,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppStyles.mainColor),
        ),
      ),
    );
  }
}

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({
    super.key,
    required this.onSearchTapped,
  });

  final Function() onSearchTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSearchTapped,
      child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(1),
          decoration: ShapeDecoration(
            color: AppStyles.secondaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          child: Image.asset(
            AssetsUtil.searchIcon,
            width: 20,
            height: 20,
          )),
    );
  }
}
