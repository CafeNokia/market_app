import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CProfilePage extends StatefulWidget {
  const CProfilePage({super.key});

  @override
  _CProfilePageState createState() => _CProfilePageState();
}

class _CProfilePageState extends State<CProfilePage> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController(text: "Jane Doe");
  final TextEditingController _emailController = TextEditingController(text: "jane.doe@example.com");
  final TextEditingController _phoneController = TextEditingController(text: "+1 123-456-7890");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
              if (!_isEditing) {
                // Here, you would save the data to a database or shared preferences.
                print('Saving profile information...');
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Avatar Section
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  if (_isEditing)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                        onPressed: () {
                          // TODO: Implement image picker logic
                          print('Change photo clicked');
                        },
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),

              // Information Section
              _buildInfoItem(
                icon: FontAwesomeIcons.solidUser,
                label: 'Name',
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              _buildInfoItem(
                icon: FontAwesomeIcons.solidEnvelope,
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildInfoItem(
                icon: FontAwesomeIcons.phoenixFramework,
                label: 'Phone',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: _isEditing
            ? TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              keyboardType: keyboardType,
            )
            : Text(
              controller.text,
              style: const TextStyle(fontSize: 16),
            ),
        ),
      ],
    );
  }
}