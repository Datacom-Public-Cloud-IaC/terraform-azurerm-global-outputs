data "azurerm_storage_table_entity" "read" {
  for_each = local.read_entries

  storage_table_id = var.storage_table_url
  partition_key    = each.value.pk
  row_key          = each.value.rk
}


