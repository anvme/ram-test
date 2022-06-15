#!/bin/bash

# https://github.com/anvme

RRS=$(sysbench memory --memory-block-size=4k --memory-total-size=32G --memory-oper=read --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWS=$(sysbench memory --memory-block-size=4k --memory-total-size=32G --memory-oper=write --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RRR=$(sysbench memory --memory-block-size=4k --memory-total-size=32G --memory-oper=read --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWR=$(sysbench memory --memory-block-size=4k --memory-total-size=32G --memory-oper=write --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')

RRS1=$(sysbench memory --memory-block-size=64k --memory-total-size=32G --memory-oper=read --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWS1=$(sysbench memory --memory-block-size=64k --memory-total-size=32G --memory-oper=write --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RRR1=$(sysbench memory --memory-block-size=64k --memory-total-size=32G --memory-oper=read --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWR1=$(sysbench memory --memory-block-size=64k --memory-total-size=32G --memory-oper=write --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')

RRS2=$(sysbench memory --memory-block-size=512k --memory-total-size=32G --memory-oper=read --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWS2=$(sysbench memory --memory-block-size=512k --memory-total-size=32G --memory-oper=write --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RRR2=$(sysbench memory --memory-block-size=512k --memory-total-size=32G --memory-oper=read --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWR2=$(sysbench memory --memory-block-size=512k --memory-total-size=32G --memory-oper=write --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')

RRS3=$(sysbench memory --memory-block-size=1M --memory-total-size=32G --memory-oper=read --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWS3=$(sysbench memory --memory-block-size=1M --memory-total-size=32G --memory-oper=write --memory-access-mode=seq run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RRR3=$(sysbench memory --memory-block-size=1M --memory-total-size=32G --memory-oper=read --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')
RWR3=$(sysbench memory --memory-block-size=1M --memory-total-size=32G --memory-oper=write --memory-access-mode=rnd run | awk '/transferred/ {print $4,$5}' | tr -d '()')

echo -e "sysbench RAM Speed Tests:"
echo -e "---------------------------------"
printf "%-10s | %-8s %8s | %-9s %10s\n" "Block Size" "4k" "(Memory access mode)" "512k" "(Memory access mode)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "  ------" "---" "---- " "----" "---- "
printf "%-10s | %-20s %8s | %-19s %10s\n" "Read" "${RRS}" "(Seq)" "${RRS2}" "(Seq)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "Write" "${RWS}" "(Seq)" "${RWS2}" "(Seq)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "Read" "${RRR}" "(Rnd)" "${RRR2}" "(Rnd)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "Write" "${RWR}" "(Rnd)" "${RWR2}" "(Rnd)"
printf "%-10s | %-20s %8s | %-19s %10s\n" 
printf "%-10s | %-8s %8s | %-9s %10s\n" "Block Size" "64k" "(Memory access mode)" "1M" "(Memory access mode)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "  ------" "---" "---- " "----" "---- "
printf "%-10s | %-20s %8s | %-19s %10s\n" "Read" "${RRS1}" "(Seq)" "${RRS3}" "(Seq)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "Write" "${RWS1}" "(Seq)" "${RWS3}" "(Seq)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "Read" "${RRR1}" "(Rnd)" "${RRR3}" "(Rnd)"
printf "%-10s | %-20s %8s | %-19s %10s\n" "Write" "${RWR1}" "(Rnd)" "${RWR3}" "(Rnd)"