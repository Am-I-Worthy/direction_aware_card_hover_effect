import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
              index: 0,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
              index: 1,
            ),
            InteractiveCard(
              image:
                  'https://images.unsplash.com/photo-1485893226355-9a1c32a0c81e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}

StreamController<int> controller = StreamController<int>.broadcast();
Stream<int> stream = controller.stream;

class InteractiveCard extends StatefulWidget {
  final String image;
  final int index;
  final String? title;
  final String? description;
  const InteractiveCard(
      {Key? key,
      required this.image,
      required this.index,
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
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
    _animation = Tween(begin: 0.0, end: -math.pi / 6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: StreamBuilder<int>(
        stream: stream,
        initialData: -1,
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (!snapshot.hasData) {
            controller.add(-1);
            return const SizedBox();
          }
          if (snapshot.data == -1) {
            _controller.animateBack(0.0);
          } else if (snapshot.data != widget.index) {
            if (snapshot.data! > widget.index) {
              _animation = Tween(begin: 0.0, end: -math.pi / 6).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.ease));
            } else {
              _animation = Tween(begin: 0.0, end: math.pi / 6).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.ease));
            }
            _controller.forward();
          } else {
            _controller.animateBack(0.0);
          }
          return MouseRegion(
            onEnter: (event) {
              controller.add(widget.index);
            },
            onExit: (event) {
              controller.add(-1);
            },
            child: AnimatedBuilder(
              animation: _animation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                height: (snapshot.data != -1 && widget.index == snapshot.data)
                    ? 380.0
                    : 300.0,
                width: (snapshot.data != -1 && widget.index == snapshot.data)
                    ? 380.0
                    : 300.0,
                decoration: BoxDecoration(
                    boxShadow:
                        (snapshot.data != -1 && widget.index == snapshot.data)
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
                    LayoutBuilder(
                      builder: (context, child) {
                        return AnimatedOpacity(
                          duration: const Duration(milliseconds: 375),
                          opacity: (snapshot.data != -1 &&
                                  widget.index == snapshot.data)
                              ? 1.0
                              : 0.0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 375),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.blue[200]!.withOpacity(0.7),
                            ),
                            padding: EdgeInsets.only(
                              top: (snapshot.data != -1 &&
                                      widget.index == snapshot.data)
                                  ? 00.0
                                  : 200.0,
                            ),
                            child: Center(
                              child: OverflowBox(
                                minWidth: 340.0,
                                maxWidth: 341.0,
                                minHeight: 300.0,
                                maxHeight: 301.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      },
                    ),
                  ],
                ),
              ),
              builder: (context, child) {
                return Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_animation.value),
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
