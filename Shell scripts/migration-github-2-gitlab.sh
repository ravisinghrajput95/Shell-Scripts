#1/bin/bash
  
# This script will migrate the repository from Github to Gitlab.

# To prompt user to provide the repository url at the runtime.
read -p "Enter the Github repository URL  " github
read -p "Enter the Gitlab repository URL  " gitlab

# Clone the provided github repo.
git clone $github

# Retreive the repo name with the extension.
basename=$(basename $github)
echo $basename

# Retreive the directory which will be available after the clone.
filename=${basename%.*}
echo $filename

# Navigate to the directory and wait for 5s.
cd $filename
sleep 5

# Configure the remote which points to the Gitlab repository and push.
git remote rm origin
git remote add origin $gitlab
git branch -M main
git pull --rebase origin main
git config user.name 'ravi_singh_rajput'
git push -uf origin main

# Remove the cloned Github repo
cd ..
rm -rf $filename

echo "Github repo migrated successfully"

