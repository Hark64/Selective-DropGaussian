# rand first

python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/base.png 
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/500.png --stop_rand_drop_iter 500
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/1000.png --stop_rand_drop_iter 1000
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/1500.png --stop_rand_drop_iter 1500
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8

python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/best.png --use_best_view
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/best_500.png --use_best_view --stop_rand_drop_iter 500
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/best_1000.png --use_best_view --stop_rand_drop_iter 1000
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/best_1500.png --use_best_view --stop_rand_drop_iter 1500
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8

python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/percent.png --use_score_as_percent
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/percent_500.png --use_score_as_percent --stop_rand_drop_iter 500
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/percent_1000.png --use_score_as_percent --stop_rand_drop_iter 1000
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/percent_1500.png --use_score_as_percent --stop_rand_drop_iter 1500
python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8

# # prune noise
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/plot.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-01 --score_plot_path /code/hmann02/noise1.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-02 --score_plot_path /code/hmann02/noise2.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-03 --score_plot_path /code/hmann02/noise3.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-04 --score_plot_path /code/hmann02/noise4.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-05 --score_plot_path /code/hmann02/noise5.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8

# # dense, best dense, percent dense
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/dense.png
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/best_dense.png --use_best_view
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score dense --score_plot_path /code/hmann02/percent_dense.png --use_score_as_percent
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8

# # best prune, percent prune
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/best.png --use_best_view
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
# python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/select_dropgs/llff3/fern --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/percent.png --use_score_as_percent
# python render.py -m /files/hmann02/output/select_dropgs/llff3/fern -r 8
