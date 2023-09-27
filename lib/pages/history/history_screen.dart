import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktik_dokter/bloc/history/history_bloc.dart';
import 'package:praktik_dokter/theme.dart';
import 'package:shimmer/shimmer.dart';

import '../base_widgets/riwayat/custom_riwayat.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    context.read<HistoryBloc>().add(HistoryEvent.getAll());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'History Pemeriksaan',
            style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(controller: _scrollController, slivers: [
            BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
          ]),
        ],
      ),
    );
  }
}
