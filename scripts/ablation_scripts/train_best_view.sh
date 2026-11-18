# for n in {1..20}; do bash ./scripts/train_combos_2.sh > /code/hmann02/visualizer/combos2/output_$n.txt 2>&1; done
# sed -i 's/.*\r//' *.txt

echo "Training Best_View"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_view --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_view.png --use_best_view
python render.py -m /files/hmann02/output/ablations/llff3/best_view -r 8
echo "Training Best_Noise1"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_noise1 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_noise1.png --use_best_view --noise_factor 1e-01
python render.py -m /files/hmann02/output/ablations/llff3/best_noise1 -r 8
echo "Training Best_Noise2"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_noise2 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_noise2.png --use_best_view --noise_factor 1e-02
python render.py -m /files/hmann02/output/ablations/llff3/best_noise2 -r 8


echo "Training Best_Percent"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_percent --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_percent.png --use_best_view --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/best_percent -r 8
