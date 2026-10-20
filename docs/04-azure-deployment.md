# Azure deployment

## What I deployed
The plan and its tier, the web app, and the command that deployed it.

## What I saw in the log
One line from the log, and what it told me.


Planen
--
az appservice plan create \
	--name asp-waypoint-fredrikr \
	--resource-group FredrikRutqvist \
	--is-linux \
	--sku B1 \
	--query provisioningStae \
	--output tsv
--



--
## 3. Webbappen

```bash

az webapp create \
        --name app-waypoint-fredrikr \
        --resource-group FredrikRutqvist \
        --plan asp-waypoint-fredrikr
        --runtime "NODE:24-lts" \
        --query defaultHostName \
        --output tsv

--
================
Lägg in dessa variabler
Sedan kör planen
Sedan kör webappen

================
detta verkar fungera efter att man startat planen
´´´bash
RESOURCE_GROUP=FredrikRutqvist
LOCATION=swedencentral
PLAN_NAME=asp-waypoint-fredrikr
PLAN_SKU=P0v3
APP_NAME=app-waypoint-fredrikr
RUNTIME="NODE:24-lts"

==
Planen
--
az appservice plan create \
	--name "$PLAN_NAME" \
	--resource-group "$RESOURCE_GROUP" \
	--is-linux \
	--sku "$PLAN_SKU" \
	--query provisioningStae \
	--output tsv
--

==

az webapp create \
    --name "$APP_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --plan "$PLAN_NAME" \
    --runtime "$RUNTIME" \
    --query defaultHostName \
    --output tsv


==================
==================
