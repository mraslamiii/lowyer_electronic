import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kanoon_dadgostari/models/base/base_response.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/models/entity/basket/service_entity.dart';
import 'package:kanoon_dadgostari/repo/acceptor/category/category_repo.dart';
import 'package:video_player/video_player.dart';

import '../../../../utilites/app_logger.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';
import '../../../../web_providers/api_endpoints.dart';

class WelfareCenterDetailController extends GetxController with StateMixin<DetailCategoryModel>{

  final CategoryRepo _repo = CategoryRepo();
   late DetailCategoryModel rpm;
   bool isError = false;
  late VideoPlayerController videoPlayerController; //create an instance of videoPlayerController class instance
  ChewieController? chewieController;



  Future<void> initializePlayer() async{
/*Constructs a VideoPlayerController playing a video from obtained from the network.
* it will initialize when onInit Called */

    String url  = "${APIEndpoint.mediaURL}/${rpm.profile.video}";


    videoPlayerController = VideoPlayerController.network(
        url);
//it mean this future function will wait till videoPlayerController initialize
    await Future.wait([videoPlayerController.initialize()]);

    //create instance of chewieController
    chewieController = ChewieController(
      aspectRatio: 16/9,
        videoPlayerController: videoPlayerController, //The controller for the video you want to play
        autoPlay: false,//Play the video as soon as it's displayed
        looping: false,//Whether or not the video should loop
        materialProgressColors: ChewieProgressColors(//The colors to use for the Material Progress Bar. By default, the Material player uses the colors from your Theme.
            playedColor: Get.theme.primaryColor,
            handleColor: Colors.grey.shade100,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.grey.shade500
        ),
        placeholder: Container(//The placeholder is displayed underneath the Video before it is initialized or played.
          color: Colors.greenAccent,
        ),
        autoInitialize: true //Initialize the Video on Startup. This will prep the video for playback.
    );

    update();
  }



  // List<String> ids =['1','2','3',
  //
  //   '4',
  //   '5',
  //   '6',
  // ];
  Future getDetailCategory(String id)async{
    try{

      change(null,status: RxStatus.loading());
      rpm = await _repo.getDetailCategory(id);
      if (rpm !=null) {
        await initializePlayer();

        isError = false;
        update();
        change(rpm,status: RxStatus.success());
      }  else{
        change(null,status: RxStatus.empty());
      }

    }catch(e){
      change(null,status: RxStatus.error('$e'));
      isError = true ;
      update();
      AppLogger.e('$e');
    }
  }
  // RxInt counter = 0.obs;

  ///hive ////

}
