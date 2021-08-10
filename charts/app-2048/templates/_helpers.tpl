{{/*
Gitlab annotations
*/}}
{{- define "chart-template.gitlabAnnotations" -}}
app.gitlab.com/app: {{ .Values.app }}
app.gitlab.com/env: {{ .Values.env }}
{{- end -}}

{{/*
Ingress annotations
*/}}
{{- define "chart-template.ingressAnnotations" -}}
{{ include "chart-template.gitlabAnnotations" . }}
alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig": {"Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'
alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
alb.ingress.kubernetes.io/scheme: internet-facing
alb.ingress.kubernetes.io/certificate-arn: {{ .Values.ingress.annotations.certificate_arn }}
alb.ingress.kubernetes.io/security-groups: {{ .Values.ingress.annotations.security_groups }}
alb.ingress.kubernetes.io/group.name: {{ .Values.ingress.annotations.group_name }}
kubernetes.io/ingress.class: {{ .Values.ingress.annotations.ingress_class }}
{{- end -}}
