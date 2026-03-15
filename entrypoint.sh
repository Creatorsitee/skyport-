#!/bin/bash

# 1. Siapkan Config
cp example_config.json config.json

# 2. PAKSA port ke 3000 agar Railway kenal
# Kita ubah angka 5001 jadi 3000 di dalam file config
sed -i 's/5001/3000/g' config.json

# 3. Jalankan Database Seed
npm run seed

# 4. Otomasi Create User
# Saya tambahkan jeda (sleep) sedikit agar tidak tabrakan saat input
echo "Membuat user admin..."
(
 echo "admin";      # Username
 sleep 1;
 echo "admin@gmail.com"; # Email
 sleep 1;
 echo "admin12345";  # Password
 sleep 1;
 echo "admin12345";  # Confirm Password
 sleep 1;
 echo "yes";         # Admin?
) | npm run createUser

echo "Skyport siap di port 3000!"

# 5. Jalankan aplikasi
node .
