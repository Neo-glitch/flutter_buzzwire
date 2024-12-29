import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class BuzzWireCountryPicker extends StatefulWidget {
  final bool? isEnabled;
  final Function(Country country)? onSelected;
  const BuzzWireCountryPicker({
    super.key,
    this.onSelected,
    this.isEnabled,
  });

  @override
  State<BuzzWireCountryPicker> createState() => _BuzzWireCountryPickerState();
}

class _BuzzWireCountryPickerState extends State<BuzzWireCountryPicker> {
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      onTap: () => _showCountryPicker(),
      readOnly: true,
      controller: _countryController,
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      useSafeArea: true,
      context: context,
      countryListTheme: CountryListThemeData(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        inputDecoration: const InputDecoration().copyWith(
          filled: true,
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
      onSelect: (Country country) {
        _countryController.text = country.name;
        FocusScope.of(context).requestFocus(FocusNode());
        if (widget.onSelected != null) {
          widget.onSelected!(country);
        }
      },
    );
  }
}
