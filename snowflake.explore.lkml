include: "snowflake.*.view.lkml"

datagroup: default {
  max_cache_age: "48 hours"
  sql_trigger: select count(*) from exchangerate.forex_real ;;
}

access_grant: datablocks {
  user_attribute: access_datablocks
  allowed_values: ["yes"]
}

explore: forex {
  from: sf_forex_historical_real {}
  persist_with: default
  label: "Exchange Rates"
  view_label: "Exchangel Rates"
  description: "Daily closing exchange rates for major currencies going back to the introduction of the Euro in 1999 (Source: Forex)"
  required_access_grants: [datablocks]
}
