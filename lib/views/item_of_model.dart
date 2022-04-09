import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_provider/viewModel/home_view_model.dart';

import '../models/models.dart';


//homeViewModel dagi funcsiyani ( post , delete ) ni ishlatish uchun joy
//list view ni ichidagi widgetni ishini shu yerda yozib ishlatamiz

Widget itemOfPost(HomeViewModel viewModel , Post post) {
  return Slidable(
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(post.body!),
        ],
      ),
    ),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          label: 'Update',
          backgroundColor: Colors.indigo,
          icon: Icons.edit,
          onPressed: (BuildContext context) {
            viewModel.apiPostDelete(post);
          },
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (context) {
            viewModel.apiPostDelete(post);
          },
        ),
      ],
    ),
  );
}