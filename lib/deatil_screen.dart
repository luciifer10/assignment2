import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic item;

  const DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leads Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailContainer(
                Icons.person,
                'Name',
                item['name'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.email,
                'Email',
                item['email'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.phone,
                'Phone',
                item['phone'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.date_range,
                'Date',
                item['added_date'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.domain,
                'Domain',
                item['domain'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.work,
                'Project',
                item['project_name'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.subject,
                'Subject',
                item['subject'] ?? 'N/A',
              ),
              _buildDetailContainer(
                Icons.message,
                'Message',
                item['message'] ?? 'N/A',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailContainer(
      IconData iconData,
      String title,
      String subtitle,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
