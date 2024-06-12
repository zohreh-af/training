// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      decoration: _playArea == false
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.AppColor.gradientFirst.withOpacity(0.9),
                  color.AppColor.gradientSecond.withOpacity(0.9)
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              ),
            )
          : BoxDecoration(
              color: color.AppColor.gradientSecond,
            ),
      child: Column(
        children: [
          _playArea == false
              ? Container(
                  padding: const EdgeInsets.only(
                      top: 50, left: 20, right: 20), //top 70
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    children: [
                      Row(children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                            
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        ),
                      ]),
                      const SizedBox(
                        height: 50,

                        ///
                      ),
                      Text("Legs Training",
                          style: TextStyle(
                            fontSize: 20,
                            color: color.AppColor.secondPageTitleColor,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("and Glutes Workout",
                          style: TextStyle(
                            fontSize: 20,
                            color: color.AppColor.secondPageTitleColor,
                          )),
                      const SizedBox(
                        height: 40, //
                      ),
                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  color.AppColor
                                      .secondPageContainerGradient1stColor,
                                  color.AppColor
                                      .secondPageContainerGradient2ndColor,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topLeft,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "68 min",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: color.AppColor.secondPageTitleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                ),
                              ),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    width: 300,
                                    child: Expanded(
                                      child: Text(
                                        "Resistent Band Kattelbell",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              color.AppColor.secondPageTitleColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 40),
                        padding:
                            const EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                             // child: Icon(
                              //  Icons.arrow_back_ios,
                               // size: 20,
                               // color: color.AppColor.secondPageTopIconColor,
                              //),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageTopIconColor,
                            )
                          ],
                        ),
                      ),
                      _playView(context),
                      _controlView(context),
                    ],
                  ),
                ),
          Expanded(
            /////
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Circuit 1: Legs Toning",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.circuitsColor,
                        ),
                      ),
                      // const SizedBox(width: ,),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: color
                                .AppColor.secondPageContainerGradient2ndColor,
                          ),
                          Text(
                            "3 Sets",
                            style: TextStyle(
                              fontSize: 15,
                              color: color.AppColor.setsColor,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: _listView()),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  String convertTwo(int value) {
    return value < 10 ? "$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    // final duration = _controller?.value.duration;
    // final head = _controller?.value.position.inSeconds;
    // final remained = max(0, duration! - head!);
    //  final mins = convertTwo(remained ~/ 60.0);
    // final secs = convertTwo(remained % 60);

    return Container(
      alignment: Alignment.center,
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 0.8),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0)),
                ]),
                child: Icon(
                  noMute ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              if (noMute) {
                _controller?.setVolume(0);
              } else {
                _controller?.setVolume(1.0);
              }
              setState(() {});
            },
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && videoInfo.length >= 0) {
                _initializeVideo(index);
              } else {
                Get.snackbar("video", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: const Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.white,
                    ),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText: const Text(
                      "No videos ahead",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ));
              }
            },
            icon: const Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                _controller?.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                _controller?.play();
              }
            },
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= videoInfo.length - 1) {
                _initializeVideo(index);
              } else {
                Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: const Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.white,
                    ),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText: const Text(
                      "You have finished watching all the videos.Welldone!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ));
              }
            },
            icon: const Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9, child: Center(child: Text("prepairing...")));
    }
  }

  var _onUpdateControllerTime;

  //var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now * 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can't initialize");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;

    //duration
    //if (duration == null) return;
  }

  _initializeVideo(int index) {
    final controller =
        VideoPlayerController.asset(videoInfo[index]["videoUrl"]);
    // final controller = VideoPlayerController.networkUrl(
    //  Uri.parse(videoInfo[index]["videoUrl"]));
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller.initialize().then((_) {
      old?.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _initializeVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      //color: Colors.red.withOpacity(0.2),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(videoInfo[index]["thumbnail"]),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      videoInfo[index]["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //const SizedBox(height: 10,)
                  Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        videoInfo[index]["time"],
                        style: TextStyle(
                          color: color
                              .AppColor.secondPageContainerGradient2ndColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child:
                    // center nmisheh?
                    Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "15 Sec Rest",
                      style: TextStyle(
                        color: color.AppColor.homePageIcons,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  for (int i = 0; i < 82; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 135, 135, 135),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
