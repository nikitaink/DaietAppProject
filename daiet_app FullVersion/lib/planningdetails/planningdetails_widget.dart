import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanningdetailsWidget extends StatefulWidget {
  const PlanningdetailsWidget({Key? key}) : super(key: key);

  @override
  _PlanningdetailsWidgetState createState() => _PlanningdetailsWidgetState();
}

class _PlanningdetailsWidgetState extends State<PlanningdetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PlanningRecord>>(
      stream: queryPlanningRecord(),
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
        List<PlanningRecord> planningdetailsPlanningRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).grayLight,
                size: 32,
              ),
            ),
            title: Text(
              'Detalles',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        constraints: BoxConstraints(
                          maxWidth: 600,
                        ),
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(
                            -0.19999999999999996, 0.050000000000000044),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child:
                                          StreamBuilder<List<PlanningRecord>>(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 40,
                                                ),
                                              ),
                                            );
                                          }
                                          List<PlanningRecord>
                                              textPlanningRecordList =
                                              snapshot.data!;
                                          // Devuelve un Contenedor vacío cuando el documento no existe.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textPlanningRecord =
                                              textPlanningRecordList.isNotEmpty
                                                  ? textPlanningRecordList.first
                                                  : null;
                                          return Text(
                                            dateTimeFormat(
                                              'd/M/y',
                                              textPlanningRecord!
                                                  .fechaPlanificacion!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 20,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // tapbar con días de la semana para ver la planificación detallada del usuario
                              Expanded(
                                child: StreamBuilder<List<DiasSemanaRecord>>(
                                  stream: queryDiasSemanaRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    //Personaliza cómo se ve el widget cuando se está cargando.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: SpinKitPumpingHeart(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DiasSemanaRecord>
                                        tabBarDiasSemanaRecordList =
                                        snapshot.data!;
                                    // Devuelve un Contenedor vacío cuando el documento no existe.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final tabBarDiasSemanaRecord =
                                        tabBarDiasSemanaRecordList.isNotEmpty
                                            ? tabBarDiasSemanaRecordList.first
                                            : null;
                                    return DefaultTabController(
                                      length: 7,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            isScrollable: true,
                                            labelColor: Color(0xFFC34896),
                                            unselectedLabelColor:
                                                Color(0xFF5BB747),
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 24, 0),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2,
                                            indicatorColor: Color(0xFFC34896),
                                            indicatorWeight: 3,
                                            tabs: [
                                              Tab(
                                                text: tabBarDiasSemanaRecord!
                                                    .lunes!,
                                              ),
                                              StreamBuilder<
                                                  List<PlanningRecord>>(
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
                                                        child:
                                                            SpinKitPumpingHeart(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 40,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PlanningRecord>
                                                      tabPlanningRecordList =
                                                      snapshot.data!;
                                                  // Devuelve un Contenedor vacío cuando el documento no existe.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final tabPlanningRecord =
                                                      tabPlanningRecordList
                                                              .isNotEmpty
                                                          ? tabPlanningRecordList
                                                              .first
                                                          : null;
                                                  return Tab(
                                                    text:
                                                        tabBarDiasSemanaRecord!
                                                            .martes!,
                                                  );
                                                },
                                              ),
                                              Tab(
                                                text: 'Miércoles',
                                              ),
                                              Tab(
                                                text: 'Jueves',
                                              ),
                                              Tab(
                                                text: 'Viernes',
                                              ),
                                              Tab(
                                                text: 'Sábado',
                                              ),
                                              Tab(
                                                text: 'Domingo',
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<LunesRecord>>(
                                                    stream: queryLunesRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<LunesRecord>
                                                          containerLunesRecordList =
                                                          snapshot.data!;
                                                      // Devuelve un Contenedor vacío cuando el documento no existe.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final containerLunesRecord =
                                                          containerLunesRecordList
                                                                  .isNotEmpty
                                                              ? containerLunesRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerLunesRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerLunesRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerLunesRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerLunesRecord!.comida!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerLunesRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerLunesRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerLunesRecord!.cena!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerLunesRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<MartesRecord>>(
                                                    stream: queryMartesRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<MartesRecord>
                                                          containerMartesRecordList =
                                                          snapshot.data!;
                                                      final containerMartesRecord =
                                                          containerMartesRecordList
                                                                  .isNotEmpty
                                                              ? containerMartesRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerMartesRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerMartesRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerMartesRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: SelectionArea(
                                                                                                    child: AutoSizeText(
                                                                                                  containerMartesRecord!.comida!,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerMartesRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerMartesRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerMartesRecord!.cena!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerMartesRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<MiercolesRecord>>(
                                                    stream:
                                                        queryMiercolesRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<MiercolesRecord>
                                                          containerMiercolesRecordList =
                                                          snapshot.data!;
                                                      final containerMiercolesRecord =
                                                          containerMiercolesRecordList
                                                                  .isNotEmpty
                                                              ? containerMiercolesRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerMiercolesRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerMiercolesRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerMiercolesRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerMiercolesRecord!.comida!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerMiercolesRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerMiercolesRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  containerMiercolesRecord!.cena!,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerMiercolesRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<JuevesRecord>>(
                                                    stream: queryJuevesRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<JuevesRecord>
                                                          containerJuevesRecordList =
                                                          snapshot.data!;
                                                      final containerJuevesRecord =
                                                          containerJuevesRecordList
                                                                  .isNotEmpty
                                                              ? containerJuevesRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerJuevesRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerJuevesRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerJuevesRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerJuevesRecord!.comida!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerJuevesRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerJuevesRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: SelectionArea(
                                                                                                    child: AutoSizeText(
                                                                                                  containerJuevesRecord!.cena!,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerJuevesRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<ViernesRecord>>(
                                                    stream: queryViernesRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ViernesRecord>
                                                          containerViernesRecordList =
                                                          snapshot.data!;
                                                      final containerViernesRecord =
                                                          containerViernesRecordList
                                                                  .isNotEmpty
                                                              ? containerViernesRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerViernesRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerViernesRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerViernesRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  containerViernesRecord!.comida!,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerViernesRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerViernesRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: AutoSizeText(
                                                                                                containerViernesRecord!.cena!,
                                                                                                maxLines: 2,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerViernesRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<SabadoRecord>>(
                                                    stream: querySabadoRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<SabadoRecord>
                                                          containerSabadoRecordList =
                                                          snapshot.data!;
                                                      final containerSabadoRecord =
                                                          containerSabadoRecordList
                                                                  .isNotEmpty
                                                              ? containerSabadoRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerSabadoRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerSabadoRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerSabadoRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerSabadoRecord!.comida!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerSabadoRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerSabadoRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  containerSabadoRecord!.cena!,
                                                                                                  textAlign: TextAlign.center,
                                                                                                  maxLines: 2,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerSabadoRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  child: StreamBuilder<
                                                      List<DomingoRecord>>(
                                                    stream: queryDomingoRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Personaliza cómo se ve el widget cuando se está cargando.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40,
                                                            height: 40,
                                                            child:
                                                                SpinKitPumpingHeart(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<DomingoRecord>
                                                          containerDomingoRecordList =
                                                          snapshot.data!;
                                                      final containerDomingoRecord =
                                                          containerDomingoRecordList
                                                                  .isNotEmpty
                                                              ? containerDomingoRecordList
                                                                  .first
                                                              : null;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '8:00h ${textPlanningRecord!.meal1}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerDomingoRecord!.bebidaDes!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerDomingoRecord!.desayuno!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '11:00h ${textPlanningRecord!.meal2}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerDomingoRecord!.mediodia!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '14:00h ${textPlanningRecord!.meal3}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerDomingoRecord!.comida!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerDomingoRecord!.postreC!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '18:00h ${textPlanningRecord!.meal4}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        SelectionArea(
                                                                                            child: Text(
                                                                                          containerDomingoRecord!.merienda!,
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        )),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0xFFF5F5F5),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<List<PlanningRecord>>(
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
                                                                                List<PlanningRecord> textPlanningRecordList = snapshot.data!;
                                                                                // Devuelve un Contenedor vacío cuando el documento no existe.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final textPlanningRecord = textPlanningRecordList.isNotEmpty ? textPlanningRecordList.first : null;
                                                                                return SelectionArea(
                                                                                    child: Text(
                                                                                  '22:00h ${textPlanningRecord!.meal5}',
                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: ListView(
                                                                                      padding: EdgeInsets.zero,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerDomingoRecord!.cena!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerDomingoRecord!.postreCe!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
