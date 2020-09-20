#!/bin/bash

docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres --name odoo-db postgres:12.4-alpine
docker run -d -p 8069:8069 --name odoo --link odoo-db:db -t odoo:13.0
