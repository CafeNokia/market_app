// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/data/models/trade/index.dart';
import 'package:market_app/http/dio/index.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/presentation/pages/main/pages/list/table/widgets/filterbar/index.dart';

class CDataTableWidget extends StatefulWidget {
  const CDataTableWidget({super.key});

  @override
  State<CDataTableWidget> createState() => _CDataTableWidgetState();
}

class _CDataTableWidgetState extends State<CDataTableWidget> {
  // List<CTradeModel> _tableData = [];
  List<dynamic> _tableData = [];
  int? _selectedRowIndex;
  String? _errorMessage;
  bool _isAscending = true;
  String _sortColumn = 'code';
  bool _isLoading = true;

  DateTime? _selectedDate = DateTime.now();
  String? _selectedMarket = 'all';
  String? _selectedType;

  Map<String, dynamic> _filters = {
    'market': 'all',
    'type': '',
    // 'date': '2025-08-27',
    'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'page': 1,
    'size': 20
  };

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

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
        _search();
      });
    }
  }

  Future<void> _search() async {
    _filters['market'] = _selectedMarket;
    _filters['type'] = _selectedType;
    _filters['date'] = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      // print(_filters);
      final response = await CDioClient().dio.post(
        '/trade/list',
        data: _filters
      );
      // print(response);
      // debugPrint(response.data);
      if (response.statusCode == 200) {
        List<dynamic> dataList = response.data['datas'];
        setState(() {
          // _tableData = dataList.map((json) => CTradeModel.fromJson(json)).toList();
          _tableData = dataList;
          _isLoading = false;
          _errorMessage = null;
        });
      } else {
        throw Exception('request failed: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  void _onRowTap(int index) {
    setState(() {
      _selectedRowIndex = _selectedRowIndex == index ? null : index;
    });
  }

  void _sortData(String column) {
    setState(() {
      if (_sortColumn == column) {
        _isAscending = !_isAscending;
      } else {
        _sortColumn = column;
        _isAscending = true;
      }
      
      _tableData.sort((a, b) {
        if (a[column] is String) {
          return _isAscending 
            ? a[column].compareTo(b[column]) 
            : b[column].compareTo(a[column]);
        } else if (a[column] is int) {
          return _isAscending
            ? a[column].compareTo(b[column]) 
            : b[column].compareTo(a[column]);
        }
        return 0;
      });
    });
  }

  Widget buildStatusLabel(String status) {
    Color color;
    String text;
    
    switch (status) {
      case 'win':
        color = Colors.green;
        text = 'Win';
        break;
      case 'lost':
        color = Colors.red;
        text = 'Lost';
        break;
      default:
        color = Colors.grey;
        text = 'Unknown';
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color, width: 0.5),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _onRowClicked(data) {
      print(data);
      context.go('/detail');
    }
    return Column(
      children: [
        // Filter Bar
        FilterBar(
          onDateSelected: () => _selectDate(context),
          onMarketSelected: (String? newValue) {
            setState(() {
              _selectedMarket = newValue;
              // Perform filtering based on category
              print('Selected category: $_selectedMarket');
              _search();
            });
          },
          onTypeSelected: (String? newValue) {
            setState(() {
              _selectedType = newValue;
              // Perform filtering based on status
              print('Selected status: $_selectedType');
              _search();
            });
          },
          selectedDate: _selectedDate,
          selectedMarket: _selectedMarket,
          selectedType: _selectedType,
        ),
        
        // Display the selected filters
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Text(
        //     'Filters: Date: ${_selectedDate?.toLocal().toString().split(' ')[0] ?? 'N/A'}, '
        //     'Category: ${_selectedMarket ?? 'N/A'}, '
        //     'Status: ${_selectedType ?? 'N/A'}'
        //   ),
        // ),

        // Your main content (e.g., a list of items to filter)
        Expanded(
          child:
          DataTable(
            sortColumnIndex: _sortColumn == 'code' ? 0 : 
                              _sortColumn == 'name' ? 1 : 
                              _sortColumn == 'new_price' ? 2 : 
                              _sortColumn == 'change_rate' ? 3 : 4,
            sortAscending: _isAscending,
            showCheckboxColumn: false,
            columns: [
              DataColumn(
                label: const Text('Code', style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primary)),
                onSort: (_, __) => _sortData('code'),
              ),
              DataColumn(
                label: const Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primary)),
                onSort: (_, __) => _sortData('name'),
              ),
              DataColumn(
                label: const Text('Price', style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primary)),
                numeric: true,
                onSort: (_, __) => _sortData('new_price'),
              ),
              DataColumn(
                label: const Text('Change Rate', style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primary)),
                onSort: (_, __) => _sortData('change_rate'),
              ),
              DataColumn(
                label: const Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: CColors.primary)),
                onSort: (_, __) => _sortData('turnover_rate'),
              ),
            ],
            
            rows: List.generate(_tableData.length, (index) {
              final data = _tableData[index];
              final isEvenRow = index % 2 == 0;
              
              return DataRow(
                selected: _selectedRowIndex == index,
                color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      // return Theme.of(context).colorScheme.primary;
                      return const Color.fromARGB(255, 56, 55, 55);
                    }
                    return Colors.transparent;
                    // return isEvenRow ? const Color.fromARGB(255, 50, 43, 43) : const Color.fromARGB(255, 38, 14, 14);
                  },
                ),
                onSelectChanged: (value) {
                  _onRowTap(index);
                },
                cells: [
                  DataCell(Text(data['code'], style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))), onTap: () => _onRowClicked(data)),
                  DataCell(Text(data['name'])),
                  DataCell(Text(data['new_price'].toString())),
                  DataCell(Text(data['change_rate'].toString())),
                  DataCell(Text(data['float_mkt_cap'].toString())),
                ],
              );
            }),
          )
        ),
      ]);
  }
}