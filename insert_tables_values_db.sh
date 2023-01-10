#!/bin/bash
rm cyberpunk.db
sqlite3 cyberpunk.db ".read tables.sql"
sqlite3 cyberpunk.db ".read values.sql"
