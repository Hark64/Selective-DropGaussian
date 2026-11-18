<h1 align="center">Selective-DropGaussian: Structural Regularization<br>for Sparse-view Gaussian Splatting</h1>

## Thesis Abstract 
Sparse-view 3D Gaussian Splatting (3DGS) often suffers from overfitting. DropGaussian addresses this by randomly dropping Gaussians every training iteration to allow otherwise occluded Gaussians to be further optimized but somewhat ignores this principle with its random selection of Gaussians. On the other hand, pruning methods compute scores per Gaussian to control which Gaussians can be removed without significant impacts to quality. FastGS in particular quantifies a Gaussian's contribution across multiple views through two scores that guide densification and pruning. However pruning in sparse-view settings often runs a greater risk of removing Gaussians critical to reconstruction. We propose guiding DropGaussian's selection with FastGS's pruning importance scores instead of pruning outright to intentionally drop Gaussians that already contribute significantly to rendering quality. Our method produces comparable results to DropGaussian in terms of reconstruction quality and training time for 3-view and 6-view scenes on the LLFF dataset. However 9-view scenes show modest improvements in scene quality but suffer from longer training times.


## Training & Rendering a Scene
### Installation
Clone and create the conda environment:
```
git clone https://github.com/Hark64/Selective-DropGaussian.git
cd Selective-DropGaussian
conda env create --file environment.yaml
conda activate sdropgs
```
**Note:** You may need to edit environment.yaml to match the CUDA version on your system.

### Data Preparation

In the data preparation stage, we first reconstruct sparse-view inputs using **Structure-from-Motion (SfM)** with the provided camera poses from the datasets. Then, we perform dense stereo matching using COLMAP’s `patch_match_stereo` function, followed by `stereo_fusion` to generate the dense stereo point cloud.

We follow DropGaussian's approach for data preparation. We use **Structure-from-Motion (SfM)**, perform dense stero matching, and steroe fusion to make a dense point cloud for sparse-view inputs.

<details>
<summary><strong> Setup Instructions</strong></summary>

```bash
mkdir dataset
cd dataset

# Download LLFF dataset
gdown 16VnMcF1KJYxN9QId6TClMsZRahHNMW5g

# Generate sparse point cloud using COLMAP (limited views) for LLFF
python tools/colmap_llff.py
```

We also provide preprocessed sparse and dense point clouds for convenience.
You can download them via the link below:

DropGaussian provides preprocess sparse and dense point clouds for download:

[Download Preprocessed Point Clouds](https://drive.google.com/drive/folders/1P3I9m_HU0jF50qwxIIhXhegOVk-kihdI?usp=sharing)
</details>

### Training

To train on a single LLFF scene, use the following command:

```
python train.py -s ${DATASET_PATH} -m ${OUTPUT_PATH} --eval -r 8 --n_views {3 or 6 or 9} \
  --noise_factor 1e-01 --initial_rand_drop_iterations 1000 --score_plot_path {SCORE_PLOT_PATH}
```
To train and evaluate on **all LLFF scenes** for 3, 6, and 9-view scenarios, simply run the script below:
```
bash scripts/train_llff.sh
```

Parameters for train.py:
```
--fastgs_importance_score ['prune', 'dense', 'neither']: Use FastGS pruning scores, FastGS densification scores, or neither and use DropGaussian random selection. Defaults to FastGS pruning scores if not specified.
--score_plot_path: Path for plot of median importance score per iteration.
--noise_factor 1e-01: Scale noise by a factor of 1e-01.
--initial_rand_drop_iterations 100: Use random selection for the first 100 iterations.
--final_rand_drop_iterations 100: Use random selection for the last 100 iterations.
--use_best_view: Have scores consider the best view a Gaussian contributes as opposed to all views.
--use_score_as_percent: Treat scores as a probability to drop instead of dropping the lowest scoring Gaussians.
```



### Rendering & Evaluation
You can perform **rendering and evaluation in a single step** using the following command:
```
python render.py -s -m ${MODEL_PATH} --eval -r 8
```
