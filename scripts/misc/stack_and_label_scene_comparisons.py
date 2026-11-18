import cv2 as cv
import numpy as np

scenes = ["fern", "fortress", "horns", "room", "trex"]
base = "/files/hmann02/thesis_figures/figures"
gap = 10

methods = ["DropGaussian", "Selective-DropGaussian"]
labels = ["Ground Truth"] + methods  # same order as the columns
h = 60                     # footer height

for view in [3, 6, 9]:
    imgs = [cv.imread(f"{base}/{view}_views/combined_{s}.png", cv.IMREAD_UNCHANGED) for s in scenes]
    imgs = [cv.copyMakeBorder(i, 0, gap, 0, 0, cv.BORDER_CONSTANT, value=(0, 0, 0, 0)) for i in imgs[:-1]] + [imgs[-1]]
    stacked = cv.vconcat(imgs)

    W = stacked.shape[1]
    w = (W - (len(labels) - 1) * gap) // len(labels)  # width of one column
    footer = np.full((h, W, 4), 255, np.uint8)        # white, opaque
    for k, label in enumerate(labels):
        tw, th = cv.getTextSize(label, cv.FONT_HERSHEY_SIMPLEX, 1.5, 3)[0]
        cv.putText(footer, label, (k * (w + gap) + (w - tw) // 2, (h + th) // 2),
                   cv.FONT_HERSHEY_SIMPLEX, 1.3, (0, 0, 0, 255), 3)

    cv.imwrite(f"{base}/{view}_views/stacked.png", cv.vconcat([stacked, footer]))