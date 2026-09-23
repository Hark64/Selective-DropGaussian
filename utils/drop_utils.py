import torch

# made a func to avoid hard coding scaling factor & max iteration
def calc_drop_rate(iteration, max_iteration, scaling_factor):
    return scaling_factor * (iteration/max_iteration)

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
def selective_drop_gaussians(opacity, drop_rate=0.0, scores = None, noise_factor=0.0):

    # use DropGaussian if no scores provided
    if scores is None:
        opacity = drop_gaussians(opacity, drop_rate)
    else:
        total_gaussians = opacity.shape[0]
        num_to_drop = int(drop_rate * total_gaussians)
        compensation_factor = 1 / (1-drop_rate)
        compensation = torch.ones(opacity.shape[0], dtype=torch.float32, device="cuda")
        
        if noise_factor != 0.0:
            scores = scores + torch.rand_like(scores) * noise_factor
                
        # todo: get lowest num_to_drop Gs and 0 them out
        values, indices = torch.topk(scores, num_to_drop, largest=False)

        compensation[indices] = 0
        compensation = compensation / (1-drop_rate)
        opacity = opacity * compensation[:, None]

        # runs on cpu? super slow regardless
        # for i in total_gaussians:
        #     if i in indices:
        #         opacity[i, 1] != 0
        #     else:
        #         opacity[i, 1] *= compensation_factor 

    return opacity

