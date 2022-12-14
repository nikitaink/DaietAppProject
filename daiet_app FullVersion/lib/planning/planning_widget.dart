import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../planningdetails/planningdetails_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanningWidget extends StatefulWidget {
  const PlanningWidget({Key? key}) : super(key: key);

  @override
  _PlanningWidgetState createState() => _PlanningWidgetState();
}

class _PlanningWidgetState extends State<PlanningWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PlanningRecord>>(
      stream: queryPlanningRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Personaliza cómo se ve el widget cuando se está cargando.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPumpingHeart(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 40,
              ),
            ),
          );
        }
        List<PlanningRecord> planningPlanningRecordList = snapshot.data!;
        // Devuelve un Contenedor vacío cuando el documento no existe.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final planningPlanningRecord = planningPlanningRecordList.isNotEmpty
            ? planningPlanningRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Planificaciones',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<PlanningRecord>>(
                    stream: queryPlanningRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Personaliza cómo se ve el widget cuando se está cargando.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SpinKitPumpingHeart(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 40,
                            ),
                          ),
                        );
                      }
                      List<PlanningRecord> listViewPlanningRecordList =
                          snapshot.data!;
                      // Devuelve un Contenedor vacío cuando el documento no existe.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final listViewPlanningRecord =
                          listViewPlanningRecordList.isNotEmpty
                              ? listViewPlanningRecordList.first
                              : null;
                      return ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          // Fecha de la planificación
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x2E000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            dateTimeFormat(
                                              'd/M/y',
                                              planningPlanningRecord!
                                                  .fechaPlanificacion!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PlanningdetailsWidget(),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayLight,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
