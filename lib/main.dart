import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      builder: (BuildContext context)=> MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        body: Container(
          color: Colors.black,
          width: screenWidth / 2,
          height: screenHight / 2,
          child: Center(
            child: LayoutBuilder(
              builder: (context,constrains) {
                var deviceType = getDeviceType(mediaQueryData);
                print(deviceType);
                double localHeight = constrains.maxHeight;
                double localWidth = constrains.maxWidth;
                return Container(
                  color: Colors.red,
                  width: localWidth/2,
                  height: localHeight/2,
                  child: Center(
                    child: Text("acsadcd"),
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  DeviceType getDeviceType(MediaQueryData mediaQueryData)
  {
    Orientation orientation = mediaQueryData.orientation;
    double width = 0;
    if(orientation == Orientation.landscape)
    {
      width = mediaQueryData.size.height;
    }else{
      width = mediaQueryData.size.width;
    }
    if(width >= 950)
      {
        return DeviceType.Desktop;
      }
    if(width >= 600)
      {
        return DeviceType.Tablet;
      }
    return DeviceType.Mobile;
  }
}


enum DeviceType{
  Mobile,
  Tablet,
  Desktop
}
