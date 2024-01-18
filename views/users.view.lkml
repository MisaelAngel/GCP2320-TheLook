view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  parameter: test {
    label: "parameter_label_test"
    # default_value: ""
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "Value 1"
      value: "Value_1"
    }
    allowed_value: {
      label: "Value 2"
      value: "Value_2"
    }
  }

  dimension: test_dimension_localization{
    label: "test_dimension"
    label_from_parameter: test
    sql: "Test" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_count {
    type: sum
    sql: count(${id}) ;;
  }

  measure: number_test {
    type: number
    sql: 4124286484150457 ;;
    # value_format: "[>999999999999]0.0,,,,\"T\";[>999999999]0.0,,,\"B\"; [>999999]0.0,,\"M\"; 0.0,\"K\""
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
