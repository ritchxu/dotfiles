### GitHub dotfiles

```shell
cd ~
git clone https://github.com/ritchxu/dotfiles.git .dotfiles
.dotfiles/install.sh
```

### Copilot CLI skills from private gists

`install.sh` also syncs personal Copilot CLI skills from gists into
`~/.copilot/skills`. Any gist (public or private) whose description starts with
`Copilot skill:` is picked up automatically, so gist IDs and URLs do not need to
live in this repository.

Each gist should contain a `SKILL.md` file. Copilot loads that file from the
skill directory; other files can support the skill but are not loaded directly.

Set each skill gist's description to `Copilot skill: <name>`. The environment
running `install.sh` is expected to provide `GIST_SKILLS_TOKEN` with access to
the gists. If the variable or the GitHub CLI is unavailable, the sync is
skipped.
