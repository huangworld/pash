#!/bin/bash
# tag: 1-syllable words
# set -e

IN=${IN:-$PASH_TOP/evaluation/benchmarks/poets/input/pg/}
OUT=${OUT:-$PASH_TOP/evaluation/benchmarks/poets/output/6_4/}
ENTRIES=${ENTRIES:-1000}
mkdir -p "$OUT"

for input in $(ls ${IN} | head -n ${ENTRIES})
do
    cat ${IN}/${input} | tr -sc '[A-Z][a-z]' '[\012*]' | grep -i '^[^aeiou]*[aeiou][^aeiou]*$' | sort | uniq -c | sed 5q > ${OUT}/${input}.out
done

echo 'done';
rm -rf "${OUT}"