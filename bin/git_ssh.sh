# Change all git repository remote urls to ssh

# After the first run, there should be no output
# if ran again (and no new git repos are created).
# This means all remote origins have been updated

function set_url() {
  echo "Updating remote to: " git@github.com:$1/$2.git
  git remote set-url origin git@github.com:$1/$2.git
}

# Array of directories containing git directories
# e.g:
#   ~/dev
#     git_dir_1/
GIT_BASE_DIRS=(
  ~/dev
  ~/CLD
  ~/Ironskinn
  ~
)

function change() {
  for dir in $1/*; do
    if [[ -d $dir ]]; then
      cd "$dir"
      set_origin "$dir"
    fi
  done
}

function set_origin() {
  REPO=$1
  if [ -d .git ]; then
    REMOTE=$(git config --get remote.origin.url)

    # Remote is a github url
    if [[ $REMOTE = *"://github.com"* ]]; then
      REPO_NAME=$(basename `git rev-parse --show-toplevel`)

      # Matches a github username or organization
      regex="github\.com\/(.*)\/"
      if [[ $REMOTE =~ $regex ]]; then
        USER_NAME=${BASH_REMATCH[1]}
        set_url $USER_NAME $REPO_NAME
      fi
    fi
  fi
}

for git_dir in "${GIT_BASE_DIRS[@]}"; do
  cd $git_dir
  change $git_dir
done
