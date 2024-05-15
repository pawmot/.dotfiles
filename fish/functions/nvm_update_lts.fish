function nvm_update_lts
    set CURRENT_NODE_VERSION (node -v)
    echo "Current Node version: $CURRENT_NODE_VERSION"

    set LATEST_LTS_VERSION (nvm ls-remote --lts | tail -n 1 | grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+' | awk '{print $1}')
    echo "Latest LTS Node version: $LATEST_LTS_VERSION"

    if test "$CURRENT_NODE_VERSION" = "$LATEST_LTS_VERSION"
        echo "Latest LTS Node version is already installed"
    else
        echo "Installing latest LTS Node version"
        nvm install --lts

        echo "Reinstalling global packages"
        nvm reinstall-packages $CURRENT_NODE_VERSION

        echo "Alias default to the new version"
        nvm alias default $LATEST_LTS_VERSION
    end
end
