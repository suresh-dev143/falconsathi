import 'dart:io';
import 'package:falconsathi/features/seller/registration/view/widgets/regi_fields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerRegistrationPage extends StatefulWidget {
  const SellerRegistrationPage({super.key});

  @override
  _SellerRegistrationPageState createState() => _SellerRegistrationPageState();
}

class _SellerRegistrationPageState extends State<SellerRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String phone = '';
  String street = '';
  String city = '';
  String state = '';
  String zipCode = '';
  String country = '';
  File? sellerPhoto;
  List<File> storePhotos = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(bool isSellerPhoto) async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        if (isSellerPhoto) {
          sellerPhoto = File(picked.path);
        } else {
          if (storePhotos.length < 4) {
            storePhotos.add(File(picked.path));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("You can only upload 4 store photos.")),
            );
          }
        }
      });
    }
  }

  void submitForm() {
    if (_formKey.currentState!.validate() &&
        sellerPhoto != null &&
        storePhotos.length == 4) {
      // Proceed with seller registration logic
      print("Email: $email");
      print("Phone: $phone");
      print("Address: $street, $city, $state, $zipCode, $country");
      print("Seller Photo: ${sellerPhoto!.path}");
      print("Store Photos: ${storePhotos.map((f) => f.path).toList()}");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Seller registered successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please fill all fields and upload photos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seller Registration")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Email
                CustomTextField(
                  label: "Seller Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => val != null && val.contains('@')
                      ? null
                      : "Enter valid email",
                  onChanged: (val) => email = val,
                ),
                const SizedBox(height: 12),

                // Phone
                CustomTextField(
                  label: "Phone Number",
                  keyboardType: TextInputType.phone,
                  validator: (val) => val != null && val.length >= 10
                      ? null
                      : "Enter valid phone",
                  onChanged: (val) => phone = val,
                ),
                const SizedBox(height: 12),
                // Store Address

                CustomTextField(
                  label: "Street Address",
                  keyboardType: TextInputType.text,
                  validator: (val) => val != null && val.length >= 10
                      ? null
                      : "Enter street address",
                  onChanged: (val) => street = val,
                ),
                const SizedBox(height: 12),

                // City
                CustomTextField(
                  label: "City",
                  keyboardType: TextInputType.text,
                  validator: (val) => val != null && val.length >= 10
                      ? null
                      : "Enter city name",
                  onChanged: (val) => city = val,
                ),
                const SizedBox(height: 12),

                // State

                CustomTextField(
                  label: "State",
                  keyboardType: TextInputType.text,
                  validator: (val) => val != null && val.length >= 10
                      ? null
                      : "Enter street address",
                  onChanged: (val) => state = val,
                ),
                const SizedBox(height: 12),
                // ZIP Code

                CustomTextField(
                  label: "ZIP Code",
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                      val != null && val.length >= 10 ? null : "Enter zip code",
                  onChanged: (val) => zipCode = val,
                ),
                const SizedBox(height: 12),

                //Seller Photo Section
                const Text("Upload Seller Photo",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => pickImage(true),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        sellerPhoto != null ? FileImage(sellerPhoto!) : null,
                    child: sellerPhoto == null
                        ? const Icon(Icons.camera_alt,
                            size: 30, color: Colors.grey)
                        : null,
                  ),
                ),
                const SizedBox(height: 20),

// Store Photos Section
                const Text("Upload 4 Store Photos",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      storePhotos.length < 4 ? storePhotos.length + 1 : 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    if (index < storePhotos.length) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              storePhotos[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: IconButton(
                              icon: const Icon(Icons.close,
                                  size: 18, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  storePhotos.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return GestureDetector(
                        onTap: () => pickImage(false),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child:
                              const Icon(Icons.add_a_photo, color: Colors.grey),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
