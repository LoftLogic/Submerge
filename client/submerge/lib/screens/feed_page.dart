import 'package:flutter/material.dart';

class Post {
  final String username;
  final String title;
  final String content;
  final String timeAgo;
  final String poolName;
  int upvotes;
  int comments;
  bool isUpvoted;
  bool isDownvoted;

  Post({
    required this.username,
    required this.title,
    required this.content,
    required this.timeAgo,
    required this.poolName,
    required this.upvotes,
    required this.comments,
    this.isUpvoted = false,
    this.isDownvoted = false,
  });
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<String> _pools = [
    'All Pools',
    'Diving Enthusiasts',
    'Surf Community',
    'Marine Conservation',
    'Beach Photography',
    'Ocean Science',
    'Underwater Tech',
    'Marine Biology',
    'Coral Reefs',
  ];

  String _selectedPool = 'All Pools';

  final Map<String, List<Post>> _poolPosts = {
    'Diving Enthusiasts': [
      Post(
        username: 'ocean_explorer',
        title: 'Found an amazing diving spot in the Caribbean!',
        content: 'Just discovered this hidden gem near St. Lucia. Crystal clear waters and abundant marine life. Who wants to join for the next dive? 🤿 🐠',
        upvotes: 324,
        comments: 45,
        timeAgo: '2h',
        poolName: 'Diving Enthusiasts',
      ),
      Post(
        username: 'dive_master',
        title: 'Essential gear for night diving',
        content: 'Planning your first night dive? Here\'s my recommended gear list:\n- Primary and backup lights\n- Glow sticks\n- Reflective tape\n- Special signal markers\n\nWhat else would you add? 🔦 🌊',
        upvotes: 156,
        comments: 28,
        timeAgo: '4h',
        poolName: 'Diving Enthusiasts',
      ),
    ],
    'Surf Community': [
      Post(
        username: 'wave_rider',
        title: 'Tips for beginner surfers',
        content: 'After 5 years of surfing, here are my top tips for beginners:\n\n1. Start with a longer board\n2. Practice pop-ups on land\n3. Always check weather conditions\n4. Take lessons from a pro\n\nWhat other tips would you add? 🏄‍♂️',
        upvotes: 892,
        comments: 156,
        timeAgo: '5h',
        poolName: 'Surf Community',
      ),
      Post(
        username: 'surf_guru',
        title: 'Best surf spots in Bali right now',
        content: 'Just spent a month surfing around Bali. Here are the top spots with perfect waves:\n- Uluwatu\n- Canggu\n- Bingin\n- Padang Padang\n\nThe swells are amazing! 🌊 🏄‍♀️',
        upvotes: 445,
        comments: 89,
        timeAgo: '6h',
        poolName: 'Surf Community',
      ),
    ],
    'Marine Conservation': [
      Post(
        username: 'coral_guardian',
        title: 'Help needed: Coral restoration project',
        content: 'Our team is starting a new coral restoration project in the Great Barrier Reef. Looking for volunteers with marine biology background or diving experience. DM for details! 🌊 🐡',
        upvotes: 567,
        comments: 89,
        timeAgo: '8h',
        poolName: 'Marine Conservation',
      ),
      Post(
        username: 'ocean_activist',
        title: 'Beach cleanup this weekend',
        content: 'Organizing a beach cleanup at Miami Beach this Saturday. Bring gloves and join us in protecting our oceans! Together we can make a difference. 🌊 ♻️',
        upvotes: 234,
        comments: 45,
        timeAgo: '10h',
        poolName: 'Marine Conservation',
      ),
    ],
    'Beach Photography': [
      Post(
        username: 'beach_photographer',
        title: 'Sunset series: Day 30',
        content: 'Another breathtaking sunset at Malibu Beach. The colors today were absolutely incredible. Shot on Sony A7III. Settings: f/2.8, 1/200s, ISO 100 📸 🌅',
        upvotes: 1243,
        comments: 98,
        timeAgo: '11h',
        poolName: 'Beach Photography',
      ),
      Post(
        username: 'coastal_lens',
        title: 'Morning light at Shell Beach',
        content: 'Captured this magical moment at sunrise. The way the light plays with the morning mist and reflects off the shells is just perfect. No filters needed! 📷 🐚',
        upvotes: 876,
        comments: 67,
        timeAgo: '13h',
        poolName: 'Beach Photography',
      ),
    ],
    'Ocean Science': [
      Post(
        username: 'marine_researcher',
        title: 'New deep-sea species discovered!',
        content: 'Our research team just identified a previously unknown species of anglerfish at 3000m depth. Full paper coming soon in Marine Biology Journal. 🔬 🐟',
        upvotes: 1567,
        comments: 234,
        timeAgo: '7h',
        poolName: 'Ocean Science',
      ),
      Post(
        username: 'ocean_lab',
        title: 'Ocean acidification study results',
        content: 'Just completed our 2-year study on coral reef response to increasing ocean acidification. The data is concerning but there\'s hope if we act now. 🌡️ 🔬',
        upvotes: 892,
        comments: 156,
        timeAgo: '9h',
        poolName: 'Ocean Science',
      ),
    ],
  };

  List<Post> get _filteredPosts {
    if (_selectedPool == 'All Pools') {
      return _poolPosts.values.expand((posts) => posts).toList()
        ..sort((a, b) => b.upvotes.compareTo(a.upvotes));
    }
    return _poolPosts[_selectedPool] ?? [];
  }

  void _handleUpvote(int index) {
    setState(() {
      if (_filteredPosts[index].isUpvoted) {
        _filteredPosts[index].upvotes--;
        _filteredPosts[index].isUpvoted = false;
      } else {
        if (_filteredPosts[index].isDownvoted) {
          _filteredPosts[index].upvotes++;
          _filteredPosts[index].isDownvoted = false;
        }
        _filteredPosts[index].upvotes++;
        _filteredPosts[index].isUpvoted = true;
      }
    });
  }

  void _handleDownvote(int index) {
    setState(() {
      if (_filteredPosts[index].isDownvoted) {
        _filteredPosts[index].upvotes++;
        _filteredPosts[index].isDownvoted = false;
      } else {
        if (_filteredPosts[index].isUpvoted) {
          _filteredPosts[index].upvotes--;
          _filteredPosts[index].isUpvoted = false;
        }
        _filteredPosts[index].upvotes--;
        _filteredPosts[index].isDownvoted = true;
      }
    });
  }

  void _showPostDetail(BuildContext context, Post post) {
    final width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: width > 480 ? 480 : width,
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  post.poolName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '• Posted by u/${post.username} • ${post.timeAgo}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            post.content,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Comments section placeholder
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Comments',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Add comment input
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Horizontal pool list
          Container(
            height: 40,  // Reduced from 48
            margin: const EdgeInsets.only(bottom: 8),  // Reduced from 16
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _pools.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),  // Reduced from 16
              itemBuilder: (context, index) {
                final pool = _pools[index];
                final isSelected = pool == _selectedPool;
                return Padding(
                  padding: const EdgeInsets.only(right: 6),  // Reduced from 8
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPool = pool;
                      });
                      if (pool != 'All Pools') {
                        // Navigate to pool community page
                        // TODO: Implement pool community page navigation
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Viewing $pool community'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),  // Reduced padding
                      decoration: BoxDecoration(
                        color: isSelected 
                          ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                          : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          pool,
                          style: TextStyle(
                            color: isSelected
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Posts list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                for (int i = 0; i < _filteredPosts.length; i++) ...[
                  if (i > 0) const SizedBox(height: 16),
                  _buildPost(context, _filteredPosts[i], i),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPost(BuildContext context, Post post, int index) {
    return GestureDetector(
      onTap: () => _showPostDetail(context, post),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        post.poolName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '• Posted by u/${post.username} • ${post.timeAgo}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                post.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                post.content,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Actions
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Upvote button
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_upward,
                            color: post.isUpvoted
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.white.withOpacity(0.6),
                            size: 20,
                          ),
                          onPressed: () => _handleUpvote(index),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          post.upvotes.toString(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_downward,
                            color: post.isDownvoted
                                ? Theme.of(context).colorScheme.error
                                : Colors.white.withOpacity(0.6),
                            size: 20,
                          ),
                          onPressed: () => _handleDownvote(index),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    // Comments button
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white.withOpacity(0.6),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          post.comments.toString(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    // Share button
                    Icon(
                      Icons.share,
                      color: Colors.white.withOpacity(0.6),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 