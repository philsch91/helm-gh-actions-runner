{{/*
adds a suffix to a given value if it does not already end with that suffix
*/}}
{{- define "addSuffix" -}}
{{- $value := .value -}}
{{- $suffix := .suffix -}}
{{- if not (hasSuffix $suffix $value) -}}
{{- printf "%s%s" $value $suffix -}}
{{- else -}}
{{- $value -}}
{{- end -}}
{{- end -}}

{{/*
renders the secret environment variables for the AutoscalingRunnerSet.actions.github.com/v1alpha1 resource
*/}}
{{- define "gha-runner-scale-set.secretEnvs" -}}
{{- range $data := .Values.secretEnvs }}
{{ $data.name }}: {{ $data.value }}
{{- end }}
{{- end -}}
