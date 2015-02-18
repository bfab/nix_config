#!/bin/bash

sed -Ei    "s/^#($1)$/\1 $2/" $3 2>/dev/null ||\
sed -Ei '' "s/^#($1)$/\1 $2/" $3
