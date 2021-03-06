# /bsh/sh

if [ -z "$1" ]
  then
    echo "The command format is: bash-build.sh BRANCH_NAME VERSION_VALUE"
    exit
  else
    if [ -z "$2" ]
    then
        echo "Use the format: bash-build.sh BRANCH_NAME VERSION_VALUE"
        exit
    fi

    # Checkout a versioned branch with the version name
    git checkout $1
    # Create a configuration file that sets a new baseurl based d on version
    echo "baseurl : /$2" > _config.$2.yml
    echo "exclude : " >> _config.$2.yml
    echo "  - $2"  >> _config.$2.yml
    echo "branch_url : /$1" >> _config.$2.yml
    # Build using both the basic configuration file and the version config file
    bundle exec jekyll build --config _config.yml,_config.$2.yml -d /tmp/$2/
    rm _config.$2.yml

    git checkout master

fi
