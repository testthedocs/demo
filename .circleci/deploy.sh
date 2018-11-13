#!/usr/bin/env bash
set -e # halt script on error

# Vars
NETLIFY_SITE_NAME=laughing-booth-4e77b6.netlify.com

# Zip it
zip -r website.zip ~/sphinx/html/_build/html

# Push it
curl -H "Content-Type: application/zip" \
     -H "Authorization: Bearer $NETLIFYKEY" \
     --data-binary "@website.zip" \
     https://api.netlify.com/api/v1/sites/$NETLIFY_SITE_NAME/deploys

