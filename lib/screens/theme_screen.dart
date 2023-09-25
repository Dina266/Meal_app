// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:meal/providers/theme_providers.dart';
// import 'package:provider/provider.dart';
// import '../widgets/main_drawer.dart';

// class ThemeScreen extends StatelessWidget {
//   static const routeName = '/themes';


//   Widget buildRadioListTile (
//     ThemeMode themeVal , String txt , IconData? icon , BuildContext ctx
//   ) {
//     return RadioListTile(
//       secondary: Icon(icon , color: Colors.white,),
//       value: themeVal,
//       groupValue: Provider.of<ThemeProvider> (ctx , listen: true).tm, 
//       onChanged: (newThemeVal) => Provider.of<ThemeProvider> (ctx  , listen: false).themeModeChange(newThemeVal),
//       title: Text(txt),);

//   }

//   @override
//   Widget build(BuildContext context) {
    
//     // final Map<String, bool> currentFilters  = Provider.of<MealProvider>(context , listen: true).filters;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Themes'),
//       ),
//       drawer:MainDrawer(),
//       body: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(20),
//             child: Text(
//               'Adjust your themes selection.',
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   child: Text('Choose your Theme Mode' , 
//                   style: Theme.of(context).textTheme.titleMedium,),
//                 ),

//                 buildRadioListTile(ThemeMode.system, 'System Default Theme', null, context),
//                 buildRadioListTile(ThemeMode.light, 'Light Theme', Icons.wb_sunny_outlined, context),
//                 buildRadioListTile(ThemeMode.dark, 'Dark Theme', Icons.nights_stay_outlined, context),
//                 buildListTile (context , 'primary'),
//                 buildListTile (context , 'hint'),

//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// ListTile buildListTile (BuildContext context  , txt) {
//     var primaryColor =
//         Provider.of<ThemeProvider>(context, listen: true).primaryColor;
//     var hintColor =
//         Provider.of<ThemeProvider>(context, listen: true).hintColor;

//     return ListTile(
//       title: Text(
//           'Choose your $txt color',
//           style: Theme.of(context).textTheme.titleMedium),
//       trailing: CircleAvatar(
//           backgroundColor: txt == "primary" ? primaryColor : hintColor),
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               elevation: 4,
//               titlePadding: const EdgeInsets.all(0.0),
//               contentPadding: const EdgeInsets.all(0.0),
//               content: SingleChildScrollView(
//                 child: ColorPicker(
//                   pickerColor: txt == "primary"
//                       ? Provider.of<ThemeProvider>(context, listen: true)
//                           .primaryColor
//                       : Provider.of<ThemeProvider>(context, listen: true)
//                           .hintColor,
//                   onColorChanged: (newColor) =>
//                       Provider.of<ThemeProvider>(context, listen: false)
//                           .onChanged(newColor, txt == "primary" ? 1 : 2),
//                   colorPickerWidth: 300.0,
//                   pickerAreaHeightPercent: 0.7,
//                   enableAlpha: false,
//                   showLabel: true,
//                   displayThumbColor: true,
//                   paletteType: PaletteType.hsv,
//       pickerAreaBorderRadius: const BorderRadius.only(
//         topLeft: const Radius.circular(2.0),
//         topRight: const Radius.circular(2.0),
//       ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal/providers/theme_providers.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';

class ThemeScreen extends StatelessWidget {
  static const routeName = '/themes';

  Widget buildRadioListTile(
    ThemeMode themeVal,
    String txt,
    IconData? icon,
    BuildContext ctx,
  ) {
    return RadioListTile(
      secondary: Icon(
        icon,
        color: Colors.white,
      ),
      value: themeVal,
      groupValue: Provider.of<ThemeProvider>(ctx, listen: true).tm,
      onChanged: (newThemeVal) =>
          Provider.of<ThemeProvider>(ctx, listen: false)
              .themeModeChange(newThemeVal),
      title: Text(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Themes'),
        backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your themes selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Choose your Theme Mode',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                buildRadioListTile(
                  ThemeMode.system,
                  'System Default Theme',
                  null,
                  context,
                ),
                buildRadioListTile(
                  ThemeMode.light,
                  'Light Theme',
                  Icons.wb_sunny_outlined,
                  context,
                ),
                buildRadioListTile(
                  ThemeMode.dark,
                  'Dark Theme',
                  Icons.nights_stay_outlined,
                  context,
                ),
                buildListTile(context, 'primary'),
                buildListTile(context, 'hint'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String txt) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var hintColor =
        Provider.of<ThemeProvider>(context, listen: true).hintColor;

    return ListTile(
      title: Text(
        'Choose your $txt color',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: CircleAvatar(
        backgroundColor: txt == 'primary' ? primaryColor : hintColor,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              elevation: 4,
              titlePadding: EdgeInsets.all(0.0),
              contentPadding: EdgeInsets.all(0.0),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: txt == 'primary'
                      ? Provider.of<ThemeProvider>(context, listen: true)
                          .primaryColor
                      : Provider.of<ThemeProvider>(context, listen: true)
                          .hintColor,
                  onColorChanged: (newColor) =>
                      Provider.of<ThemeProvider>(ctx, listen: false)
                          .onChanged(newColor, txt == 'primary' ? 1 : 2),
                  colorPickerWidth: 300.0,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: false,
                  showLabel: false,
                  displayThumbColor: true,
                  pickerAreaBorderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(2.0),
                    topRight: const Radius.circular(2.0),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}