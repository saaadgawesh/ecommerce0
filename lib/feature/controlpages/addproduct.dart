import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/feature/auth_model/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth_model/auth_states.dart';
import 'package:flutter_application_1/core/constant/dialog/errordialog.dart';
import 'package:flutter_application_1/core/constant/dialog/loadingdialog.dart';
import 'package:flutter_application_1/feature/controlpages/controlpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class addproduct extends StatefulWidget {
  const addproduct({super.key});

  @override
  State<addproduct> createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://ecommerce-60608.appspot.com');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _imagePath;
  File? file;
  String? profileUrl;
  User? user;
  String? UserID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    UserID = user?.uid;
  }

  Future<String> uploadImageToFireStore(File image, String? imageName) async {
    Reference ref =
        _storage.ref().child('data/${_auth.currentUser?.uid}$imageName');
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    await ref.putFile(image, metadata);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    _getUser();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        file = File(pickedFile.path);
      });
    }
    profileUrl = await uploadImageToFireStore(file!, 'doc');
  }

  final TextEditingController _nameproduct = TextEditingController();
  final TextEditingController _typeofdepartment = TextEditingController();
  final TextEditingController _priceproduct = TextEditingController();
  final TextEditingController _quantityproduct = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _addphoto = TextEditingController();
  final List<String> items = [
    'اطفال',
    'رجالي',
    'حريمي',
    'اكسسوارات',
  ];
  List<String> selectedItems = [];
  String? selectedValue;
  final formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isvisible = true;

  @override
  String name = '';

  String? downloadurl;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSuccessStates) {
          Navigator.of(context).pop(MaterialPageRoute(
            builder: (context) => const controlpage(),
          ));
        } else if (state is AuthErrorStates) {
          Navigator.of(context).pop();
          showerrordialog(context, state.error);
        } else {
          showloadingdialog(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 63, 122, 168),
            title: const Text(
              'اضافة منتج',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 63, 122, 168),
                        ),
                        child: const Text(
                          'name',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        height: 3,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _nameproduct,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      //name of department
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 63, 122, 168),
                        ),
                        child: const Text(
                          'اسم القسم',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 190, 209, 225)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Items',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            items: items.map((selectedValue) {
                              return DropdownMenuItem(
                                value: selectedValue,
                                //disable default onTap to avoid closing menu when selecting an item
                                enabled: false,
                                child: StatefulBuilder(
                                  builder: (context, menuSetState) {
                                    final isSelected =
                                        selectedItems.contains(selectedValue);
                                    return InkWell(
                                      onTap: () {
                                        isSelected
                                            ? selectedItems
                                                .remove(selectedValue)
                                            : selectedItems.add(selectedValue);
                                        //This rebuilds the StatefulWidget to update the button's text
                                        setState(() {});
                                        //This rebuilds the dropdownMenu Widget to update the check mark
                                        menuSetState(() {});
                                      },
                                      child: Container(
                                        height: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            if (isSelected)
                                              const Icon(
                                                  Icons.check_box_outlined)
                                            else
                                              const Icon(Icons
                                                  .check_box_outline_blank),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Text(
                                                selectedValue,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                            //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                            value: selectedItems.isEmpty
                                ? null
                                : selectedItems.last,
                            onChanged: (value) {},
                            selectedItemBuilder: (context) {
                              return items.map(
                                (item) {
                                  return Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      selectedItems.join(', '),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  );
                                },
                              ).toList();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(left: 16, right: 8),
                              height: 40,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),

                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 63, 122, 168),
                        ),
                        child: const Text(
                          'price',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _priceproduct,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),

                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 63, 122, 168),
                        ),
                        child: const Text(
                          'amount',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const Divider(
                        height: 5,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _quantityproduct,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),

                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 63, 122, 168),
                        ),
                        child: const Text(
                          'descripton',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        height: 5,
                      ),
                      SizedBox(
                        // height: 150,
                        child: TextFormField(
                          controller: _description,
                          maxLength: 3,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),

                      Column(
                        children: [
                          CircleAvatar(
                              radius: 80,
                              backgroundImage: (_imagePath != null)
                                  ? FileImage(File(_imagePath!))
                                      as ImageProvider
                                  : const AssetImage('assets/d7.jpg')),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 63, 122, 168),
                            ),
                            child: const Text(
                              'اضافة صورة',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                            readOnly: true,
                            controller: _addphoto,
                            cursorHeight: 20,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 160, 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: IconButton(
                                          onPressed: () async {
                                            _pickImage();
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 50,
                                            color: Color.fromARGB(
                                                255, 63, 122, 168),
                                          )),
                                    )))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    // height: 55,
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 63, 122, 168),
                    ),
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              context.read<AuthCubit>().addproducts_cubit(
                                  name: _nameproduct.text,
                                  email: "",
                                  password: '',
                                  price: _priceproduct.text,
                                  Amount: _quantityproduct.text,
                                  image: profileUrl ?? '',
                                  description: _description.text,
                                  typeofdepartment: selectedValue ?? '');
                            }
                          },
                          child: const Text(
                            'addproduct',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                ),
              ))),
    );
  }
}
