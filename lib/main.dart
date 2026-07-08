import 'package:flutter/material.dart';
// ตรวจสอบชื่อแฟ้มและพาธให้ตรงตามโครงสร้างโปรเจกต์ของคุณ
import 'pages/ai_chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Colors.purple; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
      ),
      // 💡 แนะนำให้ใช้ SingleChildScrollView ครอบไว้เพื่อให้เลื่อนหน้าจอได้ เผื่อกรณีปุ่มกดล้นหน้าจอตอนทดสอบบนมือถือจอเล็กครับ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // รูปโปรไฟล์สีม่วง
              const CircleAvatar(
                radius: 60,
                backgroundColor: themeColor,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              
              const SizedBox(height: 16),
              
              // ชื่อ
              const Text(
                'ชนินทร์ คำวงศ์ษา',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // รหัสนักศึกษา
              const Text(
                'รหัสนักศึกษา: 67030281',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              
              const SizedBox(height: 24),
              
              // Card ข้อมูลส่วนตัว
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.email, 'อีเมล', '67030281@kmitl.ac.th', themeColor),
                      const Divider(),
                      _buildInfoRow(Icons.account_balance, 'มหาวิทยาลัย', 'สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง', themeColor),
                      const Divider(),
                      _buildInfoRow(Icons.school, 'คณะ', 'ครูศาสตร์อุตสาหกรรมและเทคโนโลยี', themeColor),
                      const Divider(),
                      _buildInfoRow(Icons.code, 'วิชาที่ชอบ', 'Mobile Development', themeColor),
                      const Divider(),
                      _buildInfoRow(Icons.star, 'เป้าหมาย', 'พัฒนาแอปให้ได้ 1 ตัว', themeColor),
                    ],
                  ),
                ),
              ),

              // ↓↓↓ เพิ่มปุ่มทางเชื่อมไปหน้า AI Chat Page ต่อท้าย Card ตรงนี้ตามโจทย์แล็บครับ ↓↓↓
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AiChatPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // ตกแต่งเพิ่มเติมให้เข้ากับธีมสีม่วงของหน้าโปรไฟล์
                  foregroundColor: themeColor,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: const Icon(Icons.smart_toy),
                label: const Text('ทดลอง AI Chat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20), // เผื่อพื้นที่ด้านล่างสุดของหน้าจอไว้เล็กน้อย
              // ↑↑↑ จบส่วนที่เพิ่ม ↑↑↑

            ],
          ),
        ),
      ),
    );
  }
  
  // Helper Method สำหรับสร้างแถวข้อมูล
  Widget _buildInfoRow(IconData icon, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}