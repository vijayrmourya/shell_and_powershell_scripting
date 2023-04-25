#!/bin/bash


git_log() {
  echo "the change log is below"
  git log -2 --graph --pretty=oneline
  printf 'x%.0s' {1..50}
  echo ""
}

git_fetch(){
    echo "fetching $repo"
    git fetch origin
}

git_clone(){
    echo "cloning repo"
    git clone $1
    printf 'x%.0s' {1..50}
    echo ""
}

update_opt_d(){
    echo "updating opt_d"
    repositories='flowcharts_draw.io _Shell_and_Powershell_scripting_ packer_hashicorp docker aws_workshop programming_languages udacity personal_stuff _amazon_web_services_ KodeKloud _course_completion_certificates_ github jenkins hashicorp infra_project ansible _terraform_packer_vault_ _python_work_ kubernates_k8s _git_projects_ database_study'
    for repo in $repositories; do
        remote_url="https://github.com/vijayrmourya/$repo.git"
        local_path="$1\\$repo"
        if [ -d "$local_path" ]; then
            cd $local_path
            if [ -d .git ]; then
                if git diff-index --quiet HEAD --; then
                    git_fetch
                fi
            else
                echo "$local_path exists but not git repository"
            fi
        else
            git_clone $remote_url
        fi
    done
}

update_forks(){
    echo "updating forks..."
    repositories='practice-flask-app example-voting-app simple-webapp-flask'
    for repo in $repositories; do
        remote_url="https://github.com/vijayrmourya/$repo.git"
        local_path="$1\\$repo"
        if [ -d "$local_path" ]; then
            cd $local_path
            if [ -d .git ]; then
                if git diff-index --quiet HEAD --; then
                    git_fetch
                fi
            else
                echo "$local_path exists but not git repository"
            fi
        else
            git_clone $remote_url
        fi
    done
}

cd "D:\opt_d_drive"
update_opt_d "D:\opt_d_drive"
mkdir -p 'D:\opt_d_drive\forked_repositories'
cd 'D:\opt_d_drive\forked_repositories'
update_forks "D:\opt_d_drive\forked_repositories"