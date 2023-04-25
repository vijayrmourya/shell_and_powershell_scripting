  #!/bin/bash

git_log() {
  echo "the change log is below"
  git log -2 --graph --pretty=oneline
  printf 'x%.0s' {1..50}
  echo ""
}

git_commit() {
  printf 'x%.0s' {1..50}
  echo ""
  git add .
  git commit -m "vjmourya-$(date): automated Commit from personal desktop"
}

track_hdd() {
  if [ -e $1 ]; then
    echo "Commiting the changes in HDD $1"
    echo $1
    cd $1
    if [ -n "$(git status -s)" ]; then
      git_commit
      git_log
    else
      echo "nothing to commit in HDD"
    fi
  else
    echo "Connect HDD to track $1"
  fi
}

trach_ssd() {
  if [ -e $1 ]; then
    echo "Commiting the changes in SSD $1"
    cd $1
    if [ -n "$(git status -s)" ]; then
      git_commit
      git_log
    else
      echo "nothing to commit in $1"
    fi
  else
    echo "Unable to find the location $1"
  fi
}

track_opt_d() {
  repositories='flowcharts_draw.io _Shell_and_Powershell_scripting_ packer_hashicorp docker aws_workshop programming_languages example-voting-app simple-webapp-flask udacity personal_stuff _amazon_web_services_ KodeKloud _course_completion_certificates_ github jenkins hashicorp infra_project ansible _terraform_packer_vault_ _python_work_ kubernates_k8s _git_projects_ database_study'
  for repo in $repositories; do
    cd "D:\opt_d_drive\\$repo"
    # Check if there are any new changes in the current branch
    if [ -n "$(git status -s)" ]; then
      echo "commiting in $repo"
      git_commit
      git push origin
      git_log
    else
      echo "nothing to commit in $repo"
    fi
  done
}

track_opt_d
track_hdd "E:\DoNotDelete-PERSONAL"
track_hdd "E:\flowcharts_draw.io"
trach_ssd "D:\DoNotDelete-PERSONAL"