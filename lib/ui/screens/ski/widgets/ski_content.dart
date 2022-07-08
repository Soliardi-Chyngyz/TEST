import 'package:flutter/material.dart';
import 'package:test/data/model/ski_model/ski_model.dart';
import 'package:test/ui/screens/details/ski_detail_page.dart';

class SkiContentWidget extends StatelessWidget {
  const SkiContentWidget(this.list, {Key? key}) : super(key: key);
  final List<SkiModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(SkiDetailPage.routeName, arguments: list[i]),
            child: Stack(
              children: [
                Container(
                  height: 226.0,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      stops: const [0, 5],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Image.network(
                      list[i].imageUrl ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[i].nameRu ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(fontSize: 21, height: 1.2, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6,),
                      Text(list[i].description ?? 'description пустой!', style: Theme.of(context).textTheme.bodyText2)
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
