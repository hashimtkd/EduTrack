import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/models/student_model.dart';
import 'package:edu_trak/providers/bach_provider.dart';
import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewAdmissionPage extends StatefulWidget {
  const NewAdmissionPage({super.key});

  @override
  State<NewAdmissionPage> createState() => _NewAdmissionPageState();
}

class _NewAdmissionPageState extends State<NewAdmissionPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController guardianController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  List<TextEditingController> addressController = [TextEditingController()];

  bool added = false;
  String? selectedBloodGroup;
  String? gender;
  bool isMale = false;
  bool isFemale = false;

  int? selectedBatchId;

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dobController.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  Future<void> save() async {
    bool addressIsValid = addressController.any(
      (controller) => controller.text.isNotEmpty,
    );

    if (emailController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty &&
        guardianController.text.isNotEmpty &&
        selectedBatchId != null &&
        contactNumberController.text.isNotEmpty &&
        addressIsValid) {
      final List<String> address = addressController
          .map((c) => c.text.trim())
          .where((text) => text.isNotEmpty)
          .toList();

      final student = StudentModel(
        fullName: fullNameController.text,
        dateOfBirth: dobController.text,
        gender: gender ?? "",
        guardianName: guardianController.text,
        bloodGroup: selectedBloodGroup ?? "",
        address: address,
        bachId: selectedBatchId,
        contactNumber: contactNumberController.text,
        email: emailController.text,
      );

      Provider.of<StudentProvider>(context, listen: false).insert(student);
    }
  }

  @override
  Widget build(BuildContext context) {
    final batchProvider = context.watch<BachProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text('New Admission').size(32).blue().semiBold(),
                  ],
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: fullNameController,
                  text: Text('Full name').size(14).black(),
                  validation: 'Enter full name',
                ),

                const SizedBox(height: 10),

                AppTextField(
                  text: Text('Date Of Birth').size(14).black(),
                  validation: 'Select date of birth',
                  controller: dobController,
                  inputType: TextInputType.datetime,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: selectDate,
                  ),
                ),

                const SizedBox(height: 10),

                AppTextField(
                  controller: guardianController,
                  text: Text('Guardian').size(14).black(),
                  validation: 'Enter guardian name',
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      hintText: "Select Blood Group",
                    ),
                    value: selectedBloodGroup,
                    items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedBloodGroup = value);
                    },
                    validator: (value) =>
                        value == null ? 'Select blood group' : null,
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isMale,
                        onChanged: (value) {
                          setState(() {
                            isMale = value!;
                            isFemale = false;
                            gender = 'male';
                          });
                        },
                      ),
                      const Text("Male"),

                      Checkbox(
                        value: isFemale,
                        onChanged: (value) {
                          setState(() {
                            isFemale = value!;
                            isMale = false;
                            gender = 'female';
                          });
                        },
                      ),
                      const Text("Female"),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                AppTextField(
                  controller: contactNumberController,
                  text: Text('Contact number').size(14).black(),
                  validation: 'Enter contact number',
                  inputType: TextInputType.phone,
                ),

                const SizedBox(height: 10),

                Column(
                  children: List.generate(
                    addressController.length,
                    (index) => AppTextField(
                      controller: addressController[index],
                      text: Text('Address').size(14).black(),
                      validation: 'Enter address',
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(hintText: "Select Batch"),
                    value: selectedBatchId,
                    items: batchProvider.bachtList
                        .map(
                          (b) => DropdownMenuItem(
                            value: b.id,
                            child: Text(b.batchName),
                          ),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => selectedBatchId = value),
                    validator: (value) => value == null ? 'Select batch' : null,
                  ),
                ),

                const SizedBox(height: 10),

                AppTextField(
                  text: Text('Email').size(14).black(),
                  validation: 'Enter email',
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                  autoFill: (value) {
                    if (!added && emailController.text.contains('@')) {
                      emailController.text = '${emailController.text}gmail.com';
                      added = true;
                    }
                  },
                ),

                const SizedBox(height: 20),

                AppButton(
                  color: AppColors.backGround,
                  hight: 0.150,
                  width: 0.72,
                  child: Text('Save').size(16).semiBold().wight(),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await save();
                      Navigator.pop(context);
                    }
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
