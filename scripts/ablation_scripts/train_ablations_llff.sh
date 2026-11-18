# for n in {1..5}; do bash test.sh > output_$n.txt 2>&1; done

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
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise3 --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-03 --score_plot_path /code/hmann02/test_outputs/pics/noise3.png
python render.py -m /files/hmann02/output/ablations/llff3/noise3 -r 8
echo "Training Noise4"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise4 --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-04 --score_plot_path /code/hmann02/test_outputs/pics/noise4.png
python render.py -m /files/hmann02/output/ablations/llff3/noise4 -r 8
echo "Training Noise5"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/noise5 --eval -r 8 --n_views 3 --fastgs_importance_score prune --noise_factor 1e-05 --score_plot_path /code/hmann02/test_outputs/pics/noise5.png
python render.py -m /files/hmann02/output/ablations/llff3/noise5 -r 8

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

# best prune, percent prune
echo "Training Best_View"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best.png --use_best_view
python render.py -m /files/hmann02/output/ablations/llff3/best -r 8
echo "Training Scores_As_Percent_to_Drop"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent.png --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/percent -r 8

# best + percent + noise
echo "Training Best_Percent_Noise0"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_percent --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_percent.png --use_best_view --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/best_percent -r 8
echo "Training Best_Percent_Noise1"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_percent_noise1 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_percent_noise1.png --use_best_view --use_score_as_percent --noise_factor 1e-01
python render.py -m /files/hmann02/output/ablations/llff3/best_percent_noise1 -r 8
echo "Training Best_Percent_Noise2"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_percent_noise2 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_percent_noise2.png --use_best_view --use_score_as_percent --noise_factor 1e-02
python render.py -m /files/hmann02/output/ablations/llff3/best_percent_noise2 -r 8




# First random selection, then score selection
# base + start rand
echo "Training Base_initial0"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/base_initial0 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/base_0.png 
python render.py -m /files/hmann02/output/ablations/llff3/base_initial0 -r 8
echo "Training Base_initial500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/base_initial500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/base_500.png --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/base_initial500 -r 8
echo "Training Base_initial1000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/base_initial1000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/base_1000.png --initial_rand_drop_iterations 1000
python render.py -m /files/hmann02/output/ablations/llff3/base_initial1000 -r 8
echo "Training Base_initial1500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/base_initial1500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/base_1500.png --initial_rand_drop_iterations 1500
python render.py -m /files/hmann02/output/ablations/llff3/base_initial1500 -r 8

# best view + start rand
echo "Training Best_initial0"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_initial0 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_0.png --use_best_view
python render.py -m /files/hmann02/output/ablations/llff3/best_initial0 -r 8
echo "Training Best_initial500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_initial500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_500.png --use_best_view --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/best_initial500 -r 8
echo "Training Best_initial1000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_initial1000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_1000.png --use_best_view --initial_rand_drop_iterations 1000
python render.py -m /files/hmann02/output/ablations/llff3/best_initial1000 -r 8
echo "Training Best_initial1500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_initial1500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_1500.png --use_best_view --initial_rand_drop_iterations 1500
python render.py -m /files/hmann02/output/ablations/llff3/best_initial1500 -r 8

# percent + start rand
echo "Training Percent_initial0"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent.png --use_score_as_percent
python render.py -m /files/hmann02/output/ablations/llff3/percent -r 8
echo "Training Percent_initial500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_initial500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_500.png --use_score_as_percent --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/percent_initial500 -r 8
echo "Training Percent_initial1000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_initial1000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_1000.png --use_score_as_percent --initial_rand_drop_iterations 1000
python render.py -m /files/hmann02/output/ablations/llff3/percent_initial1000 -r 8
echo "Training Percent_initial1500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_initial1500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_1500.png --use_score_as_percent --initial_rand_drop_iterations 1500
python render.py -m /files/hmann02/output/ablations/llff3/percent_initial1500 -r 8

# First score selection, then end w/ random selection
# Numbers determined from score plots of above ablations
echo "Training Base_end3500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/base_end3500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/base_end3500.png --final_rand_drop_iterations 3500
python render.py -m /files/hmann02/output/ablations/llff3/base_end3500 -r 8
echo "Training Best_end1500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_end1500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_end1500.png --use_best_view --final_rand_drop_iterations 1500
python render.py -m /files/hmann02/output/ablations/llff3/best_end1500 -r 8
echo "Training Percent_end5000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_end5000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_end5000.png --use_score_as_percent --final_rand_drop_iterations 5000
python render.py -m /files/hmann02/output/ablations/llff3/percent_end5000 -r 8
echo "Training Best_Percent_end5000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_percent_end5000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_percent_end5000.png --use_best_view --use_score_as_percent --final_rand_drop_iterations 5000
python render.py -m /files/hmann02/output/ablations/llff3/best_percent_end5000 -r 8

# First random selection, then score selection, and finally random selection again
# rand start and end
echo "Training Base_i500_e3500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/base_initial500_end3500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/base_initial500_end3500.png --final_rand_drop_iterations 3500 --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/base_initial500_end3500 -r 8
echo "Training Best_i500_e1500"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_initial500_end1500 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_initial500_end1500.png --use_best_view --final_rand_drop_iterations 1500 --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/best_initial500_end1500 -r 8
echo "Training Percent_i500_e5000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/percent_initial500_end5000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/percent_initial500_end5000.png --use_score_as_percent --final_rand_drop_iterations 5000 --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/percent_initial500_end5000 -r 8
echo "Training Best_Percent_i500_e5000"
python train.py -s /files/hmann02/LLFF/llff/fern -m /files/hmann02/output/ablations/llff3/best_percent_initial500_end5000 --eval -r 8 --n_views 3 --fastgs_importance_score prune --score_plot_path /code/hmann02/test_outputs/pics/best_percent_initial500_end5000.png --use_best_view --use_score_as_percent --final_rand_drop_iterations 5000 --initial_rand_drop_iterations 500
python render.py -m /files/hmann02/output/ablations/llff3/best_percent_initial500_end5000 -r 8