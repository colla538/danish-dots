#!/bin/sh

read -p "Commit message: " MSG

git add .
git commit -m "$MSG"
git push origin main

