import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supershine/widgets/image_container.dart';
import '../model/media_resource.dart';

class ImageResourceIntegration {

  late List<MediaResource> mediaResourceList;
  late List<ImageContainer> imageContainerList = <ImageContainer>[];

  Future<List<MediaResource>> fetchAllMediaResources() async {
    final response = await http.get(Uri.parse('http://192.168.1.4:8080/MediaResourceController/fetchAllMediaResources'));

    if (response.statusCode == 200) {
      final jsonResponseBody = jsonDecode(response.body);
      mediaResourceList = (jsonResponseBody as List)
          .map((i) => MediaResource.fromJson(i))
          .toList();
      return mediaResourceList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Image Resources');
    }
  }

  Future<List<ImageContainer>> getImageContainerList() async {
    await fetchAllMediaResources().then((value) => {
      value.forEach((element) {
        print("Image id: ${element.imageUrl} & Image Id: ${element.id}");
        imageContainerList.add(ImageContainer(imageUrl: element.imageUrl));
      })
    });
      return imageContainerList;
  }
}