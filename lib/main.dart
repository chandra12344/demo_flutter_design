import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = ScrollController();
  double _buttonWidth = 156.0;
  bool check = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          check = false;
          _buttonWidth = 0.0;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Scrolling up, show the button
        setState(() {
          check = true;
          _buttonWidth = 56.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 500.0,
            floating: false,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzSiQcA8RC6dZyCw342nGPoIKVp3JbawfEdw&usqp=CAU',
                    // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: check
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Eiffel Tower',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: check
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              // Replace with your desired icon
                              color: Colors
                                  .white, // Replace with your desired icon color
                            ),
                            SizedBox(width: 8),
                            // Add some space between the icon and text
                            Text(
                              'Paris France',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 16.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_downward_outlined,
                          // Replace with your desired icon
                          color: Colors
                              .white, // Replace with your desired icon color
                        ),
                        Spacer(),
                        Icon(
                          Icons.favorite_outline_outlined,
                          // Replace with your desired icon
                          color: Colors
                              .white, // Replace with your desired icon color
                        ),
                        SizedBox(
                          width: 30.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageRowWithRoundedCorners(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Locally nicknamed "La dame de fer" (French for "Iron Lady"), it was constructed as the center piece of the 1889 Worlds Fair, and to crown the centennial anniversary of the French Revolution.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'READ MORE...',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.redAccent),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        VideoPlayerWithRoundedCorners(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'TOP SIGHTS',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.redAccent),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            // Container background color
                            borderRadius: BorderRadius.circular(
                                16.0), // Border radius for rounded corners
                          ),
                          child: Row(
                            children: [
                              _buildRoundedImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSm5rP5EYm5-83RRGjEDNt8xK-7pM4amuNCw&usqp=CAU'),
                              SizedBox(
                                width: 20.0,
                              ),
                              const Expanded(
                                  child: Text(
                                'Locally nicknamed centennial anniversary of the French Revolution.',
                                style: TextStyle(fontSize: 16.0),
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            // Container background color
                            borderRadius: BorderRadius.circular(
                                16.0), // Border radius for rounded corners
                          ),
                          child: Row(
                            children: [
                              _buildRoundedImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSm5rP5EYm5-83RRGjEDNt8xK-7pM4amuNCw&usqp=CAU'),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                  child: const Text(
                                'Locally nicknamed centennial anniversary of the French Revolution.',
                                style: TextStyle(fontSize: 16.0),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: !check
          ? Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.flight_takeoff,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    const Text(
                      "Search Flights",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.green, // Set the button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the button border radius
                          ),
                        ),
                        child: const Text("On Sale"))
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                width: 100,
                height: 56.0,
                duration: const Duration(milliseconds: 300),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    // Add your action here
                  },
                  child: const Icon(Icons.flight_takeoff),
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildRoundedImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      // Border radius for individual images
      child: Image.network(
        imageUrl,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color backgroundColor;

  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class ImageRowWithRoundedCorners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Container background color
        borderRadius:
            BorderRadius.circular(16.0), // Border radius for rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRoundedImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSm5rP5EYm5-83RRGjEDNt8xK-7pM4amuNCw&usqp=CAU'),
          Spacer(),
          _buildRoundedImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzSiQcA8RC6dZyCw342nGPoIKVp3JbawfEdw&usqp=CAU'),
          Spacer(),
          _buildRoundedImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzSiQcA8RC6dZyCw342nGPoIKVp3JbawfEdw&usqp=CAU'),
        ],
      ),
    );
  }

  Widget _buildRoundedImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      // Border radius for individual images
      child: Image.network(
        imageUrl,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class VideoPlayerWithRoundedCorners extends StatefulWidget {
  @override
  _VideoPlayerWithRoundedCornersState createState() =>
      _VideoPlayerWithRoundedCornersState();
}

class _VideoPlayerWithRoundedCornersState
    extends State<VideoPlayerWithRoundedCorners> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // Replace the video URL with your actual video URL
    _videoPlayerController = VideoPlayerController.network(
        'https://pixabay.com/videos/tower-eiffel-tower-france-fireworks-53848/');

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Container background color
        borderRadius:
            BorderRadius.circular(16.0), // Border radius for container
      ),
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        // Border radius for video player
        child: Chewie(controller: _chewieController),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
