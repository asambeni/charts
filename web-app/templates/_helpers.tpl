{{- define "web-app.base_labels" }}
    generator: "helm"
    helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
    app.kubernetes.io/name: "{{ .Release.Name }}"
{{- end }}

{{- define "web-app.selector_labels" }}
    app: "{{ .Release.Name }}"
{{- end }}

{{- define "web-app.kcert_labels"}}
    kcert.dev/ingress: "managed"
{{- end }}

{{- define "web-app.managed_cert_annotations" }}
    kubernetes.io/ingress.global-static-ip-name: {{ .Values.global.ipName }}
    networking.gke.io/managed-certificates: {{ .Release.Name }}-certificate
    kubernetes.io/ingress.class: "gce"
{{- end }}