import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PropertiesPreView extends StatefulWidget {
  final String url;
  final String status;
  const PropertiesPreView({Key? key, required this.url, required this.status})
      : super(key: key);

  @override
  State<PropertiesPreView> createState() => _PropertiesPreViewState();
}

class _PropertiesPreViewState extends State<PropertiesPreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
            //  Image.network(
            //   baseurl + widget.model.img,
            //   fit: BoxFit.cover,
            // ),
            widget.status == "PAN"
                ? Panorama(
                    child: Image.network(
                      widget.url,
                      loadingBuilder: (context, child, loadingProgress) {
                        return CircularProgressIndicator();
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.url,
                      imageBuilder: (context, imageProvider) => Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
