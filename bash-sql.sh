#!/bin/bash
rm cyberpunk.db
sqlite3 cyberpunk.db ".read create-cyberpunk-db-tables.sql"
sqlite3 cyberpunk.db ".read test.sql"
