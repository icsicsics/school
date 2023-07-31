import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/config/routes/app_routes.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:schools/presentation/screens/channels/widgets/channel_video_widget.dart';
import 'package:share_plus/share_plus.dart';

class ChannelsScreen extends BaseStatefulWidget {
  final String type;
  final List<ChannelsData> videos;
  const ChannelsScreen({
    Key? key,
    required this.type,
    this.videos = const [],
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() {
    return _ChannelsScreenState();
  }
}

class _ChannelsScreenState extends BaseState<ChannelsScreen> {
  ChannelsBloc get _bloc => BlocProvider.of<ChannelsBloc>(context);

  List<ChannelsData> _channels = [];
  String _token = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getToken();
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
        } else if (state is NavigateToLoginScreenState) {
          _navigateToLoginScreen();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.type == "media" ? S.of(context).myMedia: S.of(context).ejabiChannel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: _token.isNotEmpty
                ? InkWell(
                    onTap: () {
                      _bloc.add(NavigateBackEvent());
                    },
                    child: SvgPicture.asset(
                      ImagesPath.arrowBackIcon,
                      height: 20,
                      width: 20,
                      matchTextDirection: true,
                      fit: BoxFit.scaleDown,
                    ),)
                : null,
          ),
          body: SizedBox(
            child: Column(
              children: [
                if (_token.isEmpty) _buildHeaderSection(context),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _channels.length,
                    itemBuilder: (context, index) {
                      return ChannelsVideoWidget(
                        channelsData: _channels[index],
                        channels: _channels,
                        type: widget.type,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
      width: double.infinity,
      color: const Color.fromRGBO(59, 187, 172, 0.12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPath.logo,
            width: 100,
            height: 100,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            S.of(context).welcomeToEjabiChannelArabic,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
          Text(
            S.of(context).welcomeToEjabiChannelEnglish,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(59, 187, 172, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            onPressed: () {
              _bloc.add(const NavigateToLoginScreenEvent());
            },
            child: Text(
              S.of(context).toEnterApp,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _getChannels() {
    if(widget.type == "media"){
      _bloc.emit(GetChannelsSuccessState(channelsData: widget.videos));
    } else {
      _bloc.add(GetChannelsEvent(
        type: widget.type,
      ));
    }
  }

  void _getToken() async {
    _token = await SharedPreferencesManager.getTokenDio() ?? "";
    _getChannels();
  }

  void _navigateToLoginScreen() {
    Navigator.pushNamed(
      context,
      AppRoutes.login,
    );
  }
}
