#!/bin/bash

# CPU Total
top -b -n 1 | grep '%Cpu(s)' | awk '{total=$2 + $4 + $6 + $ 10; print "CPU Total: " total "%"}'

# Memory Total
mem_top_line=$(top -b -n 1 | grep "MiB Mem")
mem_total=$(echo "$mem_top_line" | awk '{print $4}')
mem_free=$(echo "$mem_top_line" | awk '{print $6}')
mem_used=$(echo "$mem_top_line" | awk '{print $8}')

mem_used_percentage=$(echo "scale=2; ($mem_used / $mem_total) * 100" | bc)
mem_free_percentage=$(echo "scale=2; ($mem_free / $mem_total) * 100" | bc)

echo "Total Memory(MiB): $mem_total \
| Free Memory(MiB): $mem_free($mem_free_percentage%) \
| Used Memory(MiB): $mem_used($mem_used_percentage%)"
# Consider buffer memory 5%

