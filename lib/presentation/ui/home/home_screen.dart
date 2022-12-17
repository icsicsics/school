import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/ui/home/widgets/home_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/side_menu_screen.dart';

class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  HomeBloc get _homeBloc => BlocProvider.of<HomeBloc>(context);
  bool _isFather = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    _homeBloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const SideMenuScreen(
        isComFromHome: true,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is GetIsFatherState) {
            _isFather = state.isFather;
          }
        },
        builder: (context, state) {
          return HomeContentWidget(globalKey: _key, isFather: _isFather);
        },
      ),
    );
  }
}
