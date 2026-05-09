#!/usr/bin/env python3

import os
import json

SEARCH_PATHS = [
    "$HOME/.local/share/applications",
    "/usr/share/applications",
    "/usr/local/share/applications"
]

apps = []
seen = set()

for path in SEARCH_PATHS:
    if not os.path.exists(path):
        continue
    for file in os.listdir(path):
        if not file.endswith(".desktop"):
            continue
        full_path = os.path.join(path, file)
        name = ""
        exec_ = ""
        icon = ""
        no_display = False
        hidden = False
        in_desktop_entry = False
        try:
            with open(full_path, "r", encoding="utf-8") as f:
                for line in f:
                    line = line.strip()
                    if line == "[Desktop Entry]":
                        in_desktop_entry = True
                        continue
                    if line.startswith("[") and line != "[Desktop Entry]":
                        in_desktop_entry = False
                    if not in_desktop_entry:
                        continue
                    if line.startswith("Name="):
                        name = line.split("=", 1)[1].strip()
                    elif line.startswith("Exec="):
                        exec_ = line.split("=", 1)[1].strip()
                    elif line.startswith("Icon="):
                        icon = line.split("=", 1)[1].strip()
                    elif line.startswith("NoDisplay="):
                        no_display = line.split("=", 1)[1].strip().lower() == "true"
                    elif line.startswith("Hidden="):
                        hidden = line.split("=", 1)[1].strip().lower() == "true"
        except:
            continue

        if name and exec_ and not no_display and not hidden and name not in seen:
            exec_ = exec_.split("%")[0].strip()

            apps.append({
                "name": name,
                "exec": exec_,
                "icon": icon
            })
            seen.add(name)


print(json.dumps(apps))