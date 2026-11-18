import os
from collections import defaultdict
import statistics as st

directory = "/code/hmann02/visualizer/3dgs"
data = defaultdict(lambda: defaultdict(list))

for file in os.listdir(directory):
    if file == "results.txt": continue
    name = None
    vals = {}

    for line in open(os.path.join(directory, file)):
        line = line.strip()
        if line.startswith("Training ") and not line.startswith("Training time") \
                and not line.startswith("Training progress") and not line.startswith("Training complete"):
            # set name and values of previous block
            if name is not None:
                # todo
                for k, v in vals.items():
                    data[name][k].append(v)
            # set new name and values
            name, vals = line.split()[1], {}
        # second set will overwrite the first set
        elif line.startswith(("PSNR :", "SSIM :", "LPIPS :")):
            metric = line.split(":")[0]
            number = float(line.split(":")[1].split("[")[0])
            vals[metric] = number
        elif line.startswith("Training time:"):
            vals["Time"] = float(line.split(":")[1].split("[")[0])

    if name:
        for k, v in vals.items():
            data[name][k].append(v)

out = open(os.path.join(directory, "results.txt"), "w")

prec = {"PSNR": 2, "SSIM": 3, "LPIPS": 3, "Time": 2}

for name, metrics in data.items():
    out.write(name + "\n")
    for k, v in metrics.items():
        p = prec[k.strip()]
        out.write(f"  {k}: mean={st.mean(v):.{p}f} median={st.median(v):.{p}f} min={min(v):.{p}f} max={max(v):.{p}f} std={st.stdev(v) if len(v) > 1 else 0:.4f}\n")