## Script d'installation

Ces scripts réalisent  :
  - l'installation de zsh et la configururation [oh my zh](https://ohmyz.sh/)
  - l'installation de [gh cli](https://cli.github.com/) (github client)

Cela permet d'avoir accès à un certain nombre d'alias : https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh


### Prérequis

Création des tokens sous github, gitlab

### Enregistrer les tokens sous le sspcloud

Créer un dossier `git`dans les secrets

Créer un secret `git_token`

| Nom de la variable | Valeur                                                                                 |
|--------------------|----------------------------------------------------------------------------------------|
| URL_GITHUB         | `https://<username>:<token_github>@github.com`                                      |
| URL_GITLAB         | `https://oauth2:<token_gitlab>@gitlab.com`                                            |
| URL_GITLAB_FORGE   | `https://oauth2:<token_gitlab_forge>@gitlab-forge.din.developpement-durable.gouv.fr` |
| GH_TOKEN           | `<gh_token>`                                                                           |

### Lancer le service

[![](https://img.shields.io/badge/SSPCloud-RStudio-blue)](https://datalab.sspcloud.fr/launcher/inseefrlab-helm-charts-datascience/rstudio?autoLaunch=true&onyxia.friendlyName=«rstudio-zsh»&vault.secret=«git%2Fgit_token»&init.personalInit=«https%3A%2F%2Fraw.githubusercontent.com%2Fjdlom%2Fsspcloud_collections%2Fmain%2Finit_scripts%2Finit_script.sh»)

[![](https://img.shields.io/badge/SSPCloud-VScode-blue)](https://datalab.sspcloud.fr/launcher/inseefrlab-helm-charts-datascience/vscode?autoLaunch=true&onyxia.friendlyName=«vscode-zsh»&vault.secret=«git%2Fgit_token»&init.personalInit=«https%3A%2F%2Fraw.githubusercontent.com%2Fjdlom%2Fsspcloud_collections%2Fmain%2Finit_scripts%2Finit_script.sh»)

