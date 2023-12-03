import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                    'https://upload.wikimedia.org/wikipedia/commons/0/06/India_Gate_%2CDelhi_%2C_India.jpg',
                    // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                ),
                 Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Column(
                    children:  [
                      const Text(
                        'Eiffel Tower',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on_outlined, // Replace with your desired icon
                            color: Colors.white, // Replace with your desired icon color
                          ),
                          SizedBox(width: 8), // Add some space between the icon and text
                          Text(
                            'Paris France',
                            style: TextStyle(fontSize: 14,color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 16.0,
                  child: SizedBox(
                        width: MediaQuery.of(context).size.height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on_outlined, // Replace with your desired icon
                              color: Colors.white, // Replace with your desired icon color
                            ),
                          Spacer(), // Add some space between the icon and text
                            Text(
                              'Paris France',
                              style: TextStyle(fontSize: 14,color: Colors.white),
                            ),
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
                padding: EdgeInsets.only(left: 20.0,right: 20.0),
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
                          primary: Colors.green, // Set the button background color
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
