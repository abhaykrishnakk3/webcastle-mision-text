import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mision_text_webcastle/screen/widgets/cart_widget.dart';
import 'package:mision_text_webcastle/serviece/api_serviece.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiservces = ApiServices();

  @override
  void initState() {
    apiservces.getallFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: apiservces.alldatamodel!.data.homeFields[0]
                                .carouselItems![0].image ==
                            null
                        ? const NetworkImage(
                            "https://t4.ftcdn.net/jpg/01/42/38/57/360_F_142385725_rd3W016zDdeXPmJBmruSoxE7uA9gm8CT.jpg")
                        : NetworkImage(apiservces.alldatamodel!.data
                            .homeFields[0].carouselItems![0].image),
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Shop By Brands",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            shopByBrands(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Our Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
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
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(apiservces
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
                            apiservces.alldatamodel!.data.homeFields[2]
                                .categories![index].name,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: apiservces
                      .alldatamodel!.data.homeFields[2].categories!.length),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: apiservces.alldatamodel!.data.homeFields[3].image ==
                            null
                        ? const NetworkImage(
                            "https://t4.ftcdn.net/jpg/01/42/38/57/360_F_142385725_rd3W016zDdeXPmJBmruSoxE7uA9gm8CT.jpg")
                        : NetworkImage(
                            apiservces.alldatamodel!.data.homeFields[3].image!),
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "New Arrivals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "40% Off",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.green),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                )
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(apiservces
                                          .alldatamodel!
                                          .data
                                          .homeFields[4]
                                          .products![index]
                                          .image))),
                            ),
                            const Text(
                              "Les ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "AED500.00 ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "AED484.00 per Dozen ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        "RFQ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: apiservces
                      .alldatamodel!.data.homeFields[4].products!.length),
            )
          ]),
        ),
      ),
    );
  }

  Widget shopByBrands() {
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
                      backgroundImage: apiservces.alldatamodel!.data
                                  .homeFields[1].brands![index].image !=
                              null
                          ? NetworkImage(apiservces.alldatamodel!.data
                              .homeFields[1].brands![index].image)
                          : const NetworkImage(
                              "https://t4.ftcdn.net/jpg/01/42/38/57/360_F_142385725_rd3W016zDdeXPmJBmruSoxE7uA9gm8CT.jpg")),
                  Text(
                    apiservces.alldatamodel!.data.homeFields[1].brands![index]
                                .name ==
                            null
                        ? "empty"
                        : apiservces.alldatamodel!.data.homeFields[1]
                            .brands![index].name,
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
          itemCount:
              apiservces.alldatamodel!.data.homeFields[1].brands!.length),
    );
  }
}
