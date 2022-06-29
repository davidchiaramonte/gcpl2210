connection: "david-c-test"

# include all the views
include: "/views/**/*.view"

datagroup: david-c-test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: david-c-test_default_datagroup

explore: states {}

explore: countries {}

explore: cities {
  join: states {
    type: left_outer
    sql_on: ${cities.state_id} = ${states.id} ;;
    relationship: many_to_one
  }
}
