import 'package:archipelagointernational/app/cubit/app_cubit.dart';
import 'package:archipelagointernational/app/widget/app_button.dart';
import 'package:archipelagointernational/injection/injection.dart';
import 'package:archipelagointernational/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 1));

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchField(
          prefixIcon: Icons.location_on_outlined,
          postfixIcon: Icons.my_location,
          hint: "Where are you going?",
          child: textField(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32),
          child: Divider(color: gray500),
        ),
        const SizedBox(
          height: 16,
        ),
        searchField(
          prefixIcon: Icons.calendar_month_outlined,
          hint: "Check-in Date",
          child: Text(
            convertDate(startDate, endDate),
            style: fontH(14),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32),
          child: Divider(color: gray500),
        ),
        const SizedBox(
          height: 16,
        ),
        AppButton(
          title: "Search",
          onTap: () {
            getIt<AppCubit>().search(controller.text);
          },
        ),
      ],
    );
  }

  String convertDate(DateTime startDate, DateTime endDate) {
    final formatter = DateFormat('EE, dd MMM yyyy');
    final nights = endDate.difference(startDate).inDays;
    return "${formatter.format(startDate)} - ${formatter.format(endDate)}, $nights Night(s)";
  }

  Widget searchField({
    required IconData prefixIcon,
    IconData? postfixIcon,
    required String hint,
    required Widget child,
  }) {
    return Row(
      children: [
        Icon(
          prefixIcon,
          color: pink,
          size: 24,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hint,
                style: fontR(14, color: Colors.grey[400]),
              ),
              // const SizedBox(
              //   height: 4,
              // ),
              child,
            ],
          ),
        ),
        if (postfixIcon != null)
          const SizedBox(
            width: 16,
          ),
        if (postfixIcon != null)
          Icon(
            postfixIcon,
            color: pink,
            size: 24,
          ),
      ],
    );
  }

  Widget textField() {
    var border = const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.transparent,
        style: BorderStyle.solid,
      ),
    );

    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      style: fontH(14),
      cursorColor: pink,
      maxLength: 32,
      onChanged: (text) {
        getIt<AppCubit>().search(text);
      },
      decoration: InputDecoration(
        counterText: "",
        hintText: "Hotels Near Me",
        hintStyle: fontH(14),
        contentPadding: const EdgeInsets.only(right: 12),
        disabledBorder: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
      onFieldSubmitted: (text) {
        getIt<AppCubit>().search(text);
      },
    );
  }
}
