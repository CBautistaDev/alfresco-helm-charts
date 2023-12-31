{{/*
Provide a PVC based on service and persistence values

Usage: include "alfresco-common.data_volume" $

*/}}
{{- define "alfresco-common.data_volume" -}}
- name: data
{{- $svc_name := .service.name }}
{{- with .persistence }}
{{- if .enabled }}
{{- $sc_name := .storageClass | default "default" }}
  persistentVolumeClaim:
    claimName: >-
      {{ .existingClaim | default (printf "%s-%s-pvc" $svc_name $sc_name ) }}
{{- else }}
  emptyDir:
    sizeLimit: {{ .baseSize | default "20Gi" | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "data_volume" -}}
{{- template "alfresco-common.data_volume" . }}
{{- end -}}

{{/*
Provide a PVC based on service and persistence values

Usage: include "alfresco-common.component_pvc" $

*/}}
{{- define "alfresco-common.component_pvc" -}}
{{ $svc_name := .service.name }}
{{- with .persistence }}
{{- $sc_name := .storageClass | default "default" -}}
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{ printf "%s-%s-pvc" $svc_name $sc_name }}
spec:
  {{- if .storageClass }}
  storageClassName: {{ .storageClass | quote }}
  {{- end }}
  {{- if .accessModes }}
  accessModes:
  {{- range .accessModes }}
    - {{ . }}
  {{- end }}
  {{- end }}
  volumeMode: {{ .volumeMode | default "Filesystem" }}
  resources:
    requests:
      storage: {{ .baseSize | default "20Gi" | quote }}
{{- end }}
{{- end -}}

{{- define "component_pvc" -}}
{{- template "alfresco-common.component_pvc" . }}
{{- end -}}
