exp_name='llff3'
scenes=("fern" "flower" "fortress" "horns" "leaves" "orchids" "room" "trex")
dataset_path='/files/hmann02/LLFF/llff'
n_views=3

for scene in "${scenes[@]}"
do
  echo "Training on $scene..."
  python train.py -s $dataset_path/$scene/ \
    -m /files/hmann02/output/select_dropgs/$exp_name/$scene \
    --eval -r 8 \
    --n_views $n_views
  
  echo "Rendering $scene..."
  python render.py -m /files/hmann02/output/select_dropgs/$exp_name/$scene -r 8
done

# Compute metrics for all scenes
python metric.py --path /files/hmann02/output/select_dropgs/$exp_name
