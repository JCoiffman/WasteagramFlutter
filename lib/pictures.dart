import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Pictures {
  var picture;
  var numberOfItems;
  Location location = new Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Pictures({this.numberOfItems, this.picture});

  String getDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    final String formatted = formatter.format(now);
    print(formatted);
    return formatted;
  }

  Future retrieveLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  Future getUrl() async {
    var fileName = DateTime.now().toString() + '.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(picture!);
    await uploadTask;
    final url = await storageReference.getDownloadURL();
    return url;
  }

  void sendData() async {
    final url = await getUrl();
    await retrieveLocation();
    FirebaseFirestore.instance.collection('pictures').add({
      'picture': url,
      'date': getDate(),
      'Longitude': _locationData!.longitude,
      'Latitude': _locationData!.latitude,
      'number': numberOfItems
    });
  }
}
