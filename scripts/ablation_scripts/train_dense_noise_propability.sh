# for n in {1..20}; do bash ./scripts/train_combos.sh > /code/hmann02/visualizer/combos/output_$n.txt 2>&1; done
# sed -i 's/.*\r//' *.txt

# dense, best dense, percent dense, best+percent dense
echo "Training Dense"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/dense --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/test_outputs/pics/dense.png
python render.py -m /files/hmann02/output/ablations/llff3/dense -r 8
echo "Training Dense_Best"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/dense_best --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/test_outputs/pics/dense_best.png --use_best_view
python render.py -m /files/hmann02/output/ablations/llff3/dense_best -r 8
echo "Training Dense_Percent"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/dense_percent --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/test_outputs/pics/dense_percent.png --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/dense_percent -r 8
echo "Training Dense_Percent_Best"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/dense_best_percent --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/test_outputs/pics/dense_best_percent.png --use_best_view --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/dense_best_percent -r 8

echo "Training Noise0"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise0 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/noise0.png
python render.py -m /files/hmann02/output/ablations/llff3/noise0 -r 8
echo "Training Noise1"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise1 --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-01 --score_plot_path /code/hmann02/test_outputs/pics/noise1.png
python render.py -m /files/hmann02/output/ablations/llff3/noise1 -r 8
echo "Training Noise2"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise2 --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-02 --score_plot_path /code/hmann02/test_outputs/pics/noise2.png
python render.py -m /files/hmann02/output/ablations/llff3/noise2 -r 8
echo "Training Noise3"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise3 --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-02 --score_plot_path /code/hmann02/test_outputs/pics/noise3.png
python render.py -m /files/hmann02/output/ablations/llff3/noise3 -r 8

echo "Training Scores_As_Percent_to_Drop"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent.png --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/percent -r 8
echo "Training Percent_Noise1"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_noise1 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_noise1.png --use_score_as_percent --noise_factor 1e-01
python render.py -m /files/hmann02/output/ablations/llff3/percent_noise1 -r 8
echo "Training Percent_Noise2"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_noise2 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_noise2.png --use_score_as_percent --noise_factor 1e-02
python render.py -m /files/hmann02/output/ablations/llff3/percent_noise2 -r 8
echo "Training Percent_Noise2"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_noise3 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_noise3.png --use_score_as_percent --noise_factor 1e-02
python render.py -m /files/hmann02/output/ablations/llff3/percent_noise3 -r 8
