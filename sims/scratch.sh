
for i in {100000..10000000}; do slim -d "L=${i}" bgs2.txt | msstats | awk '{print $4}' | sed '2d'; done


for i in $(seq 100000 100000 10000000); do echo $i; done

for i in $(seq 100000 100000 10000000); do slim -d "L=${i}" bgs2.txt | msstats | awk '{print $4}' | sed '2d'; done



for i in $(seq 1 1000); do slim -d L=100000 bgs2.txt | msstats | awk '{print $5}' | sed '1d;2d'; done | awk -v N=0 '{ sum += $N } END { if (NR > 0) print sum / NR }'