import 'package:bokiaa/core/constant/assets_icon.dart';
import 'package:bokiaa/core/functions/navigation.dart';
import 'package:bokiaa/core/utils/appcolors.dart';
import 'package:bokiaa/core/utils/text_style.dart';
import 'package:bokiaa/core/widgets/custom_button.dart';
import 'package:bokiaa/feature/home/presentation/page/bookDetails/book_detail_view.dart';
import 'package:bokiaa/feature/search/presentation/bloc/search_bloc.dart';
import 'package:bokiaa/feature/search/presentation/bloc/search_event.dart';
import 'package:bokiaa/feature/search/presentation/bloc/search_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: 41,
                height: 41,
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Appcolors.borderColor)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  iconSize: 20,
                ),
              ),
            ],
          )),
      body: BlocProvider(
        create: (context) => SearchBloc(),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            var search = context.read<SearchBloc>().searchResponseModel?.data;
            return SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: (Column(children: [
                      TextFormField(
                        controller: context.read<SearchBloc>().searchController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<SearchBloc>().add(GetSearchEvent(
                                      context
                                          .read<SearchBloc>()
                                          .searchController
                                          .text));
                                },
                                icon: SvgPicture.asset(AssetsIcon.searchSvg)),
                            hintText: "Search",
                            hintStyle: AppTextStyle.getbodymTextStyle(context,
                                fontSize: 18, color: Appcolors.darkgreyColor)),
                        autocorrect: true,
                      ),
                      const Gap(30),
                      if (search?.products?.isNotEmpty == true)
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: search?.products?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 163 / 281,
                                    mainAxisExtent: 300),

                            // ignore: avoid_types_as_parameter_names
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  push(
                                      context,
                                      const BookDetailView(
                                          // product:"",
                                          ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Appcolors.secondaryColor,
                                  ),
                                  width: 163,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Hero(
                                            tag: search?.products?[index].id ??
                                                "",
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: CachedNetworkImage(
                                                imageUrl: search
                                                        ?.products?[index]
                                                        .image ??
                                                    "",
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Gap(5),
                                        Text(
                                          search?.products?[index].name ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle.getTtileTextStyle(
                                              context,
                                              fontSize: 16),
                                        ),
                                        const Gap(5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              search?.products?[index].price ??
                                                  "",
                                              style: AppTextStyle
                                                  .getTtileTextStyle(context,
                                                      fontSize: 16),
                                            ),
                                            CustomButton(
                                              text: "Buy",
                                              onPressed: () {},
                                              color: Appcolors.blackColor,
                                              width: 72,
                                              height: 27,
                                              fontsize: 14,
                                              textColor: Appcolors.whiteColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                    ]))));
          },
        ),
      ),
    );
  }
}
