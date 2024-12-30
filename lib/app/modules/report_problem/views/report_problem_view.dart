import 'package:flutter/material.dart';

class ReportProblemsView extends StatefulWidget {
  const ReportProblemsView({Key? key}) : super(key: key);

  @override
  _ReportProblemsViewState createState() => _ReportProblemsViewState();
}

class _ReportProblemsViewState extends State<ReportProblemsView> {
  String? _selectedProblem;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Report Problems',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Main card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Report an Issues',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'If you have an issue related here and enable resolve from this application will be helped all',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Dropdown
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            border: InputBorder.none,
                          ),
                          hint: const Text('I have problem with...'),
                          value: _selectedProblem,
                          items: ['Technical Issue', 'Account Problem', 'Billing Issue', 'Other']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedProblem = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Text field
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Describe your problem (optional)',
                            contentPadding: EdgeInsets.all(16),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Send button
                      ElevatedButton(
                        onPressed: () {
                          // Handle send action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                          minimumSize: const Size(80, 40),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}