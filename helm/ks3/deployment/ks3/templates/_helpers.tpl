{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ks3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ks3.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ks3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create liveness probe settings
*/}}
{{- define "ks3.livenessProbeSettings" -}}
initialDelaySeconds: {{ .Values.common.probes.livenessProbeDelay }}
periodSeconds: {{ .Values.common.probes.livenessProbePeriod }}
timeoutSeconds: {{ .Values.common.probes.livenessProbeTimeout }}
successThreshold: {{ .Values.common.probes.livenessProbeSuccessThreshold }}
failureThreshold: {{ .Values.common.probes.livenessProbeFailureThreshold }}
{{- end -}}

{{/*
Create readiness probe settings
*/}}
{{- define "ks3.readinessProbeSettings" -}}
initialDelaySeconds: {{ .Values.common.probes.readinessProbeDelay }}
periodSeconds: {{ .Values.common.probes.readinessProbePeriod }}
timeoutSeconds: {{ .Values.common.probes.readinessProbeTimeout }}
successThreshold: {{ .Values.common.probes.readinessProbeSuccessThreshold }}
failureThreshold: {{ .Values.common.probes.readinessProbeFailureThreshold }}
{{- end -}}

