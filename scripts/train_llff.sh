for n_views in 3 6 9
do
  exp_name="llff$n_views"
  scenes=("fern" "flower" "fortress" "horns" "leaves" "orchids" "room" "trex")
  dataset_path='/files/hmann02/LLFF/llff'

  for scene in "${scenes[@]}"
  do
    echo "Training ${scene}_${n_views}_views..."
    python train.py -s $dataset_path/$scene/ \
      -m /files/hmann02/output/select_dropgs/$exp_name/$scene \
      --eval -r 8 \
      --n_views $n_views \
      --fastgs_importance_score prune \
      --noise_factor 1e-01 --initial_rand_drop_iterations 1000 \
      --score_plot_path /code/hmann02/test_outputs/pics/main_run/${n_views}_views/$scene.png

    echo "Rendering $scene..."
    python render.py -m /files/hmann02/output/select_dropgs/$exp_name/$scene -r 8
  done

  # Compute metrics for all scenes
  echo "Metrics ${n_views}_views..."
  python metric.py --path /files/hmann02/output/select_dropgs/$exp_name
done