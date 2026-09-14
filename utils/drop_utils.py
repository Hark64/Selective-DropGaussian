import torch
from gaussian_renderer import render

# made a func to avoid hard coding scaling factor & max iteration
def calc_drop_rate(iteration, max_iteration, scaling_factor):
    return scaling_factor * (iteration/max_iteration)

# todo: see if this works
# DropGaussian
def drop_gaussians(opacity, drop_rate):
    # Create initial compensation factor (1 for each Gaussian)
    compensation = torch.ones(opacity.shape[0], dtype=torch.float32, device="cuda")

    # Apply DropGaussian with compensation
    d = torch.nn.Dropout(p=drop_rate)
    compensation = d(compensation)

    # Apply to opacity
    opacity = opacity * compensation[:, None]
    return opacity

# Drop Gaussians w/ Importance Scores
def selective_drop_gaussians(opacity, drop_rate, scores = None, noise_bool = FALSE):

    if scores is None:
        opacity = drop_gaussians(opacity, drop_rate)
    else:
        num_to_drop = drop_rate * opacity.shape[0]
        
        if noise_bool:
            # todo: add rand to each
            for i in opacity.shape[0]
                
        # todo: get lowest num_to_drop Gs and 0 them out

    return opacity

