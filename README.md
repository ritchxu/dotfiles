### GitHub dev server dotfiles

#### Clone Enterprise2
```shell
git clone git@github.com:github/enterprise2
```

#### --skip-worktree schema.production.json.gz
```shell
cd ~/enterprise2
git update-index --skip-worktree pkg_files/github/db/schema.production.json.gz
git update-index --skip-worktree pkg_files/github/seed.sql
```

#### Clone dotfiles
```shell
cd ~
git clone git@github.com:ritchxu/dotfiles .dotfiles
.dotfiles/install.sh
```

#### octofactory docker login
```shell
docker login octofactory.githubapp.com -u ritchxu -p ...
```
