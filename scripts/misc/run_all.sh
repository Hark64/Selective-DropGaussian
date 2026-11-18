eval "$(conda shell.bash hook)"
# train dropgs
cd /code/hmann02/DropGaussian_release
conda activate dropgs
for n in {1..20}; do bash ./scripts/train_llff.sh > /code/hmann02/visualizer/dropgs/output_$n.txt 2>&1; done

# train sdropgs
cd /code/hmann02/Selective_DropGaussian
conda activate sdropgs
for n in {1..20}; do bash ./scripts/train_llff.sh > /code/hmann02/visualizer/sdropgs/output_$n.txt 2>&1; done

# train 3dgs
cd /code/hmann02/gaussian-splatting/
conda activate 3dgs
bash /code/hmann02/gaussian-splatting/train_llff.sh > /code/hmann02/visualizer/3dgs.txt 2>&1 

# train fastgs
cd /code/hmann02/FastGS/
conda activate fastgs
bash /code/hmann02/FastGS/train_llff.sh > /code/hmann02/visualizer/fastgs.txt 2>&1 

# cleanup
cd /code/hmann02/visualizer
sed -i 's/.*\r//' *.txt
cd ./dropgs
sed -i 's/.*\r//' *.txt
cd ../sdropgs
sed -i 's/.*\r//' *.txt