view: cities {
  sql_table_name: `geospatial_data.cities`
    ;;
  drill_fields: [id]

  parameter: dashboard_selection_test {
    type: unquoted
    allowed_value: {
      label: "Today"
      value: "today"
    }
    allowed_value: {
      label: "This week"
      value: "this_week"
    }
    allowed_value: {
      label: "This month"
      value: "this_month"
    }
    allowed_value: {
      label: "This quarter"
      value: "this_quarter"
    }
    allowed_value: {
      label: "This year"
      value: "this_year"
    }
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.state_id ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  #----------------------------------------------------------------------------------------

  dimension: wiki_data_id {
    type: string
    sql: ${TABLE}.wikiDataId ;;
    link: {
      label: "Link that passes filter to Dashboard"
      url: "https://gcpl2210.cloud.looker.com/dashboards/12?State+Name={{ _filters['states.name'] | url_encode}}"
    }
    # link: {
    #   label: "Link that passes filter to Look"
    #   url: "https://gcpl2210.cloud.looker.com/looks/4&f[states.name]={{ _filters['states.name'] | url_encode}}"
    # }
  }

  dimension: state_id_with_link {
    type: number
    sql: ${TABLE}.state_id ;;
    link: {
      label: "Link that passes value you click on"
      url: "https://gcpl2210.cloud.looker.com/explore/david-c-test/cities?fields=states.country_id,states.country_name,states.latitude,states.longitude,states.name&f[states.id]={{value | url_encode}}&sorts=states.country_id&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22type%22%3A%22looker_single_record%22%2C%22defaults_version%22%3A1%7D"
      }
  }

  dimension: state_name_with_link {
    type: string
    sql: ${TABLE}.state_name ;;
    link: {
      label: "Link that passes another field's value"
      url: "https://gcpl2210.cloud.looker.com/explore/david-c-test/cities?fields=states.country_id,states.country_name,states.latitude,states.longitude,states.name&f[states.id]={{cities.state_id._value | url_encode}}&sorts=states.country_id&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22type%22%3A%22looker_single_record%22%2C%22defaults_version%22%3A1%7D"
    }
  }

  #----------------------------------------------------------------------------------------

  measure: count {
    type: count
    #drill_fields: [detail*]
  }

  measure: filter_link {
    type: count
  }

  measure: other_field_value_link {
    type: count
  }


  # ----- Sets of fields for drilling ------
  # set: detail {
  #   fields: [
  #     id,
  #     state_name,
  #     name,
  #     country_name,
  #     states.name,
  #     states.country_name,
  #     states.id
  #   ]
  # }
}
