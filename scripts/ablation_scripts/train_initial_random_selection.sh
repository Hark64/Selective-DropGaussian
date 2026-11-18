# for n in {1..20}; do bash ./scripts/train_combos_3.sh > /code/hmann02/visualizer/main_run/output_$n.txt 2>&1; done
# sed -i 's/.*\r//' *.txt

echo "Training Optimal_500i"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/optimal_500i --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/optimal_500i.png --noise_factor 1e-01 --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/optimal_500i -r 8
echo "Training optimal_1000i"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/optimal_1000i --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/optimal_1000i.png --noise_factor 1e-01 --initial_rand_drop_iterations 1000
python render.py -m /files/hmann02/output/ablations/llff3/optimal_1000i -r 8
echo "Training optimal_1500i"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/optimal_1500i --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/optimal_1500i.png --noise_factor 1e-01 --initial_rand_drop_iterations 1500
python render.py -m /files/hmann02/output/ablations/llff3/optimal_1500i -r 8

