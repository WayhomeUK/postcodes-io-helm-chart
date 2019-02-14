{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "postcodes-io.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Name for the API
*/}}
{{- define "postcodes-io.api.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-api" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for the API
*/}}
{{- define "postcodes-io.api.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-api" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Name for the database
*/}}
{{- define "postcodes-io.database.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-database" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified name for the database
*/}}
{{- define "postcodes-io.database.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-database" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
