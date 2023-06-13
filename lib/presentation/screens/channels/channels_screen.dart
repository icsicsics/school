import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_stateful_widget.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    _getChannels();
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
        } else if(state is NavigateBackState){
          Navigator.pop(context);
        } else if (state is UpdateVideoState){
          for(var item in _channels){
            if(item.id == state.channelsData.id){
              item = state.channelsData;
              break;
            }
          }
        } else if (state is ShareVideoState){
          Share.share(state.url);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(59, 187, 172, 0.12),
              leading: InkWell(
                onTap: (){
                  BlocProvider.of<ChannelsBloc>(context).add(NavigateBackEvent());

                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'Ejabi',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _channels.length,
                itemBuilder: (context, index) {
                  return ChannelsVideoWidget(
                    channelsData: _channels[index],
                  );
                },
              ),
            ));
      },
    );
  }
}
