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

Setup (one time per machine or Codespaces configuration):

1. Set each skill gist's description to `Copilot skill: <name>`.
2. Create a fine-grained PAT scoped to **Gists: Read-only**.
3. Add it as a Codespaces secret named `GIST_SKILLS_TOKEN` under **Settings >
   Secrets and variables > Codespaces**.

If the secret or the GitHub CLI is unavailable, `install.sh` skips the sync.
