SET SCHEMA 'zafira';

DO $$
-- Declare dashboards
  DECLARE personal_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE user_performance_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE general_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE monthly_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE weekly_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE nightly_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE failures_dashboard_id DASHBOARDS.id%TYPE;
  DECLARE stability_dashboard_id DASHBOARDS.id%TYPE;
  -- Declare Stability dashboard widgets
  DECLARE stability_percent_id WIDGETS.id%TYPE;
  DECLARE stability_percent_sql WIDGETS.sql%TYPE;
  DECLARE stability_percent_model WIDGETS.model%TYPE;
  DECLARE test_case_info_id WIDGETS.id%TYPE;
  DECLARE test_case_info_sql WIDGETS.sql%TYPE;
  DECLARE test_case_info_model WIDGETS.model%TYPE;
  DECLARE stability_trend_id WIDGETS.id%TYPE;
  DECLARE stability_trend_sql WIDGETS.sql%TYPE;
  DECLARE stability_trend_model WIDGETS.model%TYPE;
  -- Declare Failures dashboard widgets
  DECLARE error_message_id WIDGETS.id%TYPE;
  DECLARE error_message_sql WIDGETS.sql%TYPE;
  DECLARE error_message_model WIDGETS.model%TYPE;
  DECLARE detailed_failures_report_id WIDGETS.id%TYPE;
  DECLARE detailed_failures_report_sql WIDGETS.sql%TYPE;
  DECLARE detailed_failures_report_model WIDGETS.model%TYPE;
  DECLARE failures_count_id WIDGETS.id%TYPE;
  DECLARE failures_count_sql WIDGETS.sql%TYPE;
  DECLARE failures_count_model WIDGETS.model%TYPE;
  -- Declare Personal dashboard widgets
  DECLARE nightly_details_personal_id WIDGETS.id%TYPE;
  DECLARE nightly_details_personal_sql WIDGETS.sql%TYPE;
  DECLARE nightly_details_personal_model WIDGETS.model%TYPE;
  DECLARE monthly_total_personal_id WIDGETS.id%TYPE;
  DECLARE monthly_total_personal_sql WIDGETS.sql%TYPE;
  DECLARE monthly_total_personal_model WIDGETS.model%TYPE;
  DECLARE weekly_total_personal_id WIDGETS.id%TYPE;
  DECLARE weekly_total_personal_sql WIDGETS.sql%TYPE;
  DECLARE weekly_total_personal_model WIDGETS.model%TYPE;
  DECLARE nightly_total_personal_id WIDGETS.id%TYPE;
  DECLARE nightly_total_personal_sql WIDGETS.sql%TYPE;
  DECLARE nightly_total_personal_model WIDGETS.model%TYPE;
  DECLARE total_last_30_days_personal_id WIDGETS.id%TYPE;
  DECLARE total_last_30_days_personal_sql WIDGETS.sql%TYPE;
  DECLARE total_last_30_days_personal_model WIDGETS.model%TYPE;
  DECLARE nightly_personal_failures_id WIDGETS.id%TYPE;
  DECLARE nightly_personal_failures_sql WIDGETS.sql%TYPE;
  DECLARE nightly_personal_failures_model WIDGETS.model%TYPE;
  DECLARE nightly_personal_cron_id WIDGETS.id%TYPE;
  DECLARE nightly_personal_cron_sql WIDGETS.sql%TYPE;
  DECLARE nightly_personal_cron_model WIDGETS.model%TYPE;
  -- Declare User Performance dashboard widgets
  DECLARE personal_total_rate_id WIDGETS.id%TYPE;
  DECLARE personal_total_rate_sql WIDGETS.sql%TYPE;
  DECLARE personal_total_rate_model WIDGETS.model%TYPE;
  DECLARE personal_total_tests_man_hours_id WIDGETS.id%TYPE;
  DECLARE personal_total_tests_man_hours_sql WIDGETS.sql%TYPE;
  DECLARE personal_total_tests_man_hours_model WIDGETS.model%TYPE;
  DECLARE weekly_test_impl_progress_user_perf_id WIDGETS.id%TYPE;
  DECLARE weekly_test_impl_progress_user_perf_sql WIDGETS.sql%TYPE;
  DECLARE weekly_test_impl_progress_user_perf_model WIDGETS.model%TYPE;
  DECLARE total_tests_trend_id WIDGETS.id%TYPE;
  DECLARE total_tests_trend_sql WIDGETS.sql%TYPE;
  DECLARE total_tests_trend_model WIDGETS.model%TYPE;
  -- Declare General dashboard widgets
  DECLARE total_tests_count_id WIDGETS.id%TYPE;
  DECLARE total_tests_count_sql WIDGETS.sql%TYPE;
  DECLARE total_tests_count_model WIDGETS.model%TYPE;

  DECLARE total_tests_id WIDGETS.id%TYPE;
  DECLARE total_tests_sql WIDGETS.sql%TYPE;
  DECLARE total_tests_model WIDGETS.model%TYPE;
  DECLARE weekly_test_impl_progress_id WIDGETS.id%TYPE;
  DECLARE weekly_test_impl_progress_sql WIDGETS.sql%TYPE;
  DECLARE weekly_test_impl_progress_model WIDGETS.model%TYPE;
  DECLARE total_jira_tickets_id WIDGETS.id%TYPE;
  DECLARE total_jira_tickets_sql WIDGETS.sql%TYPE;
  DECLARE total_jira_tickets_model WIDGETS.model%TYPE;
  DECLARE total_tests_man_hours_id WIDGETS.id%TYPE;
  DECLARE total_tests_man_hours_sql WIDGETS.sql%TYPE;
  DECLARE total_tests_man_hours_model WIDGETS.model%TYPE;
  DECLARE total_tests_by_month_id WIDGETS.id%TYPE;
  DECLARE total_tests_by_month_sql WIDGETS.sql%TYPE;
  DECLARE total_tests_by_month_model WIDGETS.model%TYPE;
  -- Declare Monthly dashboard widgets
  DECLARE monthly_total_id WIDGETS.id%TYPE;
  DECLARE monthly_total_sql WIDGETS.sql%TYPE;
  DECLARE monthly_total_model WIDGETS.model%TYPE;
  DECLARE test_results_30_id WIDGETS.id%TYPE;
  DECLARE test_results_30_sql WIDGETS.sql%TYPE;
  DECLARE test_results_30_model WIDGETS.model%TYPE;
  DECLARE monthly_platform_pass_rate_id WIDGETS.id%TYPE;
  DECLARE monthly_platform_pass_rate_sql WIDGETS.sql%TYPE;
  DECLARE monthly_platform_pass_rate_model WIDGETS.model%TYPE;
  DECLARE monthly_details_id WIDGETS.id%TYPE;
  DECLARE monthly_details_sql WIDGETS.sql%TYPE;
  DECLARE monthly_details_model WIDGETS.model%TYPE;
  -- Declare Weekly dashboard widgets
  DECLARE weekly_total_id WIDGETS.id%TYPE;
  DECLARE weekly_total_sql WIDGETS.sql%TYPE;
  DECLARE weekly_total_model WIDGETS.model%TYPE;
  DECLARE weekly_test_results_id WIDGETS.id%TYPE;
  DECLARE weekly_test_results_sql WIDGETS.sql%TYPE;
  DECLARE weekly_test_results_model WIDGETS.model%TYPE;
  DECLARE weekly_platform_details_id WIDGETS.id%TYPE;
  DECLARE weekly_platform_details_sql WIDGETS.sql%TYPE;
  DECLARE weekly_platform_details_model WIDGETS.model%TYPE;
  DECLARE weekly_details_id WIDGETS.id%TYPE;
  DECLARE weekly_details_sql WIDGETS.sql%TYPE;
  DECLARE weekly_details_model WIDGETS.model%TYPE;
  -- Declare Nightly dashboard widgets
  DECLARE nightly_total_id WIDGETS.id%TYPE;
  DECLARE nightly_total_sql WIDGETS.sql%TYPE;
  DECLARE nightly_total_model WIDGETS.model%TYPE;
  DECLARE nightly_platform_pass_rate_id WIDGETS.id%TYPE;
  DECLARE nightly_platform_pass_rate_sql WIDGETS.sql%TYPE;
  DECLARE nightly_platform_pass_rate_model WIDGETS.model%TYPE;
  DECLARE nightly_details_id WIDGETS.id%TYPE;
  DECLARE nightly_details_sql WIDGETS.sql%TYPE;
  DECLARE nightly_details_model WIDGETS.model%TYPE;
  DECLARE nightly_person_pass_rate_id WIDGETS.id%TYPE;
  DECLARE nightly_person_pass_rate_sql WIDGETS.sql%TYPE;
  DECLARE nightly_person_pass_rate_model WIDGETS.model%TYPE;
  DECLARE nightly_failures_id WIDGETS.id%TYPE;
  DECLARE nightly_failures_sql WIDGETS.sql%TYPE;
  DECLARE nightly_failures_model WIDGETS.model%TYPE;

BEGIN
  -- Insert Stability dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('Stability', TRUE, 8) RETURNING id INTO stability_dashboard_id;
  stability_percent_sql := '
  SELECT
  unnest(array[''STABILITY'',
                  ''FAILURE'',
                  ''OMISSION'',
                  ''KNOWN ISSUE'',
                  ''INTERRUPT'']) AS "label",
  unnest(array[ROUND(AVG(STABILITY)::numeric, 0),
                   ROUND(AVG(FAILURE)::numeric, 0),
                   ROUND(AVG(OMISSION)::numeric, 0),
                   ROUND(AVG(KNOWN_FAILURE)::numeric, 0),
                   ROUND(AVG(INTERRUPT)::numeric, 0)]) AS "value"
  FROM TEST_CASE_HEALTH_VIEW
  WHERE
      TEST_CASE_ID = ''#{testCaseId}''';

  stability_percent_model :='
  {
      "legend": {
          "orient": "vertical",
          "x": "left",
          "y": "center",
          "itemGap": 10,
          "textStyle": {
              "fontSize": 10
          },
          "formatter": "{name}"
      },
      "tooltip": {
          "trigger": "item",
          "axisPointer": {
              "type": "shadow"
          },
          "formatter": "{b0}<br>{d0}%"
      },
      "color": [
          "#61c8b3",
          "#e76a77",
          "#fddb7a",
          "#9f5487",
          "#b5b5b5"
      ],
      "series": [
          {
              "type": "pie",
              "selectedMode": "multi",
              "hoverOffset": 2,
              "clockwise": false,
              "stillShowZeroSum": false,
              "avoidLabelOverlap": true,
              "itemStyle": {
                  "normal": {
                      "label": {
                          "show": true,
                          "position": "outside",
                          "formatter": "{@value} ({d0}%)"
                      },
                      "labelLine": {
                          "show": true
                      }
                  },
                  "emphasis": {
                      "label": {
                          "show": true
                      }
                  }
              },
              "radius": [
                  "0%",
                  "75%"
              ]
          }
      ],
      "thickness": 20
  }';

  test_case_info_sql :='
  SELECT
      TEST_CASES.ID AS "ID",
      TEST_CASES.TEST_CLASS AS "TEST CLASS",
      TEST_CASES.TEST_METHOD AS "TEST METHOD",
      TEST_SUITES.FILE_NAME AS "TEST SUITE",
      USERS.USERNAME AS "OWNER",
      TO_CHAR(TEST_CASES.CREATED_AT, ''MM/DD/YYYY'') AS "CREATED AT"
      FROM TEST_CASES
      LEFT JOIN TEST_SUITES ON TEST_CASES.TEST_SUITE_ID = TEST_SUITES.ID
      LEFT JOIN USERS ON TEST_CASES.PRIMARY_OWNER_ID = USERS.ID
  WHERE TEST_CASES.ID = ''#{testCaseId}''';

  test_case_info_model :='
  {
      "columns": [
          "ID",
          "TEST CLASS",
          "TEST METHOD",
          "TEST SUITE",
          "OWNER",
          "CREATED AT"
      ]
  }';

  stability_trend_sql :='
  SELECT
      STABILITY as "STABILITY",
      100 - OMISSION - KNOWN_FAILURE - ABORTED as "FAILURE",
      100 - KNOWN_FAILURE - ABORTED as "OMISSION",
      date_trunc(''month'', TESTED_AT) AS "TESTED_AT"
  FROM TEST_CASE_HEALTH_VIEW
  WHERE TEST_CASE_ID = ''#{testCaseId}''
  ORDER BY "TESTED_AT"';

  stability_trend_model :='
  {
      "grid": {
          "right": "2%",
          "left": "2%",
          "top": "8%",
          "bottom": "8%"
      },
      "legend": {},
      "tooltip": {
          "trigger": "axis"
      },
      "dimensions": [
          "TESTED_AT",
          "STABILITY",
          "FAILURE",
          "OMISSION"
      ],
      "color": [
          "#61c8b3",
          "#e76a77",
          "#fddb7a"
      ],
      "xAxis": {
          "type": "category",
          "boundaryGap": false,
          "axisLabel": {
              "formatter": "$filter | date: MMM dd$"
          }
      },
      "yAxis": {},
      "series": [
          {
              "type": "line",
              "z": 3,
              "itemStyle": {
                  "normal": {
                      "areaStyle": {
                          "opacity": 0.3,
                          "type": "default"
                      }
                  }
              },
              "lineStyle": {
                  "width": 1
              }
          },
          {
              "type": "line",
              "z": 2,
              "itemStyle": {
                  "normal": {
                      "areaStyle": {
                          "opacity": 0.3,
                          "type": "default"
                      }
                  }
              },
              "lineStyle": {
                  "width": 1
              }
          },
          {
              "type": "line",
              "z": 1,
              "itemStyle": {
                  "normal": {
                      "areaStyle": {
                          "opacity": 0.3,
                          "type": "default"
                      }
                  }
              },
              "lineStyle": {
                  "width": 1
              }
          }
      ]
  }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('STABILITY (%)', 'echart', stability_percent_sql, stability_percent_model)
      RETURNING id INTO stability_percent_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TESTCASE INFO', 'table', test_case_info_sql, test_case_info_model)
      RETURNING id INTO test_case_info_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('STABILITY TREND (%)', 'echart', stability_trend_sql, stability_trend_model)
      RETURNING id INTO stability_trend_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (stability_dashboard_id, stability_percent_id, '{"x":0,"y":0,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (stability_dashboard_id, test_case_info_id, '{"x":4,"y":0,"width":8,"height":6}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (stability_dashboard_id, stability_trend_id, '{"x":0,"y":22,"width":12,"height":11}');
  -- Insert Failures dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('Failures analysis', TRUE, 5) RETURNING id INTO failures_dashboard_id;

  error_message_sql :='
  SELECT Message AS "Error Message"
  FROM NIGHTLY_FAILURES_VIEW
  WHERE MESSAGE_HASHCODE=''#{hashcode}''
  LIMIT 1';

    error_message_model := '
  {
      "columns":[
         "Error Message"
      ]
  }';

  detailed_failures_report_sql := '
  SELECT count(*) as "COUNT",
      Env AS "ENV",
      TEST_REPORT AS "REPORT",
      Rebuild AS "REBUILD"
  FROM NIGHTLY_FAILURES_VIEW
  WHERE substring(Message from 1 for 210)  IN (
      SELECT substring(Message from 1 for 210)
      FROM NIGHTLY_FAILURES_VIEW
      WHERE MESSAGE_HASHCODE=''#{hashcode}'')
  GROUP BY "ENV", "REPORT", "REBUILD", substring(Message from 1 for 210)
  ORDER BY "COUNT" DESC, "ENV"';

  detailed_failures_report_model := '
  {
      "columns": [
          "COUNT",
          "ENV",
          "REPORT",
          "REBUILD"
      ]
  }';

  failures_count_sql := '
  SELECT
      Env AS "ENV",
      count(*) as "COUNT"
  FROM NIGHTLY_FAILURES_VIEW
  WHERE substring(Message from 1 for 210)  IN (
     SELECT substring(Message from 1 for 210)
  FROM NIGHTLY_FAILURES_VIEW
  WHERE MESSAGE_HASHCODE=''#{hashcode}'')
  GROUP BY "ENV"
  ORDER BY "COUNT" DESC
  ';

    failures_count_model := '
  {
      "columns": [
          "ENV",
          "COUNT"
      ]
  }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('ERROR MESSAGE', 'table', error_message_sql, error_message_model)
      RETURNING id INTO error_message_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('DETAILED FAILURES REPORT', 'table', detailed_failures_report_sql, detailed_failures_report_model)
      RETURNING id INTO detailed_failures_report_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('FAILURES COUNT', 'table', failures_count_sql, failures_count_model)
      RETURNING id INTO failures_count_id;
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (failures_dashboard_id, error_message_id, '{"x":3,"y":0,"width":9,"height":14}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (failures_dashboard_id, detailed_failures_report_id, '{"x":0,"y":14,"width":12,"height":10}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (failures_dashboard_id, failures_count_id, '{"x":0,"y":0,"width":3,"height":14}');

  -- Insert Personal dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('Personal', FALSE, 1) RETURNING id INTO personal_dashboard_id;

  nightly_details_personal_sql := '
  SELECT
      OWNER_USERNAME as "OWNER",
      BUILD_NUMBER as "BUILD",
      ''<a href="#{zafiraURL}/#!/tests/runs/''||TEST_RUN_ID||''" target="_blank"> '' || TEST_SUITE_NAME ||'' </a>'' AS "REPORT",
      ZAFIRA_REPORT_URL as "ZAFIRA_REPORT",
      sum(Passed) || ''/'' || sum(FAILED) + sum(KNOWN_ISSUE) || ''/'' || sum(Skipped) as "P/F/S",
      REBUILD_URL as "REBUILD",
  CREATED_AT::text as "UPDATED"
  FROM NIGHTLY_VIEW
  WHERE OWNER_ID=''#{currentUserId}''
  GROUP BY "OWNER", "BUILD", "REPORT", "ZAFIRA_REPORT", "REBUILD", "UPDATED"
  ORDER BY "BUILD" DESC
  ';

  nightly_details_personal_model := '
  {
      "columns": [
          "OWNER",
          "BUILD",
          "REPORT",
          "ZAFIRA_REPORT",
          "P/F/S",
          "REBUILD",
          "UPDATED"
      ]
  }';

  monthly_total_personal_sql :='
  SELECT
  unnest(array[OWNER_USERNAME,
                ''PASSED'',
                ''FAILED'',
                ''SKIPPED'',
                ''KNOWN ISSUE'',
                ''QUEUED'',
                ''ABORTED'']) AS "label",
       unnest(
        array[0,
            sum(PASSED),
            sum(FAILED),
            sum(SKIPPED),
            sum(KNOWN_ISSUE),
            sum(QUEUED),
            sum(ABORTED)]) AS "value"
  FROM MONTHLY_VIEW
  WHERE OWNER_ID = ''#{currentUserId}''
     AND PROJECT LIKE ANY (''{#{project}}'')
  GROUP BY OWNER_USERNAME';

  monthly_total_personal_model :='
{
    "legend": {
        "orient": "vertical",
        "x": "left",
        "y": "center",
        "itemGap": 10,
        "textStyle": {
            "fontSize": 10
        },
        "formatter": "{name}"
    },
    "tooltip": {
        "trigger": "item",
        "axisPointer": {
            "type": "shadow"
        },
        "formatter": "{b0}<br>{d0}%"
    },
    "color": [
        "#ffffff",
        "#61c8b3",
        "#e76a77",
        "#fddb7a",
        "#9f5487",
        "#6dbbe7",
        "#b5b5b5"
    ],
    "series": [
        {
            "type": "pie",
            "selectedMode": "multi",
            "hoverOffset": 2,
            "clockwise": false,
            "stillShowZeroSum": false,
            "avoidLabelOverlap": true,
            "itemStyle": {
                "normal": {
                    "label": {
                        "show": true,
                        "position": "outside",
                        "formatter": "{@value} ({d0}%)"
                    },
                    "labelLine": {
                        "show": true
                    }
                },
                "emphasis": {
                    "label": {
                        "show": true
                    }
                }
            },
            "radius": [
                "0%",
                "75%"
            ]
        }
    ]
}';

  weekly_total_personal_sql :='
  SELECT
  unnest(array[OWNER_USERNAME,
              ''PASSED'',
              ''FAILED'',
              ''SKIPPED'',
              ''KNOWN ISSUE'',
              ''QUEUED'',
              ''ABORTED'']) AS "label",
     unnest(
      array[0,
          sum(PASSED),
          sum(FAILED),
          sum(SKIPPED),
          sum(KNOWN_ISSUE),
          sum(QUEUED),
          sum(ABORTED)]) AS "value"
  FROM WEEKLY_VIEW
  WHERE OWNER_ID = ''#{currentUserId}''
     AND PROJECT LIKE ANY (''{#{project}}'')
  GROUP BY OWNER_USERNAME';

  weekly_total_personal_model := '
{
    "legend": {
        "orient": "vertical",
        "x": "left",
        "y": "center",
        "itemGap": 10,
        "textStyle": {
            "fontSize": 10
        },
        "formatter": "{name}"
    },
    "tooltip": {
        "trigger": "item",
        "axisPointer": {
            "type": "shadow"
        },
        "formatter": "{b0}<br>{d0}%"
    },
    "color": [
        "#ffffff",
        "#61c8b3",
        "#e76a77",
        "#fddb7a",
        "#9f5487",
        "#6dbbe7",
        "#b5b5b5"
    ],
    "series": [
        {
            "type": "pie",
            "selectedMode": "multi",
            "hoverOffset": 2,
            "clockwise": false,
            "stillShowZeroSum": false,
            "avoidLabelOverlap": true,
            "itemStyle": {
                "normal": {
                    "label": {
                        "show": true,
                        "position": "outside",
                        "formatter": "{@value} ({d0}%)"
                    },
                    "labelLine": {
                        "show": true
                    }
                },
                "emphasis": {
                    "label": {
                        "show": true
                    }
                }
            },
            "radius": [
                "0%",
                "75%"
            ]
        }
    ]
}';

  nightly_total_personal_sql :='
  SELECT
  unnest(array[OWNER_USERNAME,
              ''PASSED'',
              ''FAILED'',
              ''SKIPPED'',
              ''KNOWN ISSUE'',
              ''QUEUED'',
              ''ABORTED'']) AS "label",
     unnest(
      array[0,
          sum(PASSED),
          sum(FAILED),
          sum(SKIPPED),
          sum(KNOWN_ISSUE),
          sum(QUEUED),
          sum(ABORTED)]) AS "value"
  FROM NIGHTLY_VIEW
  WHERE OWNER_ID = ''#{currentUserId}''
     AND PROJECT LIKE ANY (''{#{project}}'')
  GROUP BY OWNER_USERNAME';

  nightly_total_personal_model :='
{
    "legend": {
        "orient": "vertical",
        "x": "left",
        "y": "center",
        "itemGap": 10,
        "textStyle": {
            "fontSize": 10
        },
        "formatter": "{name}"
    },
    "tooltip": {
        "trigger": "item",
        "axisPointer": {
            "type": "shadow"
        },
        "formatter": "{b0}<br>{d0}%"
    },
    "color": [
        "#ffffff",
        "#61c8b3",
        "#e76a77",
        "#fddb7a",
        "#9f5487",
        "#6dbbe7",
        "#b5b5b5"
    ],
    "series": [
        {
            "type": "pie",
            "selectedMode": "multi",
            "hoverOffset": 2,
            "clockwise": false,
            "stillShowZeroSum": false,
            "avoidLabelOverlap": true,
            "itemStyle": {
                "normal": {
                    "label": {
                        "show": true,
                        "position": "outside",
                        "formatter": "{@value} ({d0}%)"
                    },
                    "labelLine": {
                        "show": true
                    }
                },
                "emphasis": {
                    "label": {
                        "show": true
                    }
                }
            },
            "radius": [
                "0%",
                "75%"
            ]
        }
    ]
}';


  total_last_30_days_personal_sql := '
  SELECT
      TO_CHAR(CREATED_AT, ''MM/DD/YYYY'') AS "CREATED_AT",
      sum( PASSED ) AS "PASSED",
      sum( FAILED ) AS "FAILED",
      sum( SKIPPED ) AS "SKIPPED",
      sum( KNOWN_ISSUE ) AS "KNOWN ISSUE",
      sum( ABORTED ) AS "ABORTED",
      sum( QUEUED ) AS "QUEUED",
      sum( TOTAL ) AS "TOTAL"
  FROM THIRTY_DAYS_VIEW
  WHERE OWNER_ID=''#{currentUserId}''
      AND PROJECT LIKE ANY (''{#{project}}'')
  GROUP BY "CREATED_AT"
  UNION
  SELECT
      TO_CHAR(CREATED_AT, ''MM/DD/YYYY'') AS "CREATED_AT",
      sum( PASSED ) AS "PASSED",
      sum( FAILED ) AS "FAILED",
      sum( SKIPPED ) AS "SKIPPED",
      sum( KNOWN_ISSUE ) AS "KNOWN ISSUE",
      sum( ABORTED ) AS "ABORTED",
      sum( QUEUED ) AS "QUEUED",
      sum( TOTAL ) AS "TOTAL"
  FROM NIGHTLY_VIEW
  WHERE OWNER_ID=''#{currentUserId}''
      AND PROJECT LIKE ANY (''{#{project}}'')
  GROUP BY "CREATED_AT"
  ORDER BY "CREATED_AT" ASC';

  total_last_30_days_personal_model :='
{
    "grid": {
        "right": "2%",
        "left": "6%",
        "top": "8%",
        "bottom": "8%"
    },
    "legend": {},
    "tooltip": {
        "trigger": "axis"
    },
    "dimensions": [
        "CREATED_AT",
        "PASSED",
        "FAILED",
        "SKIPPED",
        "KNOWN ISSUE",
        "ABORTED",
        "QUEUED",
        "TOTAL"
    ],
    "color": [
        "#61c8b3",
        "#e76a77",
        "#fddb7a",
        "#9f5487",
        "#b5b5b5",
        "#6dbbe7",
        "#b5b5b5"
    ],
    "xAxis": {
        "type": "category",
        "boundaryGap": false
    },
    "yAxis": {},
    "series": [
        {
            "type": "line",
            "smooth": false,
            "stack": "Status",
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "stack": "Status1",
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        }
    ]
}';

  nightly_personal_failures_sql :='
  SELECT count(*) AS "COUNT",
      ENV AS "ENV",
      ''<a href="#{zafiraURL}/#!/dashboards/2?hashcode='' || max(MESSAGE_HASHCODE)  || ''" target="_blank">Failures Analysis Report</a>''
          AS "REPORT",
      substring(MESSAGE from 1 for 210) as "MESSAGE",
      REBUILD as "REBUILD"
  FROM NIGHTLY_FAILURES_VIEW
  WHERE
      OWNER_ID = #{currentUserId}
      AND MESSAGE IS NOT NULL
  GROUP BY "ENV", substring(MESSAGE from 1 for 210), "REBUILD"
  ORDER BY "COUNT" DESC';

  nightly_personal_failures_model :='
  {
      "columns": [
          "COUNT",
          "ENV",
          "REPORT",
          "MESSAGE",
          "REBUILD"
      ]
  }';

  nightly_personal_cron_sql := '
  SELECT
  ''<a href="''||UPSTREAM_JOB_URL||''" target="_blank">''||UPSTREAM_JOB_NAME||''</a>'' AS "NAME",
        OWNER_USERNAME as "OWNER",
        UPSTREAM_JOB_BUILD_NUMBER as "BUILD",
        SUM(PASSED) as "PASS",
        SUM(FAILED) as "FAIL",
        SUM(SKIPPED) as "SKIP",
          SUM(ABORTED) as "ABORTED",
  ''<a href="#{jenkinsURL}/job/Management_Jobs/job/smartJobsRerun/buildWithParameters?token=ciStart&ci_job_id=''||UPSTREAM_JOB_ID||''&ci_parent_build=''||UPSTREAM_JOB_BUILD_NUMBER||''&ci_user_id=''||OWNER_USERNAME||''&doRebuild=true&rerunFailures=false" id="cron_rerun" class="cron_rerun_all" target="_blank">Restart all</a>'' AS "RESTART ALL",
  ''<a href="#{jenkinsURL}/job/Management_Jobs/job/smartJobsRerun/buildWithParameters?token=ciStart&ci_job_id=''||UPSTREAM_JOB_ID||''&ci_parent_build=''||UPSTREAM_JOB_BUILD_NUMBER||''&ci_user_id=''||OWNER_USERNAME||''&doRebuild=true&rerunFailures=true" class="cron_rerun_failures" target="_blank">Restart failures</a>'' AS "RESTART FAILURES"
    FROM NIGHTLY_VIEW
  WHERE OWNER_ID=''#{currentUserId}''
  GROUP BY "OWNER", "BUILD", "NAME", UPSTREAM_JOB_ID, UPSTREAM_JOB_URL
  ORDER BY "BUILD" DESC';

  nightly_personal_cron_model := '
  {
      "columns": [
          "NAME",
          "BUILD",
          "OWNER",
          "PASS",
          "FAIL",
          "SKIP",
	        "ABORTED",
          "RESTART ALL",
          "RESTART FAILURES"
      ]
  }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY DETAILS PERSONAL', 'table', nightly_details_personal_sql, nightly_details_personal_model)
      RETURNING id INTO nightly_details_personal_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('MONTHLY TOTAL PERSONAL', 'echart', monthly_total_personal_sql, monthly_total_personal_model)
      RETURNING id INTO monthly_total_personal_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('WEEKLY TOTAL PERSONAL', 'echart', weekly_total_personal_sql, weekly_total_personal_model)
      RETURNING id INTO weekly_total_personal_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY TOTAL PERSONAL', 'echart', nightly_total_personal_sql, nightly_total_personal_model)
      RETURNING id INTO nightly_total_personal_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TEST RESULTS (LAST 30 DAYS) PERSONAL', 'echart', total_last_30_days_personal_sql, total_last_30_days_personal_model)
      RETURNING id INTO total_last_30_days_personal_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY - PERSONAL FAILURES', 'table', nightly_personal_failures_sql, nightly_personal_failures_model)
      RETURNING id INTO nightly_personal_failures_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY PERSONAL (CRON)', 'table', nightly_personal_cron_sql, nightly_personal_cron_model)
      RETURNING id INTO nightly_personal_cron_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, nightly_details_personal_id, '{"x":0,"y":28,"width":12,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, monthly_total_personal_id, '{"x":8,"y":0,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, weekly_total_personal_id, '{"x":4,"y":0,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, nightly_total_personal_id, '{"x":0,"y":0,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, total_last_30_days_personal_id, '{"x":0,"y":11,"width":12,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, nightly_personal_failures_id, '{"x":0,"y":39,"width":12,"height":6}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (personal_dashboard_id, nightly_personal_cron_id, '{"x":0,"y":22,"width":12,"height":6}');

  -- Insert User Performance dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('User Performance', TRUE, 6) RETURNING id INTO user_performance_dashboard_id;

  personal_total_rate_sql := '
  SELECT
      OWNER_USERNAME AS "OWNER",
      sum( passed ) AS "PASSED",
      sum( failed ) AS "FAILED",
      sum( skipped ) AS "SKIPPED",
      round (100.0 * sum( passed ) / (sum( total )), 2) as "PASS RATE"
  FROM TOTAL_VIEW
  WHERE OWNER_ID = ''#{currentUserId}''
  GROUP BY "OWNER"';

  personal_total_rate_model :='
  {
      "columns":[
         "OWNER",
         "PASSED",
         "FAILED",
         "SKIPPED",
         "PASS RATE"
      ]
  }';

  personal_total_tests_man_hours_sql := '
  SELECT
      SUM(TOTAL_HOURS) AS "MAN-HOURS",
  CREATED_AT AS "CREATED_AT"
  FROM TOTAL_VIEW WHERE OWNER_ID = ''#{currentUserId}''
  GROUP BY "CREATED_AT"
  ORDER BY "CREATED_AT"';

  personal_total_tests_man_hours_model := '
  {
      "grid": {
          "right": "2%",
          "left": "4%",
          "top": "8%",
          "bottom": "8%"
      },
      "legend": {
          "top": -5
      },
      "tooltip": {
          "trigger": "axis"
      },
      "dimensions": [
          "CREATED_AT",
          "MAN-HOURS"
      ],
      "xAxis": {
          "type": "category",
          "axisLabel": {
              "formatter": "$filter | date: MMM dd$"
          }
      },
      "yAxis": {},
      "series": [
          {
              "type": "bar"
          }
      ],
      "color": [
          "#7fbae3",
          "#919e8b"
      ]
  }';

  weekly_test_impl_progress_user_perf_sql := '
  SELECT
      date_trunc(''week'', TEST_CASES.CREATED_AT)::date AS "CREATED_AT" ,
      count(*) AS "AMOUNT"
  FROM TEST_CASES INNER JOIN
      USERS ON TEST_CASES.PRIMARY_OWNER_ID=USERS.ID
  WHERE USERS.ID=''#{currentUserId}''
  GROUP BY 1
  ORDER BY 1;';

  weekly_test_impl_progress_user_perf_model := '
{
    "grid": {
        "right": "2%",
        "left": "4%",
        "top": "8%",
        "bottom": "8%"
    },
    "legend": {
        "top": -5
    },
    "tooltip": {
        "trigger": "axis"
    },
    "dimensions": [
        "CREATED_AT",
        "AMOUNT"
    ],
    "color": [
        "#7fbae3",
        "#919e8b"
    ],
    "xAxis": {
        "type": "category",
        "axisLabel": {
            "formatter": "$filter | date: MMM dd$"
        }
    },
    "yAxis": {},
    "series": [
        {
            "type": "bar"
        },
        {
            "type": "line",
            "smooth": true,
            "lineStyle": {
                "type": "dotted"
            }
        }
    ]
}';

  total_tests_trend_sql := '
  SELECT
      TO_CHAR(CREATED_AT, ''MM/DD/YYYY'') AS "CREATED_AT",
      sum( PASSED ) AS "PASSED",
      sum( FAILED ) AS "FAILED",
      sum( SKIPPED ) AS "SKIPPED",
      sum( KNOWN_ISSUE ) AS "KNOWN ISSUE",
      sum( ABORTED ) AS "ABORTED",
      sum( QUEUED ) AS "QUEUED",
      sum( TOTAL ) AS "TOTAL"
  FROM TOTAL_VIEW
  WHERE OWNER_ID=''#{currentUserId}''
  GROUP BY "CREATED_AT"';

  total_tests_trend_model := '
{
    "grid": {
        "right": "2%",
        "left": "6%",
        "top": "8%",
        "bottom": "8%"
    },
    "legend": {},
    "tooltip": {
        "trigger": "axis"
    },
    "dimensions": [
        "CREATED_AT",
        "PASSED",
        "FAILED",
        "SKIPPED",
        "KNOWN ISSUE",
        "ABORTED",
        "QUEUED",
        "TOTAL"
    ],
    "color": [
        "#61c8b3",
        "#e76a77",
        "#fddb7a",
        "#9f5487",
        "#b5b5b5",
        "#6dbbe7",
        "#b5b5b5"
    ],
    "xAxis": {
        "type": "category",
        "boundaryGap": false
    },
    "yAxis": {},
    "series": [
        {
            "type": "line",
            "smooth": false,
            "stack": "Status",
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "stack": "Status1",
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        },
        {
            "type": "line",
            "smooth": false,
            "itemStyle": {
                "normal": {
                    "areaStyle": {
                        "opacity": 0.3,
                        "type": "default"
                    }
                }
            },
            "lineStyle": {
                "width": 1
            }
        }
    ]
}';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('PERSONAL TOTAL RATE', 'table', personal_total_rate_sql, personal_total_rate_model)
      RETURNING id INTO personal_total_rate_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('PERSONAL TOTAL TESTS (MAN-HOURS)', 'echart', personal_total_tests_man_hours_sql, personal_total_tests_man_hours_model)
      RETURNING id INTO personal_total_tests_man_hours_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('WEEKLY TEST IMPLEMENTATION PROGRESS (NUMBER OF TEST METHODS IMPLEMENTED BY PERSON)', 'echart', weekly_test_impl_progress_user_perf_sql, weekly_test_impl_progress_user_perf_model)
      RETURNING id INTO weekly_test_impl_progress_user_perf_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TOTAL TESTS TREND', 'echart', total_tests_trend_sql, total_tests_trend_model)
      RETURNING id INTO total_tests_trend_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (user_performance_dashboard_id, personal_total_rate_id, '{"x":0,"y":0,"height":11,"width":4}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (user_performance_dashboard_id, personal_total_tests_man_hours_id, '{"x":4,"y":0,"width":8,"height":12}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (user_performance_dashboard_id, weekly_test_impl_progress_user_perf_id, '{"x":0,"y":12,"width":12,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (user_performance_dashboard_id, total_tests_trend_id, '{"x":0,"y":23,"width":12,"height":12}');

  -- Insert General dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('General', FALSE, 0) RETURNING id INTO general_dashboard_id;

  total_tests_count_sql :=
  '
SELECT
        PROJECT AS "PROJECT",
        sum(PASSED) AS "PASS",
        sum(FAILED) AS "FAIL",
        sum(KNOWN_ISSUE) AS "ISSUE",
        sum(SKIPPED) AS "SKIP",
        sum(QUEUED) AS "QUEUE",
        round (100.0 * sum( passed ) / (sum( total )), 2) as "Pass Rate"
    FROM TOTAL_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY PROJECT
    UNION
    SELECT  ''<B><I>TOTAL</I></B>'' AS "PROJECT",
        sum(PASSED) AS "PASS",
        sum(FAILED) AS "FAIL",
        sum(KNOWN_ISSUE) AS "ISSUE",
        sum(SKIPPED) AS "SKIP",
        sum(QUEUED) AS "QUEUE",
        round (100.0 * sum( passed ) / (sum( total )), 2) as "Pass Rate"
    FROM TOTAL_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    ORDER BY "PASS" DESC';

  total_tests_count_model :=
  '
{
      "columns": [
          "PROJECT",
          "PASS",
          "FAIL",
          "ISSUE",
          "SKIP",
          "QUEUE",
          "PASS RATE"
      ]
  }';

  total_tests_sql :=
  '
SELECT
     unnest(array[''PASSED'', ''FAILED'', ''SKIPPED'', ''KNOWN ISSUE'', ''ABORTED'', ''QUEUED'']) AS "label",
     unnest(array[''#109D5D'', ''#DC4437'', ''#FCBE1F'', ''#AA5C33'', ''#AAAAAA'', ''#6C6C6C'']) AS "color",
     unnest(array[SUM(PASSED), SUM(FAILED), SUM(SKIPPED), SUM(KNOWN_ISSUE), SUM(ABORTED), SUM(QUEUED)]) AS "value"
  FROM TOTAL_VIEW
  WHERE PROJECT LIKE ANY (''{#{project}}'')
  ORDER BY "value" DESC';

  total_tests_model :=
  '{
       "thickness": 20
   }';

  weekly_test_impl_progress_sql :=
  '
SELECT
      date_trunc(''week'', TEST_CASES.CREATED_AT)::date AS "CREATED_AT" ,
      count(*) AS "AMOUNT"
  FROM TEST_CASES INNER JOIN PROJECTS ON TEST_CASES.PROJECT_ID = PROJECTS.ID
  INNER JOIN USERS ON TEST_CASES.PRIMARY_OWNER_ID=USERS.ID
  WHERE PROJECTS.NAME LIKE ANY (''{#{project}}'')
  GROUP BY 1
  ORDER BY 1;';

  weekly_test_impl_progress_model :=
  '
{
        "series": [
          {
            "axis": "y",
            "dataset": "dataset",
            "key": "AMOUNT",
            "label": "INTERPOLATED AMOUNT",
            "interpolation": {"mode": "bundle", "tension": 0.8},
            "color": "#f0ad4e",
            "type": [
              "line"
            ],
            "id": "AMOUNT"
          },
          {
            "axis": "y",
            "dataset": "dataset",
            "key": "AMOUNT",
            "label": "AMOUNT",
            "color": "#3a87ad",
            "type": [
              "column"
            ],
            "id": "AMOUNT"
          }
        ],
        "axes": {
          "x": {
            "key": "CREATED_AT",
            "type": "date"
          }
        }
    }';

  total_jira_tickets_sql :=
  '
SELECT
        PROJECTS.NAME AS "PROJECT",
        COUNT(DISTINCT WORK_ITEMS.JIRA_ID) AS "COUNT"
    FROM TEST_WORK_ITEMS
        INNER JOIN WORK_ITEMS ON TEST_WORK_ITEMS.WORK_ITEM_ID = WORK_ITEMS.ID
        INNER JOIN TEST_CASES ON WORK_ITEMS.TEST_CASE_ID = TEST_CASES.ID
        INNER JOIN PROJECTS ON TEST_CASES.PROJECT_ID = PROJECTS.ID
    WHERE WORK_ITEMS.TYPE=''BUG''
    AND PROJECTS.NAME LIKE ANY (''{#{project}}'')
    GROUP BY "PROJECT"
    ORDER BY "COUNT" DESC;';

  total_jira_tickets_model :=
  '{
      "columns":[
         "PROJECT",
         "COUNT"
      ]
   }';

  total_tests_man_hours_sql :=
  '
SELECT
        SUM(TOTAL_HOURS) AS "ACTUAL",
        SUM(TOTAL_HOURS) AS "ETA",
        TESTED_AT AS "CREATED_AT"
    FROM TOTAL_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY "CREATED_AT"
    UNION
    SELECT
        SUM(TOTAL_HOURS) AS "ACTUAL",
        ROUND(SUM(TOTAL_HOURS)/extract(day from current_date)
        * extract(day from date_trunc(''month'', current_date) + interval ''1 month'' - interval ''1 day'')) AS "ETA",
        date_trunc(''month'', current_date) AS "CREATED_AT"
    FROM MONTHLY_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY "CREATED_AT"
    ORDER BY "CREATED_AT";';

  total_tests_man_hours_model :=
  '
{
        "series": [
            {
                "axis": "y",
                "dataset": "dataset",
                "key": "ACTUAL",
                "label": "ACTUAL",
                "color": "#5C9AE1",
                "thickness": "10px",
                "type": [
                    "column"
                ],
                "id": "ACTUAL",
                "visible": true
            },
            {
                "axis": "y",
                "dataset": "dataset",
                "key": "ETA",
                "label": "ETA",
                "color": "#C4C9CE",
                "thickness": "10px",
                "interpolation": {
                    "mode": "bundle",
                    "tension": 1
                },
                "type": [
                    "dashed-line"
                ],
                "id": "ETA",
                "visible": true
            }
        ],
        "axes": {
            "x": {
                "key": "CREATED_AT",
                "type": "date",
                "ticks": "functions(value) {return ''wow!''}"
            },
            "y": {
                "min": "0"
            }
        }
    }';

  total_tests_by_month_sql =
  '
SELECT
      SUM(PASSED) as "PASSED",
      SUM(FAILED) AS "FAILED",
      SUM(SKIPPED) AS "SKIPPED",
      SUM(IN_PROGRESS) AS "IN PROGRESS",
      SUM(ABORTED) AS "ABORTED",
      SUM(QUEUED) AS "QUEUED",
      SUM(TOTAL) AS "TOTAL",
      date_trunc(''month'', TESTED_AT) AS "CREATED_AT"
  FROM TOTAL_VIEW
  WHERE PROJECT LIKE ANY (''{#{project}}'')
  AND TESTED_AT < date_trunc(''month'', current_date)
  GROUP BY "CREATED_AT"
  ORDER BY "CREATED_AT"';

  total_tests_by_month_model =
  '
{
      "series": [
          {
              "axis": "y",
              "dataset": "dataset",
              "key": "PASSED",
              "label": "PASSED",
              "color": "#5cb85c",
              "thickness": "10px",
              "type": [
                  "line",
                  "dot",
                  "area"
              ],
              "id": "PASSED"
          },
          {
              "axis": "y",
              "dataset": "dataset",
              "key": "FAILED",
              "label": "FAILED",
              "color": "#d9534f",
              "thickness": "10px",
              "type": [
                  "line",
                  "dot",
                  "area"
              ],
              "id": "FAILED"
          },
          {
              "axis": "y",
              "dataset": "dataset",
              "key": "SKIPPED",
              "label": "SKIPPED",
              "color": "#f0ad4e",
              "thickness": "10px",
              "type": [
                  "line",
                  "dot",
                  "area"
              ],
              "id": "SKIPPED"
          },
          {
              "axis": "y",
              "dataset": "dataset",
              "key": "IN PROGRESS",
              "label": "IN PROGRESS",
              "color": "#3a87ad",
              "type": [
                  "line",
                  "dot",
                  "area"
              ],
              "id": "IN PROGRESS"
          },
          {
              "axis": "y",
              "dataset": "dataset",
              "key": "ABORTED",
              "label": "ABORTED",
              "color": "#aaaaaa",
              "type": [
                  "line",
                  "dot",
                  "area"
              ],
              "id": "ABORTED"
          },
          {
            "axis": "y",
            "dataset": "dataset",
            "key": "QUEUED",
            "label": "QUEUED",
            "color": "#6C6C6C",
            "type": [
                "line",
                "dot",
                "area"
            ],
            "id": "QUEUED"
          },
          {
              "axis": "y",
              "dataset": "dataset",
              "key": "TOTAL",
              "label": "TOTAL",
              "color": "#D3D3D3",
              "type": [
                  "line",
                  "dot",
                  "area"
              ],
              "id": "TOTAL"
          }
      ],
      "axes": {
          "x": {
              "key": "CREATED_AT",
              "type": "date",
              "ticks": "functions(value) {return ''wow!''}"
          }
      }
  }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TOTAL TESTS (COUNT)', 'table', total_tests_count_sql, total_tests_count_model)
      RETURNING id INTO total_tests_count_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TOTAL TESTS', 'piechart', total_tests_sql, total_tests_model)
      RETURNING id INTO total_tests_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('WEEKLY TEST IMPLEMENTATION PROGRESS', 'linechart', weekly_test_impl_progress_sql, weekly_test_impl_progress_model)
      RETURNING id INTO weekly_test_impl_progress_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TOTAL JIRA TICKETS', 'table', total_jira_tickets_sql, total_jira_tickets_model)
      RETURNING id INTO total_jira_tickets_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TOTAL TESTS (MAN-HOURS)', 'linechart', total_tests_man_hours_sql, total_tests_man_hours_model)
      RETURNING id INTO total_tests_man_hours_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TOTAL TESTS (BY MONTH)', 'linechart', total_tests_by_month_sql, total_tests_by_month_model)
      RETURNING id INTO total_tests_by_month_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (general_dashboard_id, total_tests_man_hours_id, '{"x":4,"y":0,"width":8,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (general_dashboard_id, total_tests_id, '{"x":0,"y":0,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (general_dashboard_id, total_tests_count_id, '{"x":0,"y":11,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (general_dashboard_id, weekly_test_impl_progress_id, '{"x":4,"y":22,"height":11,"width":8}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (general_dashboard_id, total_jira_tickets_id, '{"x":0,"y":22,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (general_dashboard_id, total_tests_by_month_id, '{"x":4,"y":11,"width":8,"height":11}');

  -- Insert Monthly dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('Monthly Regression', FALSE, 4) RETURNING id INTO monthly_dashboard_id;

  monthly_total_sql :=
  '
SELECT
     unnest(array[''PASSED'', ''FAILED'', ''SKIPPED'', ''KNOWN ISSUE'', ''ABORTED'', ''QUEUED'']) AS "label",
     unnest(array[''#109D5D'', ''#DC4437'', ''#FCBE1F'', ''#AA5C33'', ''#AAAAAA'', ''#6C6C6C'']) AS "color",
     unnest(array[SUM(PASSED), SUM(FAILED), SUM(SKIPPED), SUM(KNOWN_ISSUE), SUM(ABORTED), SUM(QUEUED)]) AS "value"
  FROM MONTHLY_VIEW
  WHERE
      PROJECT LIKE ANY (''{#{project}}'')
  ORDER BY "value" DESC';

  monthly_total_model :=
  '
{
      "thickness": 20
   }';

  test_results_30_sql :=
  '
SELECT
        sum(PASSED) AS "PASSED",
        sum(FAILED) AS "FAILED",
        sum(KNOWN_ISSUE) AS "KNOWN_ISSUE",
        sum(SKIPPED) AS "SKIPPED",
        sum(IN_PROGRESS) AS "IN_PROGRESS",
        sum(ABORTED) AS "ABORTED",
        sum(QUEUED) AS "QUEUED",
        STARTED::date AS "CREATED_AT"
    FROM BIMONTHLY_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    AND STARTED >= current_date  - interval ''30 day''
    GROUP BY "CREATED_AT"
    ORDER BY "CREATED_AT";';

  test_results_30_model :=
  '
{
     "series": [
       {
         "axis": "y",
         "dataset": "dataset",
         "key": "PASSED",
         "label": "PASSED",
         "color": "#5cb85c",
         "thickness": "10px",
         "type": [
           "line",
           "dot",
           "area"
         ],
         "id": "PASSED"
       },
       {
         "axis": "y",
         "dataset": "dataset",
         "key": "FAILED",
         "label": "FAILED",
         "color": "#d9534f",
       "thickness": "10px",
         "type": [
           "line",
           "dot",
           "area"
         ],
         "id": "FAILED"
       },
    {
          "axis": "y",
          "dataset": "dataset",
          "key": "KNOWN_ISSUE",
          "label": "KNOWN_ISSUE",
          "color": "#AA5C33",
          "thickness": "10px",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "KNOWN_ISSUE"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "SKIPPED",
          "label": "SKIPPED",
          "color": "#f0ad4e",
          "thickness": "10px",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "SKIPPED"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "ABORTED",
          "label": "ABORTED",
          "color": "#AAAAAA",
          "thickness": "10px",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "ABORTED"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "QUEUED",
          "label": "QUEUED",
          "color": "#6C6C6C",
          "thickness": "10px",
          "type": [
              "line",
              "dot",
              "area"
          ],
          "id": "QUEUED"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "IN_PROGRESS",
          "label": "IN_PROGRESS",
          "color": "#3a87ad",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "IN_PROGRESS"
        }
      ],
      "axes": {
        "x": {
          "key": "CREATED_AT",
          "type": "date",
          "ticks": "functions(value) {return ''wow!''}"
        }
      }
    }';

  monthly_platform_pass_rate_sql :=
  '
SELECT
      case when (PLATFORM IS NULL AND BROWSER <> '''') then ''WEB''
           when (PLATFORM = ''*'' AND BROWSER <> '''') then ''WEB''
           when (PLATFORM IS NULL AND BROWSER = '''') then ''API''
           when (PLATFORM = ''*''  AND BROWSER = '''') then ''API''
           else PLATFORM end AS "PLATFORM",
      Build AS "BUILD",
      sum( PASSED ) AS "PASSED",
      sum( FAILED ) AS "FAILED",
      sum( KNOWN_ISSUE ) AS "KNOWN ISSUE",
      sum( SKIPPED) AS "SKIPPED",
      sum( ABORTED ) AS "ABORTED",
      sum(QUEUED) AS "QUEUED",
      sum(TOTAL) AS "TOTAL",
      round (100.0 * sum( PASSED ) / sum(TOTAL), 0)::integer AS "PASSED (%)",
      round (100.0 * sum( FAILED ) / sum(TOTAL), 0)::integer AS "FAILED (%)",
      round (100.0 * sum( KNOWN_ISSUE ) / sum(TOTAL), 0)::integer AS "KNOWN ISSUE (%)",
      round (100.0 * sum( SKIPPED ) / sum(TOTAL), 0)::integer AS "SKIPPED (%)",
      round (100.0 * sum( ABORTED) / sum(TOTAL), 0)::integer AS "ABORTED (%)",
      round (100.0 * sum( QUEUED ) / sum(TOTAL), 0)::integer AS "QUEUED (%)"
  FROM MONTHLY_VIEW
  WHERE PROJECT LIKE ANY (''{#{project}}'')
  GROUP BY "PLATFORM", "BUILD"
  ORDER BY "PLATFORM"';

  monthly_platform_pass_rate_model :=
  '
{
      "columns": [
        "PLATFORM",
        "BUILD",
        "PASSED",
        "FAILED",
        "KNOWN ISSUE",
        "SKIPPED",
        "ABORTED",
        "QUEUED",
        "TOTAL",
        "PASSED (%)",
        "FAILED (%)",
        "KNOWN ISSUE (%)",
        "SKIPPED (%)",
        "ABORTED (%)",
        "QUEUED (%)"
      ]
    }';

  monthly_details_sql :=
  '
SELECT
        OWNER AS "OWNER",
        ''<a href="#{zafiraURL}/#!/dashboards/'||personal_dashboard_id||'?userId='' || OWNER_ID || ''" target="_blank">'' || OWNER || '' - Personal Board</a>'' AS "REPORT",
        SUM(PASSED) AS "PASSED",
        SUM(FAILED) AS "FAILED",
        SUM(KNOWN_ISSUE) AS "KNOWN ISSUE",
        SUM(SKIPPED) AS "SKIPPED",
        SUM(QUEUED) AS "QUEUED",
        SUM(TOTAL) AS "TOTAL",
        round (100.0 * SUM(PASSED) / (SUM(TOTAL)), 0)::integer AS "PASSED (%)",
        round (100.0 * SUM(FAILED) / (SUM(TOTAL)), 0)::integer AS "FAILED (%)",
        round (100.0 * SUM(KNOWN_ISSUE) / (SUM(TOTAL)), 0)::integer AS "KNOWN ISSUE (%)",
        round (100.0 * SUM(SKIPPED) / (SUM(TOTAL)), 0)::integer AS "SKIPPED (%)",
        round (100.0 * sum( QUEUED ) / sum(TOTAL), 0)::integer AS "QUEUED (%)",
        round (100.0 * (SUM(TOTAL)-SUM(PASSED)) / (SUM(TOTAL)), 0)::integer AS "FAIL RATE (%)"
    FROM MONTHLY_VIEW
    WHERE
    PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY OWNER_ID, OWNER
    ORDER BY OWNER';

  monthly_details_model :=
  '
{
      "columns": [
        "OWNER",
        "REPORT",
        "PASSED",
        "FAILED",
        "KNOWN ISSUE",
        "SKIPPED",
        "QUEUED",
        "TOTAL",
        "PASSED (%)",
        "FAILED (%)",
        "KNOWN ISSUE (%)",
        "SKIPPED (%)",
        "QUEUED (%)"
      ]
    }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('MONTHLY TOTAL', 'piechart', monthly_total_sql, monthly_total_model)
      RETURNING id INTO monthly_total_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TEST RESULTS (LAST 30 DAYS)', 'linechart', test_results_30_sql, test_results_30_model)
      RETURNING id INTO test_results_30_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('MONTHLY PLATFORM DETAILS', 'table', monthly_platform_pass_rate_sql, monthly_platform_pass_rate_model)
      RETURNING id INTO monthly_platform_pass_rate_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('MONTHLY DETAILS', 'table', monthly_details_sql, monthly_details_model)
      RETURNING id INTO monthly_details_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (monthly_dashboard_id, monthly_total_id, '{"x":0,"y":0,"height":11,"width":3}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (monthly_dashboard_id, test_results_30_id, '{"x":6,"y":0,"height":11,"width":6}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (monthly_dashboard_id, monthly_platform_pass_rate_id, '{"x":0,"y":22,"width":12,"height":18}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (monthly_dashboard_id, monthly_details_id, '{"x":0,"y":11,"height":11,"width":12}');

  -- Insert Weekly dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('Weekly Regression', FALSE, 3) RETURNING id INTO weekly_dashboard_id;

  weekly_total_sql :=
  '
SELECT
       unnest(array[''PASSED'', ''FAILED'', ''SKIPPED'', ''KNOWN ISSUE'', ''ABORTED'', ''QUEUED'']) AS "label",
       unnest(array[''#109D5D'', ''#DC4437'', ''#FCBE1F'', ''#AA5C33'', ''#AAAAAA'', ''#6C6C6C'']) AS "color",
       unnest(array[SUM(PASSED), SUM(FAILED), SUM(SKIPPED), SUM(KNOWN_ISSUE), SUM(ABORTED), SUM(QUEUED)]) AS "value"
    FROM WEEKLY_VIEW
    WHERE
        PROJECT LIKE ANY (''{#{project}}'')
    ORDER BY "value" DESC';

  weekly_total_model :=
  '
{
       "thickness": 20
   }';

  weekly_test_results_sql :=
  '
SELECT
        sum(PASSED) AS "PASSED",
        sum(FAILED) AS "FAILED",
        sum(KNOWN_ISSUE) AS "KNOWN_ISSUE",
        sum(SKIPPED) AS "SKIPPED",
        sum(IN_PROGRESS) AS "IN_PROGRESS",
        sum(ABORTED) AS "ABORTED",
        sum(QUEUED) AS "QUEUED",
        STARTED::date AS "CREATED_AT"
    FROM MONTHLY_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    AND STARTED >= current_date  - interval ''7 day''
    GROUP BY "CREATED_AT"
    ORDER BY "CREATED_AT";';

  weekly_test_results_model :=
  '
{
     "series": [
       {
         "axis": "y",
         "dataset": "dataset",
         "key": "PASSED",
         "label": "PASSED",
         "color": "#5cb85c",
         "thickness": "10px",
         "type": [
           "line",
           "dot",
           "area"
         ],
         "id": "PASSED"
       },
       {
         "axis": "y",
         "dataset": "dataset",
         "key": "FAILED",
         "label": "FAILED",
         "color": "#d9534f",
       "thickness": "10px",
         "type": [
           "line",
           "dot",
           "area"
         ],
         "id": "FAILED"
       },
    {
          "axis": "y",
          "dataset": "dataset",
          "key": "KNOWN_ISSUE",
          "label": "KNOWN_ISSUE",
          "color": "#AA5C33",
          "thickness": "10px",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "KNOWN_ISSUE"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "SKIPPED",
          "label": "SKIPPED",
          "color": "#f0ad4e",
        "thickness": "10px",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "SKIPPED"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "ABORTED",
          "label": "ABORTED",
          "color": "#AAAAAA",
        "thickness": "10px",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "ABORTED"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "IN_PROGRESS",
          "label": "IN_PROGRESS",
          "color": "#3a87ad",
          "type": [
            "line",
            "dot",
            "area"
          ],
          "id": "IN_PROGRESS"
        },
        {
          "axis": "y",
          "dataset": "dataset",
          "key": "QUEUED",
          "label": "QUEUED",
          "color": "#6C6C6C",
          "type": [
              "line",
              "dot",
              "area"
          ],
          "id": "QUEUED"
        }
      ],
      "axes": {
        "x": {
          "key": "CREATED_AT",
          "type": "date",
          "ticks": "functions(value) {return ''wow!''}"
        }
      }
    }';

  weekly_platform_details_sql :=
  '
SELECT
        case when (PLATFORM IS NULL AND BROWSER <> '''') then ''WEB''
             when (PLATFORM = ''*'' AND BROWSER <> '''') then ''WEB''
             when (PLATFORM IS NULL AND BROWSER = '''') then ''API''
             when (PLATFORM = ''*''  AND BROWSER = '''') then ''API''
             else PLATFORM end AS "PLATFORM",
        Build AS "BUILD",
        sum( PASSED ) AS "PASSED",
        sum( FAILED ) AS "FAILED",
        sum( KNOWN_ISSUE ) AS "KNOWN ISSUE",
        sum( SKIPPED) AS "SKIPPED",
        sum( ABORTED ) AS "ABORTED",
        sum( QUEUED ) AS "QUEUED",
        sum(TOTAL) AS "TOTAL",
        round (100.0 * sum( PASSED ) / sum(TOTAL), 0)::integer AS "PASSED (%)",
        round (100.0 * sum( FAILED ) / sum(TOTAL), 0)::integer AS "FAILED (%)",
        round (100.0 * sum( KNOWN_ISSUE ) / sum(TOTAL), 0)::integer AS "KNOWN ISSUE (%)",
        round (100.0 * sum( SKIPPED ) / sum(TOTAL), 0)::integer AS "SKIPPED (%)",
        round (100.0 * sum( ABORTED) / sum(TOTAL), 0)::integer AS "ABORTED (%)",
        round (100.0 * sum( QUEUED ) / sum(TOTAL), 0)::integer AS "QUEUED (%)"
    FROM WEEKLY_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY "PLATFORM", "BUILD"
    ORDER BY "PLATFORM"';

  weekly_platform_details_model :=
  '
{
      "columns": [
        "PLATFORM",
        "BUILD",
        "PASSED",
        "FAILED",
        "KNOWN ISSUE",
        "SKIPPED",
        "ABORTED",
        "QUEUED",
        "TOTAL",
        "PASSED (%)",
        "FAILED (%)",
        "KNOWN ISSUE (%)",
        "SKIPPED (%)",
        "ABORTED (%)",
        "QUEUED (%)"
      ]
    }';

  weekly_details_sql :=
  '
SELECT
        OWNER AS "OWNER",
        ''<a href="#{zafiraURL}/#!/dashboards/'||personal_dashboard_id||'?userId='' || OWNER_ID || ''" target="_blank">'' || OWNER || '' - Personal Board</a>'' AS "REPORT",
        SUM(PASSED) AS "PASSED",
        SUM(FAILED) AS "FAILED",
        SUM(KNOWN_ISSUE) AS "KNOWN ISSUE",
        SUM(SKIPPED) AS "SKIPPED",
        sum( QUEUED ) AS "QUEUED",
        SUM(TOTAL) AS "TOTAL",
        round (100.0 * SUM(PASSED) / (SUM(TOTAL)), 0)::integer AS "PASSED (%)",
        round (100.0 * SUM(FAILED) / (SUM(TOTAL)), 0)::integer AS "FAILED (%)",
        round (100.0 * SUM(KNOWN_ISSUE) / (SUM(TOTAL)), 0)::integer AS "KNOWN ISSUE (%)",
        round (100.0 * SUM(SKIPPED) / (SUM(TOTAL)), 0)::integer AS "SKIPPED (%)",
        round (100.0 * sum( QUEUED ) / sum(TOTAL), 0)::integer AS "QUEUED (%)",
        round (100.0 * (SUM(TOTAL)-SUM(PASSED)) / (SUM(TOTAL)), 0)::integer AS "FAIL RATE (%)"
   FROM WEEKLY_VIEW
   WHERE
   PROJECT LIKE ANY (''{#{project}}'')
   GROUP BY OWNER_ID, OWNER
   ORDER BY OWNER';

  weekly_details_model :=
  '
{
      "columns": [
        "OWNER",
        "REPORT",
        "PASSED",
        "FAILED",
        "KNOWN ISSUE",
        "SKIPPED",
        "QUEUED",
        "TOTAL",
        "PASSED (%)",
        "FAILED (%)",
        "KNOWN ISSUE (%)",
        "SKIPPED (%)",
        "QUEUED (%)"
      ]
    }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('WEEKLY TOTAL', 'piechart', weekly_total_sql, weekly_total_model)
      RETURNING id INTO weekly_total_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('TEST RESULTS (LAST 7 DAYS)', 'linechart', weekly_test_results_sql, weekly_test_results_model)
      RETURNING id INTO weekly_test_results_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('WEEKLY PLATFORM DETAILS', 'table', weekly_platform_details_sql, weekly_platform_details_model)
      RETURNING id INTO weekly_platform_details_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('WEEKLY DETAILS', 'table', weekly_details_sql, weekly_details_model)
      RETURNING id INTO weekly_details_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (weekly_dashboard_id, weekly_total_id, '{"x":0,"y":0,"height":11,"width":3}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (weekly_dashboard_id, weekly_test_results_id, '{"x":6,"y":0,"height":11,"width":6}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (weekly_dashboard_id, weekly_platform_details_id, '{"x":0,"y":22,"height":20,"width":12}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (weekly_dashboard_id, weekly_details_id, '{"x":0,"y":11,"height":11,"width":12}');

  -- Insert Nightly dashboard data
  INSERT INTO DASHBOARDS (TITLE, HIDDEN, POSITION) VALUES ('Nightly Regression', FALSE, 2) RETURNING id INTO nightly_dashboard_id;

  nightly_total_sql :=
  '
SELECT
       unnest(array[''PASSED'', ''FAILED'', ''SKIPPED'', ''KNOWN ISSUE'', ''ABORTED'', ''QUEUED'']) AS "label",
       unnest(array[''#109D5D'', ''#DC4437'', ''#FCBE1F'', ''#AA5C33'', ''#AAAAAA'', ''#6C6C6C'']) AS "color",
       unnest(array[SUM(PASSED), SUM(FAILED), SUM(SKIPPED), SUM(KNOWN_ISSUE), SUM(ABORTED), SUM(QUEUED)]) AS "value"
    FROM NIGHTLY_VIEW
    WHERE
        PROJECT LIKE ANY (''{#{project}}'')
    ORDER BY "value" DESC';

  nightly_total_model := '
    {
        "thickness": 20
    }';

  nightly_platform_pass_rate_sql :=
  '
SELECT
        case when (PLATFORM IS NULL AND BROWSER <> '''') then ''WEB''
            when (PLATFORM = ''*'' AND BROWSER <> '''') then ''WEB''
            when (PLATFORM IS NULL AND BROWSER = '''') then ''API''
            when (PLATFORM = ''*''  AND BROWSER = '''') then ''API''
            else PLATFORM end AS "PLATFORM",
        Build AS "BUILD",
        sum( PASSED ) AS "PASSED",
        sum( FAILED ) AS "FAILED",
        sum( KNOWN_ISSUE ) AS "KNOWN ISSUE",
        sum( SKIPPED) AS "SKIPPED",
        sum( ABORTED ) AS "ABORTED",
        sum( QUEUED ) AS "QUEUED",
        sum(TOTAL) AS "TOTAL",
        round (100.0 * sum( PASSED ) / sum(TOTAL), 0)::integer AS "PASSED (%)",
        round (100.0 * sum( FAILED ) / sum(TOTAL), 0)::integer AS "FAILED (%)",
        round (100.0 * sum( KNOWN_ISSUE ) / sum(TOTAL), 0)::integer AS "KNOWN ISSUE (%)",
        round (100.0 * sum( SKIPPED ) / sum(TOTAL), 0)::integer AS "SKIPPED (%)",
        round (100.0 * sum( ABORTED) / sum(TOTAL), 0)::integer AS "ABORTED (%)",
        round (100.0 * sum( QUEUED) / sum(TOTAL), 0)::integer AS "QUEUED (%)"
    FROM NIGHTLY_VIEW
    WHERE PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY "PLATFORM", "BUILD"
    ORDER BY "PLATFORM"';

  nightly_platform_pass_rate_model :=
  '
{
      "columns": [
        "PLATFORM",
        "BUILD",
        "PASSED",
        "FAILED",
        "KNOWN ISSUE",
        "SKIPPED",
        "ABORTED",
        "QUEUED",
        "TOTAL",
        "PASSED (%)",
        "FAILED (%)",
        "KNOWN ISSUE (%)",
        "SKIPPED (%)",
        "ABORTED (%)",
        "QUEUED (%)"
      ]
    }';

  nightly_details_sql :=
  '
SELECT
        OWNER AS "OWNER",
        ''<a href="#{zafiraURL}/#!/dashboards/'||personal_dashboard_id||'?userId='' || OWNER_ID || ''" target="_blank">'' || OWNER || '' - Personal Board</a>'' AS "REPORT",
        SUM(PASSED) AS "PASSED",
        SUM(FAILED) AS "FAILED",
        SUM(KNOWN_ISSUE) AS "KNOWN ISSUE",
        SUM(SKIPPED) AS "SKIPPED",
        sum( QUEUED ) AS "QUEUED",
        SUM(TOTAL) AS "TOTAL",
        round (100.0 * SUM(PASSED) / (SUM(TOTAL)), 0)::integer AS "PASSED (%)",
        round (100.0 * SUM(FAILED) / (SUM(TOTAL)), 0)::integer AS "FAILED (%)",
        round (100.0 * SUM(KNOWN_ISSUE) / (SUM(TOTAL)), 0)::integer AS "KNOWN ISSUE (%)",
        round (100.0 * SUM(SKIPPED) / (SUM(TOTAL)), 0)::integer AS "SKIPPED (%)",
        round (100.0 * sum( QUEUED) / sum(TOTAL), 0)::integer AS "QUEUED (%)",
        round (100.0 * (SUM(TOTAL)-SUM(PASSED)) / (SUM(TOTAL)), 0)::integer AS "FAIL RATE (%)"
    FROM NIGHTLY_VIEW
    WHERE
      PROJECT LIKE ANY (''{#{project}}'')
    GROUP BY OWNER_ID, OWNER
    ORDER BY OWNER';

  nightly_details_model :=
  '
{
      "columns": [
        "OWNER",
        "REPORT",
        "PASSED",
        "FAILED",
        "KNOWN ISSUE",
        "SKIPPED",
        "QUEUED",
        "TOTAL",
        "PASSED (%)",
        "FAILED (%)",
        "KNOWN ISSUE (%)",
        "SKIPPED (%)",
        "QUEUED (%)"
      ]
    }';

  nightly_person_pass_rate_sql :=
  '
  SELECT
  MIN(Updated) AS "REGRESSION DATE"
  FROM NIGHTLY_VIEW;';

  nightly_person_pass_rate_model :=
  '{
      "columns": [
          "REGRESSION DATE"
      ]
  }';

  nightly_failures_sql :=
  '
SELECT count(*) AS "COUNT",
      ''<a href="#{zafiraURL}/#!/dashboards/'||failures_dashboard_id||'?hashcode='' || max(MESSAGE_HASHCODE)  || ''" target="_blank">Failures Analysis Report</a>'' AS "REPORT",
      substring(MESSAGE from 1 for 210) as "MESSAGE"
  FROM NIGHTLY_FAILURES_VIEW
  GROUP BY substring(MESSAGE from 1 for 210)
  HAVING count(*) > 0
  ORDER BY "COUNT" desc, "MESSAGE"';

  nightly_failures_model :=
  '{
      "columns": [
          "COUNT",
          "REPORT",
          "MESSAGE"
      ]
  }';

  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY TOTAL', 'piechart', nightly_total_sql, nightly_total_model)
      RETURNING id INTO nightly_total_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY PLATFORM DETAILS', 'table', nightly_platform_pass_rate_sql, nightly_platform_pass_rate_model)
      RETURNING id INTO nightly_platform_pass_rate_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY DETAILS', 'table', nightly_details_sql, nightly_details_model)
      RETURNING id INTO nightly_details_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY (DATE)', 'table', nightly_person_pass_rate_sql, nightly_person_pass_rate_model)
      RETURNING id INTO nightly_person_pass_rate_id;
  INSERT INTO WIDGETS (TITLE, TYPE, SQL, MODEL) VALUES
                                                       ('NIGHTLY FAILURES', 'table', nightly_failures_sql, nightly_failures_model)
      RETURNING id INTO nightly_failures_id;

  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (nightly_dashboard_id, nightly_total_id, '{"x":0,"y":0,"height":11,"width":4}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (nightly_dashboard_id, nightly_platform_pass_rate_id, '{"x":0,"y":22,"height":15,"width":12}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (nightly_dashboard_id, nightly_details_id, '{"x":0,"y":11,"height":11,"width":12}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (nightly_dashboard_id, nightly_person_pass_rate_id, '{"x":8,"y":0,"width":4,"height":11}');
  INSERT INTO DASHBOARDS_WIDGETS (DASHBOARD_ID, WIDGET_ID, LOCATION) VALUES
                                                                            (nightly_dashboard_id, nightly_failures_id, '{"x":0,"y":37,"width":12,"height":22}');

END$$;
