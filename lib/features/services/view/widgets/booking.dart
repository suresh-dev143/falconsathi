import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String _selection = 'current';
  TextEditingController _addressController = TextEditingController();
  String _location = '';

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _location = '${position.latitude}, ${position.longitude}';
    });
  }

  void _submitForm() {
    if (_selection == 'current') {
      print('Using current location: $_location');
    } else {
      print('Manual address: ${_addressController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Address')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile(
              title: Text("Use Current Location"),
              value: 'current',
              groupValue: _selection,
              onChanged: (value) {
                setState(() => _selection = value.toString());
              },
            ),
            RadioListTile(
              title: Text("Enter Address Manually"),
              value: 'manual',
              groupValue: _selection,
              onChanged: (value) {
                setState(() => _selection = value.toString());
              },
            ),
            SizedBox(height: 20),
            if (_selection == 'manual')
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Enter Address',
                  border: OutlineInputBorder(),
                ),
              ),
            if (_selection == 'current')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: _getCurrentLocation,
                    child: Text('Get Location'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _location.isEmpty
                        ? 'No location yet.'
                        : 'Location: $_location',
                  ),
                ],
              ),
            Spacer(),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
