import 'package:flutter/material.dart';

class FormRegisterModern extends StatefulWidget {
  @override
  State<FormRegisterModern> createState() => _FormRegisterModernState();
}

class _FormRegisterModernState extends State<FormRegisterModern> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nama = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool obscurePass = true;
  bool obscureConfirm = true;

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrasi Berhasil 🎉")),
      );
    }
  }

  InputDecoration customInput(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Color(0xFF6C63FF)),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FF),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HEADER GRADIENT
            Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  "Daftar Akun",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    /// Nama
                    TextFormField(
                      controller: nama,
                      decoration: customInput("Nama Lengkap", Icons.person),
                      validator: (value) =>
                      value!.isEmpty ? "Nama wajib diisi" : null,
                    ),
                    SizedBox(height: 20),

                    /// Email
                    TextFormField(
                      controller: email,
                      decoration: customInput("Email", Icons.email),
                      validator: (value) {
                        if (value!.isEmpty) return "Email wajib diisi";
                        if (!value.contains("@")) return "Email tidak valid";
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    /// Password
                    TextFormField(
                      controller: password,
                      obscureText: obscurePass,
                      decoration: customInput("Password", Icons.lock)
                          .copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF6C63FF),
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePass = !obscurePass;
                            });
                          },
                        ),
                      ),
                      validator: (value) =>
                      value!.length < 6 ? "Minimal 6 karakter" : null,
                    ),
                    SizedBox(height: 20),

                    /// Confirm Password
                    TextFormField(
                      controller: confirmPassword,
                      obscureText: obscureConfirm,
                      decoration:
                      customInput("Konfirmasi Password", Icons.lock_outline)
                          .copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF6C63FF),
                          ),
                          onPressed: () {
                            setState(() {
                              obscureConfirm = !obscureConfirm;
                            });
                          },
                        ),
                      ),
                      validator: (value) =>
                      value != password.text
                          ? "Password tidak cocok"
                          : null,
                    ),
                    SizedBox(height: 35),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6C63FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                        ),
                        child: Text(
                          "DAFTAR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah punya akun? "),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFF6C63FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}