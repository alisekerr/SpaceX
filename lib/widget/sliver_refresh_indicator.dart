import 'package:flutter/cupertino.dart';

class SliverRefreshIndicator extends StatefulWidget {
  final String? title;
  final Widget listWidget;

  final Future Function() onRefresh;
  const SliverRefreshIndicator(
      {super.key,
      this.title,
      required this.listWidget,
      required this.onRefresh});

  @override
  State<SliverRefreshIndicator> createState() => _SliverRefreshIndicatorState();
}

class _SliverRefreshIndicatorState extends State<SliverRefreshIndicator> {
  @override
  Widget build(BuildContext context) => _buildSliverRefresh();

  Widget _buildSliverRefresh() => CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(widget.title ?? ""),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              widget.onRefresh;
            },
          ),
          widget.listWidget,
        ],
      );
}
