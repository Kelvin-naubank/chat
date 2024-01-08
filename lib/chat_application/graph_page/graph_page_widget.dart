import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'graph_page_model.dart';
export 'graph_page_model.dart';

class GraphPageWidget extends StatefulWidget {
  const GraphPageWidget({super.key});

  @override
  _GraphPageWidgetState createState() => _GraphPageWidgetState();
}

class _GraphPageWidgetState extends State<GraphPageWidget> {
  late GraphPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.backspace_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: 370.0,
            height: 345.0,
            child: FlutterFlowLineChart(
              data: [
                FFLineChartData(
                  xData: [],
                  yData: [],
                  settings: LineChartBarData(
                    color: FlutterFlowTheme.of(context).primary,
                    barWidth: 2.0,
                    isCurved: true,
                    preventCurveOverShooting: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                  ),
                )
              ],
              chartStylingInfo: ChartStylingInfo(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                showBorder: false,
              ),
              axisBounds: const AxisBounds(),
              xAxisLabelInfo: const AxisLabelInfo(),
              yAxisLabelInfo: const AxisLabelInfo(),
            ),
          ),
        ),
      ),
    );
  }
}
