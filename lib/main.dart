import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interacive Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 0,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 1,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1485893226355-9a1c32a0c81e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 2,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 3,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 4,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1485893226355-9a1c32a0c81e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 5,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 6,
              selectedIndex: selectedIndex,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1485893226355-9a1c32a0c81e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
              onEnter: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              onExit: (index) {
                setState(() {
                  selectedIndex = -1;
                });
              },
              index: 7,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class InteractiveCard extends StatefulWidget {
  final String image;
  final Function onEnter;
  final Function onExit;
  final int index;
  final int selectedIndex;
  final String? title;
  final String? description;
  const InteractiveCard(
      {Key? key,
      required this.image,
      required this.onEnter(int index),
      required this.onExit(int index),
      required this.index,
      required this.selectedIndex,
      this.title,
      this.description})
      : super(key: key);

  @override
  State<InteractiveCard> createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 375));
    _animation = Tween(begin: 0.0, end: -math.pi / 6)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  double size = 300.0;

  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex == -1) {
      _controller.animateBack(0.0);
    } else if (widget.selectedIndex != widget.index) {
      if (widget.selectedIndex > widget.index) {
        _animation = Tween(begin: 0.0, end: -math.pi / 6)
            .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      } else {
        _animation = Tween(begin: 0.0, end: math.pi / 6)
            .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      }
      _controller.forward();
    } else {
      _controller.animateBack(0.0);
    }
    return Flexible(
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            widget.onEnter(widget.index);
            size = 380.0;
          });
        },
        onExit: (event) {
          setState(() {
            widget.onExit(widget.index);
            size = 300.0;
          });
        },
        child: AnimatedBuilder(
          animation: _animation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 375),
            height: size,
            width: size,
            decoration: BoxDecoration(
                boxShadow: (widget.selectedIndex != -1 &&
                        widget.index == widget.selectedIndex)
                    ? [
                        const BoxShadow(
                          offset: Offset(0.0, 10.0),
                          blurRadius: 30.0,
                          color: Colors.black38,
                        )
                      ]
                    : []),
            child: Stack(
              children: [
                Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                  height: 400.0,
                  width: 400.0,
                ),
                LayoutBuilder(builder: (context, child) {
                  print(child.maxWidth);
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 375),
                    opacity: (widget.selectedIndex != -1 &&
                            widget.index == widget.selectedIndex)
                        ? 1.0
                        : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 375),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.blue[200]!.withOpacity(0.7),
                      ),
                      padding: EdgeInsets.only(
                          top: (widget.selectedIndex != -1 &&
                                  widget.index == widget.selectedIndex)
                              ? 00.0
                              : 200.0,),
                      child: Center(
                        child: OverflowBox(
                          minWidth: child.maxWidth-1,
                          maxWidth: child.maxWidth,
                          minHeight: 300.0,
                          maxHeight: 301.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title ?? 'Title',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                      fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Flexible(
                                  child: Text(
                                    widget.description ??
                                        'Lorem ipsum dolor sit amet. A cumque molestias quo dolores consequatur et rerum nihil ea vitae eligendi et itaque iste. Ea fugiat eaque quo odit tempora qui unde iure sed repellat voluptatem. Eum perferendis galisum sed saepe itaque qui soluta amet id fugiat sequi aut necessitatibus blanditiis ex ipsum perspiciatis qui voluptatem enim.',
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          builder: (context, child) {
            return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animation.value),
                child: child);
          },
        ),
      ),
    );
  }
}
