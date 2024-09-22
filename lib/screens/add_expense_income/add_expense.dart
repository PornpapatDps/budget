import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController classificationController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  IconData? selectedIcon;
  Color selectedColor = Colors.black;
  String? selectedCategory;

  List<IconData> myCategoriesIcons = [
    FontAwesomeIcons.pizzaSlice,
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.house,
    FontAwesomeIcons.paw,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.plane,
  ];

  List<String> predefinedCategories = [
    'อาหารและเครื่องดื่ม',
    'Shopping',
    'สุขภาพและการดูแลตัวเอง',
    'ท่องเที่ยว',
    'บ้านและสวน',
    'สัตว์เลี้ยง',
    'การทำงาน',
  ];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  Future<void> _saveToFirebase() async {
    if (expenseController.text.isNotEmpty &&
        categoryController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      final int expenseAmount = int.tryParse(expenseController.text) ?? 0;
      if (expenseAmount <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('จำนวนเงินต้องมากกว่า 0')),
        );
        return;
      }
      

      Map<String, dynamic> expenseData = {
        'expense': expenseAmount,
        'classification': classificationController.value,
        'category': categoryController.text,
        'icon': selectedIcon?.codePoint,
        'color': selectedColor.value,
        'date': selectedDate,
      };

      try {
        await FirebaseFirestore.instance
            .collection('expenses')
            .add(expenseData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('บันทึกข้อมูลเรียบร้อยแล้ว')),
        );

        // Clear fields
        expenseController.clear();
        categoryController.clear();
        nameController.clear();
        dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
        setState(() {
          selectedIcon = null;
          selectedColor = Colors.black;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('บันทึกข้อมูลล้มเหลว')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "เพิ่มรายจ่าย",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Amount Input
              _buildAmountInput(),
              const SizedBox(height: 24),

              // Category Input
              _buildCategoryInput(),
              const SizedBox(height: 24),

              // classification Input
              _buildclassificationInput(), // New classification input
              const SizedBox(height: 24),

              // Date Input
              _buildDateInput(),
              const SizedBox(height: 32),

              // Save Button
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return TextFormField(
      controller: expenseController,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        labelText: 'จำนวนเงิน',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          FontAwesomeIcons.bahtSign,
          size: 20,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: categoryController,
          readOnly: true,
          onTap: () {
            _showCategoryDialog();
          },
          decoration: InputDecoration(
            labelText: 'บันทึกรายละเอียด',
            filled: true,
            fillColor: Colors.white,
            prefixIcon: selectedIcon != null
                ? Icon(selectedIcon, color: selectedColor)
                : const Icon(FontAwesomeIcons.list,
                    size: 20, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        
      ],
    );
  }

Widget _buildclassificationInput() {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      labelText: 'หมวดหมู่',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    value: selectedCategory, // Track the selected category
    items: predefinedCategories.map((String category) {
      return DropdownMenuItem<String>(
        value: category,
        child: Text(category),
      );
    }).toList(),
    onChanged: (String? newValue) {
      setState(() {
        selectedCategory = newValue; // Update the selected category
      });
    },
    isExpanded: true,
  );
}


  Widget _buildDateInput() {
    return TextFormField(
      controller: dateController,
      readOnly: true,
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );

        if (newDate != null) {
          setState(() {
            dateController.text = DateFormat('dd/MM/yyyy').format(newDate);
            selectedDate = newDate;
          });
        }
      },
      decoration: InputDecoration(
        labelText: 'วันที่',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          FontAwesomeIcons.calendar,
          size: 20,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: kToolbarHeight,
      child: ElevatedButton(
        onPressed: _saveToFirebase,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.save, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'บันทึก',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        bool isExpanded = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Create a Category',
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 10),

                    // Category Name Input
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Category Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Icon Selector
                    TextFormField(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Select Icon',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon:
                            const Icon(CupertinoIcons.chevron_down, size: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    // Icon Grid
                    if (isExpanded)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(12)),
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: myCategoriesIcons.length,
                          itemBuilder: (context, int i) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIcon = myCategoriesIcons[i];
                                  // Update categoryController with selected icon name
                                  categoryController.text =
                                      nameController.text.isNotEmpty
                                          ? nameController.text
                                          : myCategoriesIcons[i]
                                              .toString()
                                              .split('.')
                                              .last;
                                  isExpanded = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedIcon == myCategoriesIcons[i]
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Center(
                                    child:
                                        Icon(myCategoriesIcons[i], size: 40)),
                              ),
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 10),
                    // Color Picker
                    const Text('Select Color'),
                    const SizedBox(height: 10),
                    BlockPicker(
                      pickerColor: selectedColor,
                      onColorChanged: (color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),
                    TextButton.icon(
                      onPressed: () {
                        if (nameController.text.isNotEmpty) {
                          categoryController.text =
                              nameController.text; // Use custom category name
                        }
                        Navigator.pop(context);
                      },
                      label: const Text('Save'),
                      icon: const Icon(Icons.save),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
