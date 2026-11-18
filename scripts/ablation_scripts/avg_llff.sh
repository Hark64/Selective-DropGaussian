for n in 3; do
    for i in {1..5}; do
        echo "starting: n=$n run=$i"
        ./scripts/train_llff.sh $n > /code/hmann02/test_outputs/sdropgs/${n}_view_${i}_iter.txt
        echo "done"
    done 
done 