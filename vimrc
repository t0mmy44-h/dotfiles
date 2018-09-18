if &compatible
  set nocompatible " Be iMproved
endif
command! Rvrc so $MYVIMRC
command! Evrc e $MYVIMRC
set ts=2 sts=2 sw=2 et si
set background=dark
syntax enable

" Mouse scroll
set mouse=nicr

" Line Numbers
set nu
nnoremap <Leader>nu :set nu!<cr>

" Disable Arrow Keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" dein Scripts-----------------------------
" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('neomake/neomake')
"call dein#add('ensime/ensime-vim')
call dein#add('vim-scripts/ag.vim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('benmills/vimux')
call dein#add('derekwyatt/vim-scala')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('chriskempson/base16-vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
" End dein Scripts-------------------------

" ============ PLUGIN CONFIG BELOW ============

" Use Eighties Dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-eighties

" Deoplete Config -------------
let g:deoplete#enable_at_startup = 1

" Unite Config ----------------
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-dir vendor/cache --ignore-dir .git --ignore *.log'
let g:unite_source_grep_recursive_opt = ''

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-p> :Unite -no-split -start-insert file file_rec/git<cr>
nnoremap <space>s :Unite -no-split buffer<cr>
nnoremap <space>/ :Unite -no-split grep:.<cr>

" Denite Config ---------------
" use ag
call denite#custom#var('file/rec', 'command',
      \ [
      \   'ag',
      \   '--nocolor',
      \   '--nogroup',
      \   '--hidden',
      \   '--ignore-dir',   'vendor/cache',
      \   '--ignore-dir',   '.git',
      \   '--ignore',       '*.log',
      \   ''
      \ ]
      \)
" use fuzzy matcher
" sorting
" key bindings


" Airline Config --------------
let g:airline_theme='base16_eighties'
let g:airline_powerline_fonts = 1

" NeoMake ---------------------
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
