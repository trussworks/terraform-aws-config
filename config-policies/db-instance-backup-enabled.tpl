{
    ${join(
        ",",
        compact(
            list(
                backup_retention_period == "" ? "" : format("\"backupRetentionPeriod\": \"%s\"",backup_retention_period),
                preferred_backup_window == "" ? "" : format("\"preferredBackupWindow\": \"%s\"",preferred_backup_window),
                check_read_replicas == "" ? "" : format("\"checkReadReplicas\": \"%s\"",check_read_replicas),
            )
        )
    )}
}
