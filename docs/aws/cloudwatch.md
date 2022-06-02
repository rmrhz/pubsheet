# AWS Cloudwatch

## Command Dump
```bash
# Best possible outcome is to use the timestamp of the log as start-time and ingest timestamp for end-time **R1
aws logs get-log-events \
  --log-group-name "" \
  --log-stream-name "" \
  --start-time "" \
  --end-time "" \
  --query "events[*][message]" \
  --output text
```

## Log Insights
```
# [R1]
# --
fields @requestId, @ingestionTime, @timestamp, @log, @logStream
| filter @message like /{request_id}/
| filter @type = 'START'
| sort @timestamp asc

fields @requestId, @ingestionTime, @timestamp, @log, @logStream
| filter @message like /{request_id}/
| filter @type = 'REPORT'
| sort @timestamp asc
```
