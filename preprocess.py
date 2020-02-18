#!/usr/bin/env python
# preprocess.py
from pathlib import Path
import shutil
from balsam.launcher.dag import current_job
here = Path(__file__).resolve().parent
ptx_paths = here.glob("*.ptx")
for fname in ptx_paths:
    shutil.copy(fname, current_job.working_directory)
