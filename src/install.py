# region Modules

import colorama
import os
import subprocess
from subprocess import Popen

# endregion

# region Variables

source_directory: str = str(os.path.dirname(__file__))
graphite_install_command: list[str] = [
    f"{source_directory}/submodules/Graphite-gtk-theme/install.sh",
    "--color",
    "dark",
    "--tweaks",
    "nord",
    "normal",
]
graphite_install_command_gdm: list[str] = [
    "sudo",
    f"{source_directory}/submodules/Graphite-gtk-theme/install.sh",
    "--color",
    "dark",
    "--tweaks",
    "nord",
    "--gdm",
]
graphite_install_command_libadwaita: list[str] = [
    f"{source_directory}/submodules/Graphite-gtk-theme/install.sh",
    "--color",
    "dark",
    "--tweaks",
    "nord",
    "normal",
    "--libadwaita",
]
nordzy_install_command: list[str] = [
    f"{source_directory}/Nordzy/install.sh",
    "--theme",
    "default",
    "--color",
    "--dark",
]

install_commands: list[list] = [
    graphite_install_command,
    graphite_install_command_gdm,
    graphite_install_command_libadwaita,
]

# endregion


def main():
    for command in install_commands:
        subprocess.run(command)


if __name__ == "__main__":
    main()
