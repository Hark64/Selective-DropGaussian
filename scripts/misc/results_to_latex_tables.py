# gets scores per scene and views

import os
import re
from collections import defaultdict

directories = ["/code/hmann02/visualizer/DropGaussian", "/code/hmann02/visualizer/Selective-DropGaussian"]
STAT = "max"  # mean, median, min, max or std

# views -> scene -> {row_label: {metric: value}}
tables = defaultdict(lambda: defaultdict(dict))

for d in directories:
    method = os.path.basename(d.rstrip("/"))
    views = scene = None
    for line in open(os.path.join(d, "results.txt")):
        line = line.strip()
        if line.endswith("..."):
            m = re.match(r"^(.*)_(\d+_views)$", line[:-3])
            scene, views = (m.group(1), m.group(2)) if m else (None, None)
        elif views and ":" in line:
            metric, rest = line.split(":", 1)
            stats = dict(kv.split("=") for kv in rest.split())
            label = f"{method} ({scene.capitalize()})"
            tables[views][scene].setdefault(label, {})[metric.strip()] = float(stats[STAT])

ARROW = {"PSNR": r"\uparrow", "SSIM": r"\uparrow", "LPIPS": r"\downarrow", "Time": r"\downarrow"}

with open("tables.txt", "w") as f:
    for views in sorted(tables, key=lambda v: int(v.split("_")[0])):
        # scenes in file order, methods paired within each scene
        rows = {label: vals for scene in tables[views].values() for label, vals in scene.items()}
        cols = ["PSNR", "SSIM", "LPIPS", "Time"]
        header = " & ".join(["Method"] + [f"{c} ${ARROW[c]}$" for c in cols])
        f.write("\\begin{table}\n    \\centering\n"
                f"    \\begin{{tabular}}{{{'r' * (len(cols) + 1)}}}\n"
                f"        {header} \\\\\n        \\hline\n")
        for label, vals in rows.items():
            cells = [label.replace("_", r"\_")] + [f"{vals[c]:.3f}" for c in cols]
            f.write(f"        {' & '.join(cells)} \\\\\n")
        f.write("        \\hline\n    \\end{tabular}\n"
                f"    \\caption{{{views.replace('_', ' ')}}}\n\\end{{table}}\n\n")