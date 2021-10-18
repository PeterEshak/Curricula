import 'package:curricula_apple/modules/login/login_screen.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

import '../cubit/cubit.dart';
import '../network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0,
  required void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () => function,
      child: Text(text.toUpperCase()),
    );

Container containerSignUp(
  IconData icon,
  String lText,
  String hText,
  TextEditingController controller,
) =>
    Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.send,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        toolbarOptions: const ToolbarOptions(
          copy: false,
          cut: false,
          paste: false,
          selectAll: false,
        ),
        maxLines: 1,
        maxLength: 30,
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: lText,
          hintText: hText,
        ),
        controller: controller,
        keyboardType: TextInputType.name,
      ),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  void Function()? suffixPressed,
  required String? Function(String?)? validate,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      validator: validate,
    );

Widget buildTaskItem({
  required Map model,
  required BuildContext context,
  IconData? iconDone,
  Color? colorDone,
  IconData? iconArchive,
  Color? colorArchive,
  required String type,
}) =>
    Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text("${model['time']}"),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "${model['title']}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          "${model['date']}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          " || State: ${model['status']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            type == 'new'
                ? Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'done',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconDone, //Icons.check_box
                          color: colorDone, //Colors.green
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'archive',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconArchive, //Icons.archive,
                          color: colorArchive, //Colors.black45,
                        ),
                      )
                    ],
                  )
                : type == 'done'
                    ? IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'archive',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconArchive, //Icons.archive,
                          color: colorArchive, //Colors.black45,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'done',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconDone, //Icons.check_box
                          color: colorDone, //Colors.green
                        ),
                      ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );

/*
Widget tasksBuilder({
  required List<Map> tasks,
  required IconData iconDone,
  required Color colorDone,
  required IconData iconArchive,
  required Color colorArchive,
}) =>
    ConditionalBuilder(
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context,iconDone,colorDone,iconArchive,colorArchive),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
      ),
      condition: tasks.isNotEmpty,
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              "No Tasks Yet, Please Add Some Tasks",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
*/

Widget buildArticleItem(article, context) => InkWell(
      onTap: () => navigateTo(context, WebViewScreen(url: article['url'])),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // article['urlToImage'] != 'null'
            //     ? Container(
            //         width: 120.0,
            //         height: 120.0,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.0),
            //           image: DecorationImage(
            //             image: NetworkImage('${article['urlToImage']}'),
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       )
            //     :
            SizedBox(
              width: 120.0,
              height: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  '${article['urlToImage']}',
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Image(
                      image: AssetImage('assets/images/errer.jfif'),
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15.0),
          ],
        ),
      ),
    );

Widget tasksBuilder({
  required List<Map> tasks,
  IconData? iconDone,
  Color? colorDone,
  IconData? iconArchive,
  Color? colorArchive,
  required String type,
}) =>
    Container(
      child: tasks.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) => buildTaskItem(
                type: type,
                model: tasks[index],
                context: context,
                iconDone: iconDone,
                colorDone: colorDone,
                iconArchive: iconArchive,
                colorArchive: colorArchive,
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: tasks.length,
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.menu, size: 100, color: Colors.grey),
                  Text(
                    'No Tasks Yet, Please Add Some Tasks',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
    );

// Widget buildArticleItem(article, context) {
//   return InkWell(
//     onTap: () => navigateTo(context, WebViewScreen(url: article['url'])),
//     child: Padding(
//       padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 110,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Text(
//                       '${article['title']}',
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.bodyText1,
//                       textAlign: TextAlign.end,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Expanded(
//                     child: Text(
//                       '${article['publishedAt']}',
//                       style: const TextStyle(fontSize: 11, color: Colors.grey),
//                       textAlign: TextAlign.end,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 15),
//           Container(
//             height: 110,
//             width: 110,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
//               image: DecorationImage(
//                 image: article['urlToImage'] != null
//                     ? NetworkImage('${article['urlToImage']}')
//                     : const NetworkImage(
//                         'https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/video/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_signndt9ox_thumbnail-1080_01.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget articleBuilder(list, context, isSearch) {
//   if (isSearch) {
//     if (list.length > 0) {
//       return ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.only(
//             right: 15,
//             left: 15,
//           ),
//           child: Container(
//             height: 0.3,
//             color: Colors.grey,
//           ),
//         ),
//         itemCount: list.length,
//       );
//     } else {
//       return Center(child: Container());
//     }
//   } else {
//     if (list.length > 0) {
//       return ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.only(
//             right: 15,
//             left: 15,
//           ),
//           child: Container(
//             height: 0.3,
//             color: Colors.grey,
//           ),
//         ),
//         itemCount: list.length,
//       );
//     } else {
//       return const Center(child: CircularProgressIndicator());
//     }
//   }
// }
Divider myDivider(double height) => Divider(height: height);
Widget divider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => Container(
      child: list.length > 0
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticleItem(list[index], context),
              separatorBuilder: (context, index) => divider(),
              itemCount: 15,
            )
          : isSearch
              ? Container()
              : const Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget, {arguments}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

void navigatePop(context) {
  Navigator.of(context).pop;
}

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 5,
      fontSize: 16,
      gravity: ToastGravity.CENTER,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
    );

// enum
enum ToastStates {
  sUCCESS,
  eRROR,
  wARNING,
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.sUCCESS:
      color = Colors.green;
      break;
    case ToastStates.eRROR:
      color = Colors.red;
      break;
    case ToastStates.wARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

void logOut(context) {
  CacheHelper.removeData(key: 'token');
  navigateAndFinish(context, LoginScreen());
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
