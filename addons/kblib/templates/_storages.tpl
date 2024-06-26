{{/*
Define component storages, including volumeClaimTemplates
*/}}
{{- define "kblib.componentStorages" }}
volumeClaimTemplates:
  - name: data # ref clusterDefinition components.containers.volumeMounts.name
    spec:
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: {{ print .Values.storage "Gi" }}
      {{- if .Values.storageClassName }}
      storageClassName: {{ .Values.storageClassName | quote }}
      {{- end }}
{{- end }}
