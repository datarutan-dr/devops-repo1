#!/usr/bin/env bash
# Remove Waypoint's web app, and its plan with it. Your resource group will remain.

# Usage: ./scripts/teardown-app-service.sh name rg-waypoint-name
set -euo pipefail

NAME="${1:?Give your name as the first argument}"
RESOURCE_GROUP="${2:?Give your resource group as the second argument}"
APP_NAME=app-waypoint-$NAME

echo "===> Deleting $APP_NAME, and its plan with it"
az webapp delete \
  --name "$APP_NAME" \
  --resource-group "$RESOURCE_GROUP"

echo "===> What is left in $RESOURCE_GROUP"
az resource list \
  --resource-group "$RESOURCE_GROUP" \
  --query "[].{Name:name, Type:type}" \
  --output table



