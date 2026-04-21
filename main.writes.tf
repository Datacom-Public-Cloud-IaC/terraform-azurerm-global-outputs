resource "azurerm_storage_table_entity" "this" {
  count = var.writes != null ? 1 : 0

  storage_table_id = var.storage_table_url
  partition_key    = var.writes.partition_key
  row_key          = var.writes.row_key

  entity = {
    outputs = jsonencode(var.writes.outputs)
  }

  lifecycle {
    ignore_changes = [
      entity["UpdatedAt"],
    ]
  }
}
