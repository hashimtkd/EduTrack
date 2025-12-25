// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'package:edu_trak/components/app_button.dart';
import 'package:edu_trak/components/app_card.dart';
import 'package:edu_trak/components/app_popup.dart';
import 'package:edu_trak/components/app_text_field.dart';
import 'package:edu_trak/models/profile_image_model/profile_image_model.dart';
import 'package:edu_trak/models/student_model/student_model.dart';
import 'package:edu_trak/providers/bach_provider.dart';
import 'package:edu_trak/providers/profile_image_provider.dart';
import 'package:edu_trak/providers/student_provider.dart';
import 'package:edu_trak/utils/app_colors.dart';
import 'package:edu_trak/utils/app_text_style.dart';
import 'package:edu_trak/utils/image_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditStudentPage extends StatefulWidget {
  final StudentModel? provider;

  final int? id;
  final String? profileImage;
  final int? profileImageId;
  const EditStudentPage({
    super.key,
    required this.provider,

    required this.id,
    this.profileImage,
    this.profileImageId,
  });

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController guardianController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  List<TextEditingController> addressController = [TextEditingController()];

  bool added = false;
  String? bloodGroup;
  String? selectedBloodGroup;
  String? gender;
  String dob = 'Date of birth';
  bool isMale = false;
  bool isFemale = false;
  String? temporalyImage;
  int? selectedBatchId;

  @override
  void initState() {
    super.initState();

    if (widget.provider != null) {
      fullNameController.text = widget.provider!.fullName;
      dob = widget.provider!.dateOfBirth;
      guardianController.text = widget.provider!.guardianName;
      contactNumberController.text = widget.provider!.contactNumber;
      emailController.text = widget.provider!.email;

      selectedBatchId = widget.provider!.bachId;

      gender = widget.provider!.gender;
      selectedBloodGroup = widget.provider!.bloodGroup;
      bloodGroup = selectedBloodGroup;

      if (gender == "male") isMale = true;
      if (gender == "female") isFemale = true;

      addressController.clear();
      for (var addr in widget.provider!.address) {
        addressController.add(TextEditingController(text: addr));
      }
      if (addressController.isEmpty) {
        addressController.add(TextEditingController());
      }
    }
  }

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    setState(() {
      dob =
          "${pickedDate?.day ?? ""}-${pickedDate?.month ?? ""}-${pickedDate?.year ?? ""}";
    });
  }

  Future<void> update({required int? id}) async {
    int? newImageId = widget.profileImageId;

    if (temporalyImage != null && temporalyImage!.isNotEmpty) {
      final image = ProfileImageModel(profileImage: temporalyImage!);
      newImageId = await context.read<ProfileImageProvider>().insert(image);
    }
    bool addressIsValid = addressController.any(
      (controller) => controller.text.isNotEmpty,
    );

    if (id != null &&
        emailController.text.isNotEmpty &&
        dob.isNotEmpty &&
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
        id: id,
        fullName: fullNameController.text.firstLetterUppercase(),
        dateOfBirth: dob,
        gender: gender ?? "",
        guardianName: guardianController.text,
        bloodGroup: selectedBloodGroup ?? "",
        address: address,
        bachId: selectedBatchId,
        contactNumber: contactNumberController.text,
        email: emailController.text,
        profileImageId: newImageId,
      );

      await Provider.of<StudentProvider>(
        context,
        listen: false,
      ).update(student);

      if (temporalyImage != null &&
          temporalyImage!.isNotEmpty &&
          widget.profileImage != null &&
          widget.profileImageId != null) {
        await context.read<ProfileImageProvider>().delete(
          widget.profileImage!,
          widget.profileImageId,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final batchProvider = context.watch<BachProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Edit Student').size(32).blue().semiBold(),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          temporalyImage != null && temporalyImage!.isNotEmpty
                          ? FileImage(File(temporalyImage!))
                          : widget.profileImage != null &&
                                widget.profileImage!.isNotEmpty
                          ? FileImage(File(widget.profileImage!))
                          : null,

                      child:
                          (temporalyImage == null || temporalyImage!.isEmpty) &&
                              (widget.profileImage == null ||
                                  widget.profileImage!.isEmpty)
                          ? const Icon(Icons.person, size: 40)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          appPopup(
                            context,
                            Text('Upload from').blue(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppButton(
                                  border: Border.all(
                                    color: AppColors.backGround,
                                  ),
                                  onTap: () async {
                                    final file =
                                        await ImagePickerHelper.pickFromCamera();

                                    setState(() {
                                      temporalyImage = file;
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  width: 0.50,
                                  hight: 0.100,
                                  child: Text('Camera').blue().bold(),
                                ),
                                const SizedBox(height: 5),
                                AppButton(
                                  border: Border.all(
                                    color: AppColors.backGround,
                                  ),
                                  onTap: () async {
                                    final file =
                                        await ImagePickerHelper.pickFromGallery();

                                    setState(() {
                                      temporalyImage = file;
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  width: 0.50,
                                  hight: 0.100,
                                  child: Text('Gallery').blue().bold(),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: AppColors.backgroundw,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AppTextField(
                  controller: fullNameController,
                  text: Text('Full name').size(14).black(),
                  validation: 'Enter full name',
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: AppCard(
                        onTap: () => selectDate(),
                        hight: 50,
                        width: 150,
                        border: Border.all(color: AppColors.backGround),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(dob),
                            SizedBox(width: 5),
                            const Icon(Icons.calendar_month),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Flexible(
                      child: AppCard(
                        width: 150,
                        border: Border.all(color: AppColors.backGround),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              hintText: "Blood Group",
                              border: InputBorder.none,
                            ),
                            value: selectedBloodGroup,
                            items:
                                [
                                      'A+',
                                      'A-',
                                      'B+',
                                      'B-',
                                      'O+',
                                      'O-',
                                      'AB+',
                                      'AB-',
                                    ]
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() => selectedBloodGroup = value);
                            },
                            validator: (value) =>
                                value == null ? 'Blood group' : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                AppTextField(
                  controller: guardianController,
                  text: Text('Guardian').size(14).black(),
                  validation: 'Enter guardian name',
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppCard(
                      width: 180,
                      border: Border.all(color: AppColors.backGround),
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
                    SizedBox(width: 2),
                    AppCard(
                      width: 150,
                      border: Border.all(color: AppColors.backGround),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: DropdownButtonFormField<int>(
                          isDense: true,
                          decoration: const InputDecoration(
                            hintText: "Batch",

                            border: InputBorder.none,
                          ),
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
                          validator: (value) => value == null ? 'Batch' : null,
                        ),
                      ),
                    ),
                  ],
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

                const SizedBox(height: 10),

                AppButton(
                  color: AppColors.backGround,
                  hight: 0.150,
                  width: 0.920,
                  child: Text('Save').size(16).semiBold().wight(),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await update(id: widget.provider!.id);
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
