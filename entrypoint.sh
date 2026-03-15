#!/bin/bash

# Setup config awal
cp example_config.json config.json

# Database seed
npm run seed

# Otomasi input (User, Email, Pass, Pass Confirm, Admin Yes)
echo -e "admin\nadmin@gmail.com\nadmin12345\nadmin12345\nyes" | npm run createUser

# Start Panel
node .
