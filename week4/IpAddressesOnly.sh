#!/bin/bash

./ipinfo.sh | sed -n '/IP Address/ {
    p
    }'