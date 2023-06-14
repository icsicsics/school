import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/channels/widgets/channel_video_widget.dart';
import 'package:share_plus/share_plus.dart';

class ChannelsScreen extends BaseStatefulWidget {
  const ChannelsScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() {
    return _ChannelsScreenState();
  }
}

class _ChannelsScreenState extends BaseState<ChannelsScreen> {
  List<ChannelsData> _channels = [];
  String token = "";
  bool isShowChannel = false;

  @override
  void initState() {
    super.initState();
    _getChannels();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    token = await SharedPreferencesManager.getTokenDio() ?? "";
  }

  void _getChannels() {
    BlocProvider.of<ChannelsBloc>(context).add(GetChannelsEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ChannelsBloc, ChannelsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetChannelsSuccessState) {
          _channels = state.channelsData;
        } else if (state is GetChannelsErrorState) {
          //Todo show error
        } else if (state is NavigateBackState) {
          Navigator.pop(context);
        } else if (state is UpdateVideoState) {
          for (var item in _channels) {
            if (item.id == state.channelsData.id) {
              item = state.channelsData;
              break;
            }
          }
        } else if (state is ShareVideoState) {
          Share.share(state.url);
        }
      },
      builder: (context, state) {
        return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Color.fromRGBO(59, 187, 172, 0.12),
            //   leading: isShowChannel == false
            //       ? SizedBox.shrink()
            //       : InkWell(
            //           onTap: () {
            //             BlocProvider.of<ChannelsBloc>(context)
            //                 .add(NavigateBackEvent());
            //           },
            //           child: Icon(
            //             Icons.arrow_back,
            //             color: Colors.black,
            //           ),
            //         ),
            //   title: Text(
            //     'Ejabi',
            //     style: TextStyle(
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            body: Container(
          margin: EdgeInsets.symmetric(),
          child: Column(
            children: [
              if (token.isEmpty)
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
                  width: double.infinity,
                  color: Color.fromRGBO(59, 187, 172, 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagesPath.logo,
                        width: 100,
                        height: 100,
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text("مرحبا بك في قناة إيجابي",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0)),
                      Text("Welcome to Ejabi Channel",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0)),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(59, 187, 172, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onPressed: () async {
                          _navigateToLoginScreen(context);
                        },
                        child: Text(
                          S.of(context).toEnterApp,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text("Hey There !",
                      //         style: TextStyle(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.bold)),
                      //     SizedBox(
                      //       height: 12,
                      //     ),
                      //     Text("Log in or create a new account",
                      //         style: TextStyle(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.normal)),
                      //     SizedBox(
                      //       height: 16,
                      //     ),

                      // ],
                      // ),
                      // const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _channels.length,
                  itemBuilder: (context, index) {
                    return ChannelsVideoWidget(
                      channelsData: _channels[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
      },
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    //   return const LoginScreen();
    // }), (route) => false);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }
}
