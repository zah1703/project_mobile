import 'package:flutter/material.dart';

class VideoListPage2 extends StatelessWidget {
  const VideoListPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Shorts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button tap
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle menu item tap
            },
            itemBuilder: (BuildContext context) {
              return ['Item 1', 'Item 2', 'Item 3'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
body: Stack(
  children: [
    Container(
      color: Colors.green, // Warna latar belakang
    ),
    Align(
      alignment: Alignment.bottomLeft, // Menempatkan di pojok kiri bawah
      child: Container(
        padding: const EdgeInsets.all(8.0), // Padding untuk semua sisi
        color: Colors.white.withOpacity(0.9), // Membuat background sedikit transparan
        child: Column(
          mainAxisSize: MainAxisSize.min, // Membuat Column mengambil ukuran minimal
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menjajar item di Row
              children: [
                const Text('Nama User'),
                ElevatedButton(
                  onPressed: () {}, // Fungsi ketika tombol ditekan
                  child: const Text('Subscribe'),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subscribers'),
                Text('Donations'),
              ],
            ),
            const Row(
              children: [
                Text('Caption'),
              ],
            ),
            const Row(
              children: [
                Text('Date'),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
),

        floatingActionButton: Column(
          key: const Key('action_list'),
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            onPressed: () {
              // Handle like button tap
            },
            child: const Icon(Icons.thumb_up, color: Colors.white,),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            onPressed: () {
              // Handle dislike button tap
            },
            child: const Icon(Icons.thumb_down, color: Colors.white,),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            onPressed: () {
              // Handle chat button tap
            },
            child: const Icon(Icons.chat, color: Colors.white,),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            onPressed: () {
              // Handle share button tap
            },
            child: const Icon(Icons.share, color: Colors.white,),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            onPressed: () {
              // Handle user account button tap
            },
            child: const Icon(Icons.account_circle, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
