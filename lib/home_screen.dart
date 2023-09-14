import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade900,
            onTap: (value) {
              if (value != 2) {
                setState(() {
                  currentIndex = value;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: SvgPicture.asset(
                  currentIndex == 0 ? Constants.homeFilled : Constants.home,
                  height: 30,
                  color:
                      currentIndex == 0 ? Colors.white : Colors.grey.shade600,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: SvgPicture.asset(
                  Constants.search,
                  height: 30,
                  color:
                      currentIndex == 1 ? Colors.white : Colors.grey.shade600,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Post',
                icon: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      // useSafeArea: true,
                      builder: (_) => DraggableScrollableSheet(
                        maxChildSize: 0.9,
                        initialChildSize: 0.9,
                        minChildSize: 0.9,
                        builder: (context, scrollController) => Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                  ),
                                  const Text(
                                    'New thread',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.network(
                                        'https://cdn.pixabay.com/photo/2016/08/09/17/52/instagram-1581266_640.jpg',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const IntrinsicWidth(
                                    child: Column(
                                      children: [
                                        Text(
                                          'hosting_helper',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4.0),
                                        TextField(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.zero,
                                            isDense: true,
                                            hintText: 'Start a thread...',
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
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
                  },
                  child: SvgPicture.asset(
                    Constants.post,
                    height: 30,
                    color:
                        currentIndex == 2 ? Colors.white : Colors.grey.shade600,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Like',
                icon: SvgPicture.asset(
                  currentIndex == 3 ? Constants.heartFilled : Constants.heart,
                  height: 30,
                  color:
                      currentIndex == 3 ? Colors.white : Colors.grey.shade600,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: SvgPicture.asset(
                  currentIndex == 4
                      ? Constants.profileFilled
                      : Constants.profile,
                  height: 25,
                  color:
                      currentIndex == 4 ? Colors.white : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IndexedStack(
            index: currentIndex,
            children: [
              HomeView(),
              const SearchView(),
              const SizedBox(),
              const FollowersView(),
              ProfleView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfleView extends StatefulWidget {
  const ProfleView({
    super.key,
  });

  @override
  State<ProfleView> createState() => _ProfleViewState();
}

class _ProfleViewState extends State<ProfleView> {
  bool isThreadSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.language,
              color: Colors.white,
              size: 30,
            ),
            SvgPicture.asset(
              Constants.menu,
              color: Colors.white,
              height: 30,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Web Hosting',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'hosting_helper',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 60,
                width: 60,
                child: Image.network(
                  'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'description',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 20,
                width: 20,
                child: Image.network(
                  'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '1 follower',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Share Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isThreadSelected = true;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'Threads',
                      style: TextStyle(
                        color: !isThreadSelected
                            ? Colors.grey.shade600
                            : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Visibility(
                      visible: isThreadSelected,
                      child: const Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isThreadSelected = false;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'Replies',
                      style: TextStyle(
                        color: isThreadSelected
                            ? Colors.grey.shade600
                            : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Visibility(
                      visible: !isThreadSelected,
                      child: const Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FollowersView extends StatelessWidget {
  const FollowersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Activity',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 109,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Staple',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              'Followed by you',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Divider(
                              color: Colors.grey.shade600.withOpacity(0.5),
                              thickness: 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: Colors.grey.shade600,
                            width: 1,
                          ),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 24),
                        ),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16.0),
        CupertinoSearchTextField(
          backgroundColor: Colors.grey.shade900,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const SearchCard();
            },
          ),
        ),
      ],
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 109,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Staple',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Staple Stores',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      '4.4k followers',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Divider(
                      color: Colors.grey.shade600.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.grey.shade600,
                    width: 1,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24),
                ),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Center(
            child: SvgPicture.asset(
              Constants.threadsLogo,
              color: Colors.white,
              height: 40,
              width: 40,
            ),
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ReusablePostView();
            },
          ),
        ],
      ),
    );
  }
}

class ReusablePostView extends StatelessWidget {
  const ReusablePostView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2016/08/09/17/52/instagram-1581266_640.jpg',
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            clipBehavior: Clip.hardEdge,
                            child: const Center(
                              child: Icon(
                                Icons.add_rounded,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Instagram',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '4h',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'I\'ve reached more peaks than I can count.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                        height: 250,
                        width: MediaQuery.of(context).size.width - 100,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Constants.heart,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(
                          Constants.chat,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(
                          Constants.repost,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(
                          Constants.send,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      '40 replies . View Likes',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Divider(
          color: Colors.grey.shade600,
        ),
      ],
    );
  }
}
