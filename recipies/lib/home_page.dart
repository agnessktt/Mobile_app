import 'package:flutter/material.dart';
import 'dish_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  // Danh sách món ăn yêu thích
  final List<Map<String, String>> _favoriteDishes = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Toggle lưu/bỏ lưu món ăn
  void _toggleFavorite(String title, String imagePath) {
    setState(() {
      final exists = _favoriteDishes.any((dish) => dish["title"] == title);
      if (exists) {
        _favoriteDishes.removeWhere((dish) => dish["title"] == title);
      } else {
        _favoriteDishes.add({"title": title, "imagePath": imagePath});
      }
    });
  }

  // Kiểm tra món có được lưu chưa
  bool _isFavorite(String title) {
    return _favoriteDishes.any((dish) => dish["title"] == title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Công thức nấu ăn mỗi ngày"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Món mới"),
            Tab(text: "Món Việt"),
            Tab(text: "Món Âu"),
            Tab(text: "Tráng miệng"),
            Tab(text: "Đồ uống"),
          ],
          isScrollable: true,
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Trang chủ
          TabBarView(
            controller: _tabController,
            children: [
              _buildDishList(),
              const Center(child: Text("Danh sách Món Việt")),
              const Center(child: Text("Danh sách Món Âu")),
              const Center(child: Text("Danh sách Tráng miệng")),
              const Center(child: Text("Danh sách Đồ uống")),
            ],
          ),
          const Center(child: Text("Danh sách Gợi ý")),
          _buildFavoriteTab(), // Món ăn của tôi
          const Center(child: Text("Trang Cá nhân")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Gợi ý"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Món ăn của"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
        ],
      ),
    );
  }

  // Danh sách món mới
  Widget _buildDishList() {
    return ListView(
      children: [
        DishCard(
          imagePath: "assets/pho_bo.jpg",
          title: "Phở bò",
          isFavorite: _isFavorite("Phở bò"),
          onFavoriteTap: () => _toggleFavorite("Phở bò", "assets/pho_bo.jpg"),
        ),
        DishCard(
          imagePath: "assets/ga_nuong_mat_ong.jpg",
          title: "Gà nướng mật ong",
          isFavorite: _isFavorite("Gà nướng mật ong"),
          onFavoriteTap: () => _toggleFavorite(
              "Gà nướng mật ong", "assets/ga_nuong_mat_ong.jpg"),
        ),
        DishCard(
          imagePath: "assets/tiramisu.jpg",
          title: "Tiramisu",
          isFavorite: _isFavorite("Tiramisu"),
          onFavoriteTap: () =>
              _toggleFavorite("Tiramisu", "assets/tiramisu.jpg"),
        ),
      ],
    );
  }

  // Tab "Món ăn của tôi"
  Widget _buildFavoriteTab() {
    if (_favoriteDishes.isEmpty) {
      return const Center(child: Text("Chưa có món nào được lưu"));
    }
    return ListView(
      children: _favoriteDishes.map((dish) {
        return DishCard(
          imagePath: dish["imagePath"]!,
          title: dish["title"]!,
          isFavorite: true,
          onFavoriteTap: () =>
              _toggleFavorite(dish["title"]!, dish["imagePath"]!),
        );
      }).toList(),
    );
  }
}
