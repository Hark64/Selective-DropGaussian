import torch
from gaussian_renderer import render

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
def selective_drop_gaussians(opacity, drop_rate, scores = None, noise_factor):
    # todo: remove prints
    print(scores.type(), scores.shape)
    print(opacity.type(), opacity.shape)
    exit()

    # use DropGaussian if no scores provided
    if scores is None:
        opacity = drop_gaussians(opacity, drop_rate)
    else:
        total_gaussians = opacity.shape[0]
        num_to_drop = drop_rate * total_gaussians
        compensation_factor = 1 / (1-drop_rate)
        compensation = torch.ones(opacity.shape[0], dtype=torch.float32, device="cuda")
        
        if (noise_factor is not None) and (noise_factor != 0):
            # todo: is this right?
            scores = scores + torch.rand_like(scores) * noise_factor
                
        # todo: get lowest num_to_drop Gs and 0 them out
        values, indices = torch.topk(scores, num_to_drop, largest=False)
        print(indices.type(), indices.shape)
        print(compensation.type(), compensation.shape)

        compensation[incdices] = 0
        compensation = compensation / (1-drop_rate)
        opacity = opacity * compensation[:, None]

        # runs on cpu? super slow though
        # for i in total_gaussians:
        #     if i in indices:
        #         opacity[i, 1] != 0
        #     else:
        #         opacity[i, 1] *= compensation_factor 

    return opacity

