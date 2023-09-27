import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktik_dokter/bloc/pasien/pasien_bloc.dart';
import 'package:praktik_dokter/pages/home/widgets/pasien_widget.dart';
import 'package:praktik_dokter/theme.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  void searching(String query) async {
    context.read<PasienBloc>().add(PasienEvent.searcPasien(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Cari Pasien",
          style: primaryTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFECF0F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                style: primaryTextStyle,
                // controller: searchController,
                onChanged: searching,
                decoration: InputDecoration.collapsed(
                  hintText: 'search pasien',
                  hintStyle: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<PasienBloc, PasienState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    error: (message) {
                      return Container(
                        child: Text(message),
                      );
                    },
                    loaded: (model) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.data!.length,
                        itemBuilder: (context, index) => PasienWidget(
                          pasien: model.data![index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
