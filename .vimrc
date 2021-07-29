"" FROM /etc/vim/vimrci :

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

"" MY ADDITIONS :

" The code block below can disable autocommenting that set by "filetype" plugin's conf
" but the conf is not loaded somewhy if ~/.vimrc exists
" https://vim.fandom.com/wiki/Disable_automatic_comment_insertion#Disabling_in_general
"if has("autocmd")
"    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"endif


" Prevents useless indent on new lines
set noautoindent

" Tabs to 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4


set number

" https://github.com/jeffkreeftmeijer/vim-numbertoggle/blob/2.1.2/plugin/number_toggle.vim
if has("autocmd")
    augroup numbertoogle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
endif
   

" Map Numpad5 (NumLock disabled) to turn normal mode on for
"" insert and replace modes:
:imap ^[OG <Esc>
"" visual and select modes:
:vmap ^[OG <Esc>
"" command-line mode:
:cmap ^[OG <Esc>
"" operator-pending mode:
:omap ^[OG <Esc>

" Map Numpad5 (NumLock disabled) to turn insert mode on for
"" normal mode:
:nmap ^[OG i
