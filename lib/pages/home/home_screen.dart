import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktik_dokter/bloc/history/history_bloc.dart';
import 'package:praktik_dokter/pages/home/widgets/banner_widget.dart';
import 'package:praktik_dokter/pages/home/widgets/header_widget.dart';
import 'package:praktik_dokter/pages/home/widgets/search_widget.dart';
import 'package:praktik_dokter/theme.dart';
import 'package:shimmer/shimmer.dart';

import '../base_widgets/riwayat/custom_riwayat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    context.read<HistoryBloc>().add(const HistoryEvent.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(children: [
          RefreshIndicator(
            onRefresh: _loadData,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  elevation: 0,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  title: HeaderWidgets(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverDelegate(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(color: whiteColor),
                      child: SearchWidget(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        const BannerWidget(),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Riwayat Pemeriksaan',
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View All',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 20),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  enabled: true,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: primaryColor,
                                    ),
                                  ),
                                );
                              },
                              childCount: 3,
                            ),
                          ),
                        );
                      },
                      error: (message) {
                        return SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 20),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  enabled: true,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: secondaryColor,
                                    ),
                                  ),
                                );
                              },
                              childCount: 3,
                            ),
                          ),
                        );
                      },
                      loaded: (model) {
                        return SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 20),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return CustomRiwayat(
                                  history: model.data![index],
                                );
                              },
                              childCount: model.data!.length,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 150 ||
        oldDelegate.minExtent != 150 ||
        child != oldDelegate.child;
  }
}
