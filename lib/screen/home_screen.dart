import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mision_text_webcastle/model/all_data_model.dart';
import 'package:mision_text_webcastle/screen/widgets/cart_widget.dart';
import 'package:mision_text_webcastle/screen/widgets/text_viewall.dart';
import 'package:mision_text_webcastle/serviece/api_serviece.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // context.read<ApiServices>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 244, 244),
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Serach",
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 29,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Scan Here",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Icon(
                          Icons.qr_code_2,
                          size: 25,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome,james!",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
            size: 35,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ApiServices>(builder: (context, value, child) {
            return value.check == false
                ? CircularProgressIndicator()
                : Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: value.alldatamodel!.data.homeFields[0]
                                    .carouselItems![0].image.isEmpty
                                ? const NetworkImage(
                                    "https://t4.ftcdn.net/jpg/01/42/38/57/360_F_142385725_rd3W016zDdeXPmJBmruSoxE7uA9gm8CT.jpg")
                                : NetworkImage(value.alldatamodel!.data
                                    .homeFields[0].carouselItems![0].image),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextAndViewAll(name: "Shop and Brands"),
                    shopByBrands(value.alldatamodel!.data.homeFields[1].brands),
                    const SizedBox(
                      height: 20,
                    ),
                    TextAndViewAll(name: "Our Categories"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: double.infinity,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(value
                                        .alldatamodel!
                                        .data
                                        .homeFields[2]
                                        .categories![index]
                                        .image),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    value.alldatamodel!.data.homeFields[2]
                                        .categories![index].name,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const Divider();
                          },
                          itemCount: value.alldatamodel!.data.homeFields[2]
                              .categories!.length),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: value.alldatamodel!.data.homeFields[3]
                                        .image ==
                                    null
                                ? const NetworkImage(
                                    "https://t4.ftcdn.net/jpg/01/42/38/57/360_F_142385725_rd3W016zDdeXPmJBmruSoxE7uA9gm8CT.jpg")
                                : NetworkImage(value
                                    .alldatamodel!.data.homeFields[3].image!),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextAndViewAll(
                      name: "New Arrivals",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return CartWidget(
                              name: value.alldatamodel!.data.homeFields[4]
                                  .products![index].name
                                  .toString(),
                              image: value.alldatamodel!.data.homeFields[4]
                                  .products![index].image,
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return Divider();
                          },
                          itemCount: value.alldatamodel!.data.homeFields[4]
                              .products!.length),
                    )
                  ]);
          }),
        ),
      ),
    );
  }

  Widget shopByBrands(List<Brand>? brand) {
    // ApiServices apiservces = ApiServices();
    return Container(
      color: const Color.fromARGB(255, 251, 244, 244),
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.0,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: brand[index].image != null
                          ? NetworkImage(brand[index].image)
                          : const NetworkImage(
                              "https://t4.ftcdn.net/jpg/01/42/38/57/360_F_142385725_rd3W016zDdeXPmJBmruSoxE7uA9gm8CT.jpg")),
                  Text(
                    brand[index].name == null ? "empty" : brand[index].name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider(
              color: Colors.white,
            );
          },
          itemCount: brand!.length),
    );
  }
}
