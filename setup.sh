# Dont forget to run with 'bash setup.sh'
if [ "$(which zsh)" ]; then
  echo -e "\033[1m\033[4mZSH Installed, Installing features...\033[0m\033[0m"
  echo
  echo "==> Downloading and Installing Starship"
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
  echo "" >> ~/.zshrc
  echo "# Starship" >> ~/.zshrc
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc

  mkdir ~/.zsh
  echo
  echo "==> Created '~/.zsh' folder"
  cd ~/.zsh

  echo
  echo "==> Downloading and Installing fast-syntax-highlighting"
  git clone https://github.com/zdharma/fast-syntax-highlighting.git
  echo "" >> ~/.zshrc
  echo "# Enable Fast Syntax Highlighting plugin in ZSH" >> ~/.zshrc
  echo "source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" >> ~/.zshrc

  echo
  echo "==> Downloading and Installing zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
  echo "" >> ~/.zshrc
  echo "# Enable 'zsh-autosuggestions' plugin in ZSH" >> ~/.zshrc
  echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

  echo
  echo "==> FINISHED! Enjoy your new features!"
  cd
  exec zsh
else
  echo -e "\033[1m\033[4mYou haven't install ZSH\033[0m\033[0m"
  if [ "$OSTYPE" == "linux-gnu" ]; then
    echo "- Run 'sudo apt install zsh'"
  elif [ "$OSTYPE" == "darwin" ]; then
    if [ "$(which brew)" ]; then
      echo "- Run 'brew install zsh'"
    else
      echo "- Install brew for OSX"
      echo "    https://brew.sh/"
    fi
  fi
  # Dont forget to 'chsh -s $(which zsh)' after finished installing zsh.
fi
