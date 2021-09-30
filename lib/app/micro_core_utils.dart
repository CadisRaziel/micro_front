import 'package:flutter/widgets.dart';


//*Para realizar a navegação (vai gerenciar toda navegação)
typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object args);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();