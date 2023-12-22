# Custom Alfresco Helm Charts Repository

Welcome to the Alfresco Helm Charts Repository! This repository contains Helm charts for deploying Custom Alfresco helm chart.

Charts are divided into subcharts and parent chart 

Subchart URL : https://cbautistadev.github.io/alfresco-helm-charts/

Parent URL: https://cbautistadev.github.io/alfresco-helm-charts/parent

## Adding the Subchart Helm Repository

To use the charts from this repository, you first need to add it to your Helm client. Run the following command:

```
helm repo add custom-alfresco https://cbautistadev.github.io/alfresco-helm-charts/

helm repo add custom-alfresco-parent https://cbautistadev.github.io/alfresco-helm-charts/parent
```


## Updating the subcharts Helm Repository

To ensure you have the latest version of the charts, update your Helm repositories:

```
helm repo update
```


## Searching for Charts

To find charts within the Alfresco repository, use:

```
helm search repo custom-alfresco

```


## Installing a Chart

To install a chart from this repository, use the following syntax:

```
helm install [RELEASE_NAME] custom-alfresco/[CHART_NAME]

helm install [RELEASE_NAME] custom-alfresco-parent/[CHART_NAME]
```


