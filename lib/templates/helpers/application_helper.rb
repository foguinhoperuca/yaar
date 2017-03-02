module ApplicationHelper
  def print_label_boolean(prop)
    if prop
      "<span class=\"label label-success\">#{t("general.bool_yes")}</span>".html_safe
    else
      "<span class=\"label label-danger\">#{t("general.bool_no")}</span>".html_safe
    end
  end

  def define_icon_class(entity)
    icons = {
      bill: "money",
      configuration_item: "",
      contestation: "money",
      contract_information: "money",
      criteria: "money",
      department: "print",
      group_printer_status: "print",
      invoice: "money",
      ip_address: "server",
      ip_range: "server",
      load_invoice: "money",
      log_failed_rawbill_import: "money",
      opinion: "money",
      outsource: "print",
      physical_site: "map-signs",
      physical_site_alias: "map-signs",
      physical_site_type: "map-signs",
      pms_system: "map-signs",
      printer_model: "print",
      printer_status: "print",
      printer_type: "print",
      printer: "print",
      rawbill: "money",
      vlan: "server"
    }

    icons[entity] || "print"
  end

  def disable_control
    controller.action_name == "show"
  end
end
