import cv2 as cv
import glob



# scenes = ["fern", "flower", "fortress", "horns", "leaves", "orchids", "room", "trex"]
scenes = ["fern", "fortress", "horns", "room", "trex"]
methods = ["dropgs", "select_dropgs"]
views = [3, 6, 9]
boxes = {
    # todo: fill in numbers of small & big
    "fern": ((60, 150, 55, 70), (220, 40, 165, 210)),
    #"flower": ((___, ___, ___, ___), (___, ___, ___, ___)),
    "fortress": ((60, 150, 55, 70), (220, 40, 165, 210)),

    "horns": ((___, ___, ___, ___), (___, ___, ___, ___)),
    # "leaves": ((___, ___, ___, ___), (___, ___, ___, ___)),
    # "orchids": ((___, ___, ___, ___), (___, ___, ___, ___)),
    "room": ((60, 150, 55, 70), (220, 40, 165, 210)),
    "trex": ((60, 150, 55, 70), (220, 40, 165, 210))
}

def zoom(img, small_box, big_box, color=(0,0,255), thickness=2):
    x, y, w, h = small_box
    X, Y, W, H = big_box
    thickness = 2

    small_crop = img[y:y+h, x:x+w]
    img[Y:Y+H, X:X+W] = cv.resize(small_crop, (W, H), interpolation=cv.INTER_NEAREST)
    cv.rectangle(img, (x, y), (x+w, y+h), color, thickness)
    cv.rectangle(img, (X, Y), (X+W, Y+H), color, thickness+1)
    return img

for view in views:
    for scene in scenes:
        imgs = []

        # add gt
        imgs = [cv.imread(glob.glob(f"/files/hmann02/output/3dgs/llff{view}/{scene}/test/ours_*/gt/00000.png")[0])]
        # add scene from each method
        for method in methods:
            path = glob.glob(f"/files/hmann02/output/{method}/llff{view}/{scene}/test/ours_[13]0000/renders/00000.png")[0]
            imgs.append(cv.imread(path))

        small_box, big_box = boxes[scene]
        imgs = [zoom(i.copy(), small_box, big_box) for i in imgs]

        gap = 10
        imgs = [cv.cvtColor(i, cv.COLOR_BGR2BGRA) for i in imgs]
        # make a border for all images but the last
        imgs = [cv.copyMakeBorder(i, 0, 0, 0, gap, cv.BORDER_CONSTANT, value=(0, 0, 0, 0)) for i in imgs[:-1]] + [imgs[-1]]
        cv.imwrite(f"/files/hmann02/thesis_figures/figures/{view}_views/combined_{scene}.png", cv.hconcat(imgs))