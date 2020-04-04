# How to .vimrc, with your host Kirby.

## Table of Contents

- [Objectives](#objectives)
- [NeoViM](#neovim-installation-steps)
- [Vundle](#how-to-vundle)
- [Plugin Settings](#plugin-settings)
- [Plugin Notes](#plugin-notes)

Oh, Hello. I didn't see you there. Well, now that you're here, I suppose that there's nothing else to do but teach you how, precisely, you can live that #ViMLyfe.

## Objectives

* We'll take your ViM to the next level by:
  - We shall make your ViM experience far more IDE like, and colorful.
* We're also going to set up your dot files so that they're more organized, and easier to bring with you from computer to computer.

* Note that this guide assumes a \*nix system, including Mac OSX.

You'll need to know:

1. Basic ViM stuff. Registers, buffers, yanks and puts should all be old hat for you.
2. Some of the plugins we'll install also require that you understand ViM's search.
3. Git proficiency is a must
4. Comfortability with bash scripts is nice, but not strictly necessary.

## NeoViM Installation Steps

The first thing we'll do is get NeoViM! It's got a bunch of neat features that regular ViM doesn't, and it's pretty quick to boot.

```bash
# MacOS
brew install neovim

# Ubuntu
sudo apt install neovim
```

For some of the features we'll be using, you'll also need to install NeoViM's python helper, `pynvim`

```bash
pip install pynvim
```

Finally, we'll instill Vundle, one of many package managers for ViM/NeoViM

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

This clones Vundle into your new `~/.vim/bundle/` directory, which is where all of your plugins will live. Once that finishes, it's time to work on the .vimrc.

## How to Vundle

Take whatever you've got in your .vimrc, and save it. This guide should cover most common .vimrc things, but anything I don't cover can be added back in later.

Now that that's out of the way, add the following to your .vimrc:

```vimscript
set nocompatible            "be iMproved, required
filetype off                "required for plugins

" set the runtime path to include Vundle, and then initialize it.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle handle Vundle stuff - required
Plugin 'VundleVim/Vundle.vim'Alongside this guide you'll find my annotated .vimrc, Alongside this guide you'll find my annotated .vimrc,

"
"
" More Plugins go here later
"
"

" All plugins will go before this point
call vundle#end()
filetype plugin indent on       "required
```

Once you've got all that in there, `:wq` to save and quit. Once outside of ViM, run `vim +PluginInstall +qall` to install the Vundle plugin in a way that ViM understands. Note that each time you add a plugin to your .vimrc you will need to run the `vim +PluginInstall +qall` command.

## Plugin Settings

Here I'll show a couple of examples of how to install plugins, along with the relevant settings for those example plugins. My full suite of plugins and settings is in the .vimrc found [here](https://github.com/kirbpowell/terminal-stuff/blob/master/bashrc.d/.vimrc#L21).

```vimscript
""""""""""""""
"     NerdTree      "
"     Settings      "
""""""""""""""

"allows us to open NERDTree tabs with '\t'
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

""""""""""""""
" delimitMate       "
"       settings    "
""""""""""""""
let delimitMate_expand_cr = 1
augroup mydelimitMate           "tells delimitMate what things to delimit
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["\`"]
    au FileType tex let b:delimitMate_quotes = "
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},\`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
```

It's important to note that these settings, unlike the plugins themselves, do not need to be installed once added to the .vimrc. They won't take effect until the next time you open vim.

## Plugin Notes

Some of the plugins I reccommend, specifically Syntastic (for syntax checking), have requirements outside of vim. I'll list those and go through them here.

### Code Search with Ack & Ag

I use [Ag](https://github.com/ggreer/the_silver_searcher#whats-so-great-about-ag) for code search in ViM, through the [ack.vim](https://github.com/mileszs/ack.vim#ackvim) vim plugin. You'll need to install Ag separately, and make the changes recommended on the Ag github page.

### SimpylFold

Be sure to set the `foldlevel` to your preferred value --- the default is to start with all folds in the closed position.
For this reason, I've got `foldlevel = 99`, which means all folds default to the open position.

### EasyTags

EasyTags requires Exuberant-Ctags, which you can install [here](http://ctags.sourceforge.net/). Ctags will enable a lot of IDE like functionality, like jumping between vars and functions and all sorts of funs tuff.

### SuperMan

SuperMan lets you do man pages in vim. If you'd like to use it to open man pages in ViM, instead of the default, add the following to your .bashrc:

```bash
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
```

That allows you to hover over a word in vim and pull up the man pages in another pane. If you'd like to, you can add the following to your .bashrc as well:

```bash
vman() {
      vim -c "SuperMan $*"

      if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
      fi
    }
```

That will allow you to run something like `$ vman git` which will pull up the man pages for git, but in ViM.

## A note on how to use some of the plugins in the .vimrc

* To open up NERDTree, you can use `<space>t` to open up the NERDTree pane. If you want, you can also uncomment a line inside the .vimrc to have this pane open up automatically on startup.

* You can open up TagBar, to look at your tags, via `<space>b`

* You can open up SuperMan, from within ViM, with `K`. Of course, you can set this to whatever you'd like.

* You can switch between panes using `<ctrl>+h/j/k/l`, akin to normal vim navigation.

* To open or close code folds, use `za`. 

## That should be it! Ask Kirby if you have any further questions, or suggestions for improvement. Thanks for reading!
