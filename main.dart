import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ChatHomeScreen(),
    );
  }
}
class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});
  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}
class _ChatHomeScreenState extends State<ChatHomeScreen> {
  int selectedTab = 0; // 0 = Chat, 1 = Group, 2 = Calls
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // বামের Tab সেকশন
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border(right: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildSideTab('Chat', 0, Icons.chat_bubble_outline),
                  _buildSideTab('Group', 1, Icons.group_outlined),
                  _buildSideTab('Calls', 2, Icons.call_outlined),
                ],
              ),
            ),
            // ডানের মেইন কনটেন্ট
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar এরিয়া
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'The Chat',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.camera_alt_outlined),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text('73', style: TextStyle(fontSize: 12)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text('Search', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Status সেকশন
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      children: [
                        _buildStatusItem('+8801312***', true),
                        _buildStatusItem('+8801936***', false),
                        _buildStatusItem('+8801850***', false),
                        _buildUploadPic(),
                      ],
                    ),
                  ),
                  const Divider(),
                  // চ্যাট লিস্ট এখানে আসবে
                  Expanded(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      _buildChatTile(
        name: 'Mira',
        message: 'কিরে দোস্ত, কালকে আসবি?',
        time: '10:30 AM',
        unreadCount: 2,
        avatarColor: Colors.orange,
      ),
      _buildChatTile(
        name: 'বৃষ্টি',
        message: 'ছবিগুলা পাঠাই দিস তো',
        time: '9:15 AM',
        unreadCount: 0,
        avatarColor: Colors.purple,
      ),
      _buildChatTile(
        name: 'রাহাত ভাই',
        message: 'প্রজেক্টের ফাইলটা Upload করছো?',
        time: 'Yesterday',
        unreadCount: 5,
        avatarColor: Colors.green,
      ),
      _buildChatTile(
        name: '+880 1312 *',
        message: 'Okay bhai, done.',
        time: 'Yesterday',
        unreadCount: 0,
        avatarColor: Colors.teal,
      ),
    ],
  ),
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSideTab(String title, int index, IconData icon) {
    bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected? Colors.blue.withOpacity(0.1) : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected? Colors.blue : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected? Colors.blue : Colors.grey[600]),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: isSelected? Colors.blue : Colors.grey[600],
                fontWeight: isSelected? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildStatusItem(String number, bool hasHeart) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
              if (hasHeart)
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(number, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
  Widget _buildUploadPic() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2, style: BorderStyle.solid),
            ),
            child: const Icon(Icons.add, color: Colors.grey, size: 30),
          ),
          const SizedBox(height: 6),
          const Text('upload pic', style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
  Widget _buildChatTile({
  required String name,
  required String message,
  required String time,
  required int unreadCount,
  required Color avatarColor,
}) {
  return Column(
    children: [
      ListTile(
        leading: CircleAvatar(
          backgroundColor: avatarColor,
          radius: 26,
          child: Text(
            name[0],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: unreadCount > 0? Colors.blue : Colors.grey,
                fontWeight: unreadCount > 0? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            if (unreadCount > 0)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            else
              const SizedBox(height: 22), // Align করার জন্য
          ],
        ),
        onTap: () {},
      ),
      Divider(height: 1, indent: 80, color: Colors.grey[200]),
    ],
  );
}
}