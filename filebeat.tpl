{{range .configList}}
queue.mem.flush.min_events: 1536 
queue.mem.events: 2048
- type: log
  enabled: true
  paths:
      - {{ .HostDir }}/{{ .File }}
  max_bytes: 40960
  multiline.pattern:  '^\['
  multiline.negate: true
  multiline.match: after
  multiline.max_lines: 10000
  multiline.timeout: 3s
  scan_frequency: 1s
  fields_under_root: true
  {{if .Stdout}}
  docker-json: true
  {{end}}
  {{if eq .Format "json"}}
  json.keys_under_root: true
  {{end}}
  fields:
      {{range $key, $value := .Tags}}
      {{ $key }}: {{ $value }}
      {{end}}
      {{range $key, $value := $.container}}
      {{ $key }}: {{ $value }}
      {{end}}
  tail_files: false
  close_inactive: 2h
  close_eof: false
  close_removed: true
  clean_removed: true
  close_renamed: false

{{end}}
