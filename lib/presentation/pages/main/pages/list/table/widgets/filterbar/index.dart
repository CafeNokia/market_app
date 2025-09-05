import 'package:flutter/material.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/core/configs/index.dart';

class FilterBar extends StatelessWidget {
  final VoidCallback onDateSelected;
  final Function(String?) onTypeSelected;
  final Function(String?) onMarketSelected;

  final DateTime? selectedDate;
  final String? selectedMarket;
  final String? selectedType;

 final TextStyle _valueStyle = const TextStyle(
    // fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CColors.primary,
  );

  const FilterBar({
    Key? key,
    required this.onDateSelected,
    required this.onTypeSelected,
    required this.onMarketSelected,
    this.selectedDate,
    this.selectedMarket,
    this.selectedType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Date Filter Button
          _buildDateFilter(context),
          const SizedBox(width: 8.0),

          // Status Dropdown
          _buildDropdownFilter(
            hint: 'Market',
            // items: ['Pending', 'Completed', 'Canceled'],
            items: CConfigurations.marketOptions,
            onChanged: onMarketSelected,
            value: selectedMarket, // Pass the selected value
          ),
          const SizedBox(width: 8.0),

          // Category Dropdown
          _buildDropdownFilter(
            hint: 'Type',
            // items: ['Category A', 'Category B', 'Category C'],
            items: CConfigurations.filterOptions,
            onChanged: onTypeSelected,
            value: selectedType, // Pass the selected value
          ),
        ],
      ),
    );
  }

  // Helper method for the date filter
  Widget _buildDateFilter(BuildContext context) {
    final dateText = selectedDate == null
        ? 'Date'
        : "${selectedDate!.day}/${selectedDate!.month}";

    return ElevatedButton.icon(
      onPressed: onDateSelected,
      icon: const Icon(Icons.calendar_today, size: 18),
      label: Text(dateText),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Corrected _buildDropdownFilter helper method

  Widget _buildDropdownFilter({
    required String hint,
    required List<Map<String, String>> items,
    required Function(String?) onChanged,
    String? value, // The current selected value
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: _valueStyle,
          hint: Text(hint, style: const TextStyle(color: Color.fromARGB(255, 12, 1, 1), fontWeight: FontWeight.bold)),
          value: value, // Set the selected value here
          items: items.map((Map<String, String> item) {
            return DropdownMenuItem<String>(
              value: item['key'],
              child: Text(item['label']!),
            );
          }).toList(),
          onChanged: onChanged,
          isDense: true, // Optional: makes it more compact
        ),
      ),
    );
  }
}