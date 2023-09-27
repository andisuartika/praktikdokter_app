import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';
import 'package:praktik_dokter/pages/home/search_screen.dart';
import 'package:praktik_dokter/pages/pasien/periksa_screen.dart';

import '../../../theme.dart';
import '../../pasien/pasien_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 290,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFECF0F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ),
                          );
                        },
                        // controller: searchController,
                        // onChanged: searching,
                        decoration: InputDecoration.collapsed(
                          hintText: 'search pasien',
                          hintStyle: secondaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Iconsax.search_normal_1,
                      size: 20,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasienScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Iconsax.add,
                    color: whiteColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
