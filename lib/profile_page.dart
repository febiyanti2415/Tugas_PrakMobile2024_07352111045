import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controller untuk masing-masing field
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String fullName = " ";

  @override
  void initState() {
    super.initState();
    // Set data awal (misalnya diambil dari database atau API)
    firstNameController.text = "Annette";
    lastNameController.text = "Black";
    emailController.text = "johndoe@example.com";
    addressController.text = "United States";
    phoneNumberController.text = "+5547824852";
  }

  void saveProfile() {
    setState(() {
      // Perbarui nama lengkap di header
      fullName =
          "${firstNameController.text} ${lastNameController.text}".trim();
    });

    // Tampilkan pesan konfirmasi
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile updated successfully!"),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Header Card
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green[300], // Warna hijau untuk header
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile_picture.png'), // Ganti dengan foto profil Anda
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Form Data Pengguna
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    buildEditableField(
                        "First name", firstNameController, false),
                    const SizedBox(height: 10),
                    buildEditableField("Last name", lastNameController, false),
                    const SizedBox(height: 10),
                    buildEditableField("Email", emailController, true),
                    const SizedBox(height: 10),
                    buildEditableField("Address", addressController, false),
                    const SizedBox(height: 10),
                    buildEditableField(
                        "Phone number", phoneNumberController, true),
                    const SizedBox(height: 20),
                    // Tombol Simpan
                    ElevatedButton.icon(
                      onPressed: saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text(
                        "Save Changes",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Tombol Logout
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/login'); // Navigasi ke halaman login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat field yang bisa diedit
  Widget buildEditableField(
      String label, TextEditingController controller, bool isValidationNeeded) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: isValidationNeeded
              ? (label == "Email"
                  ? TextInputType.emailAddress
                  : TextInputType.phone)
              : TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
          onChanged: (value) {
            if (isValidationNeeded) {
              // Validasi input email atau nomor telepon
              if (label == "Email" &&
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                // Tampilkan pesan error (opsional)
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Invalid email format."),
                  backgroundColor: Colors.red,
                ));
              }
              if (label == "Phone number" &&
                  !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Invalid phone number."),
                  backgroundColor: Colors.red,
                ));
              }
            }
          },
        ),
      ],
    );
  }
}
