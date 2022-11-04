import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/space_x_fly/block/space_x_bloc.dart';
import 'package:spacex/utils/size_config.dart';
import 'package:spacex/widget/spacex_image_network.dart';

import '../block/space_x_event.dart';
import '../block/space_x_state.dart';
import '../repository/space_x_repository.dart';

class SpaceXView extends StatelessWidget {
  const SpaceXView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey customKey = GlobalKey();
    return BlocProvider<SpaceXBloc>(
      create: (context) =>
          SpaceXBloc(SpaceXRepository())..add(SpaceXFetchEvent()),
      child: CupertinoPageScaffold(
        key: customKey,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('SpaceX Flight'),
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                customKey.currentContext
                    ?.read<SpaceXBloc>()
                    .add(SpaceXFetchEvent());
              },
            ),
            BlocBuilder<SpaceXBloc, SpaceXState>(builder: (context, state) {
              if (state is SpaceXLoadingState) {
                return loadingState();
              } else if (state is SpaceXLoadedState) {
                return blocSliverList(state);
              } else {
                return errorState();
              }
            }),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter loadingState() {
    return SliverToBoxAdapter(
        child: Center(
      child: SizedBox(
        height: 200.0.h,
        width: 200.0.w,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    ));
  }

  SliverList blocSliverList(SpaceXLoadedState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(30.0.sp!),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0.h!),
              child: Row(
                children: [
                  Expanded(
                    child: SpaceXImageNetwork(
                        imageUrl: state.data[index].links?.patch?.small),
                  ),
                  Expanded(
                    child: SpaceXImageNetwork(
                        imageUrl: state.data[index].links?.patch?.large),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          maxLines: 1,
                          state.data[index].name ?? "Flight Name Unknown",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                            state.data[index].details ??
                                "There is no explanation about the flight.",
                            style: Theme.of(context).textTheme.caption!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: state.data.length,
      ),
    );
  }

  SliverToBoxAdapter errorState() =>
      const SliverToBoxAdapter(child: Text("Error"));
}
