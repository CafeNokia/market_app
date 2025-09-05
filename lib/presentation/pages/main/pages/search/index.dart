import 'package:flutter/material.dart';
import 'package:market_app/presentation/pages/main/pages/list/table/widgets/filterbar/index.dart';
import 'package:market_app/widgets/table/basic/index.dart';

class CSearchPage extends StatefulWidget {
  const CSearchPage({Key? key}) : super(key: key);

  @override
  _CSearchPageState createState() => _CSearchPageState();
}

class _CSearchPageState extends State<CSearchPage> {
  DateTime? _selectedDate;
  String? _selectedCategory;
  String? _selectedStatus;

  final List<List<String>> _myTableData = [
    ['Name', 'Email', 'Status'], // Header row
    ['Alice', 'alice@example.com', 'Active'],
    ['Bob', 'bob@example.com', 'Inactive'],
    ['Charlie', 'charlie@example.com', 'Active'],
  ];

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // You would perform your filtering logic here
        print('Selected date: $_selectedDate');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Demo'),
      ),
      body: Column(
        children: [
          // Filter Bar
          FilterBar(
            onDateSelected: () => _selectDate(context),
            onMarketSelected: (String? newValue) {
              setState(() {
                _selectedCategory = newValue;
                // Perform filtering based on category
                print('Selected category: $_selectedCategory');
              });
            },
            onTypeSelected: (String? newValue) {
              setState(() {
                _selectedStatus = newValue;
                // Perform filtering based on status
                print('Selected status: $_selectedStatus');
              });
            },
            selectedDate: _selectedDate,
            selectedMarket: _selectedCategory,
            selectedType: _selectedStatus,
          ),
          
          // Display the selected filters
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Filters: Date: ${_selectedDate?.toLocal().toString().split(' ')[0] ?? 'N/A'}, '
          //     'Category: ${_selectedCategory ?? 'N/A'}, '
          //     'Status: ${_selectedStatus ?? 'N/A'}'
          //   ),
          // ),

          // Your main content (e.g., a list of items to filter)
          Expanded(
            child: CBasicDataTableWidget(data: _myTableData),
            // child: Center(
            //   child: CDataTableWidget(data: _myTableData),
            // ),
          ),
        ],
      ),
    );
  }
}