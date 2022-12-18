" Key Remapping" Key Remapping

" syntax on
language en_US.UTF-8
set mouse=a
let g:python3_host_prog='/Users/zhousongran/opt/anaconda3/envs/pt/bin/python'
set cursorline
" 设置自动补全弹出窗口的行数
set pumheight=10
" 查找的时候忽略大小写
set ignorecase
set smartcase
set scrolloff=5
let mapleader=" "


call plug#begin('~/.vim/plugged')

"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'yggdroot/indentline'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='onedark'

Plug 'navarasu/onedark.nvim'

"Plug 'udalov/kotlin-vim'

Plug 'jiangmiao/auto-pairs'

" Color Schemes
"Plug 'flazz/vim-colorschemes'
" Python syntax highlighting script for Vim
"Plug 'hdima/python-syntax'
"let python_highlight_all=1


" Coc.nvim//////////////////////////////////////////////////////////////////////////
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)



"////////////////////////////////////////////////////////////////////////////////////
" jedi
"Plug 'davidhalter/jedi-vim'
"let g:jedi#popup_on_dot=1
"let g:jedi#popup_select_first=1
"let g:jedi#show_call_signatures="1"
"let g:jedi#use_tabs_not_buffers=1
"let g:jedi#environment_path='/Users/zhousongran/opt/anaconda3/envs/pytorch/bin/python3.6'
"let g:jedi#completions_enabled=1
"autocmd FileType python setlocal completeopt-=preview

" deoplete-jedi"
""Plug 'zchee/deoplete-jedi'
""let g:deoplete#sources#jedi#python_path='/Users/zhousongran/opt/anaconda3/envs/pytorch/bin/python3.6'
""let g:deoplete#sources#jedi#enable_typeinfo=0

" 格式化插件
Plug 'chiel92/vim-autoformat'
"自动格式化代码，针对所有支持的文件
au BufWrite * :Autoformat
"let g:formatterpath=['/opt/homebrew/Cellar/astyle/3.1/bin/astyle']
let g:formatdef_astyle='"astyle --style=allman --pad-oper"'
let g:formatdef_clangformat_google = '"clang-format -style google -"'
let g:formatters_c = ['astyle']
let g:formatters_cpp=['astyle']
let g:formatters_h=['astyle']
let g:formatters_cc=['astyle']
let g:formatters_hpp=['astyle']

" autopep8
Plug 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
let g:autopep8_on_save = 0

" Syntastic 即时检测代码错误
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 0
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 2
"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'
let g:syntastic_go_checkers=['golint']
let g:syntastic_c_checkers=['cppclean']
let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_cmake_checkers=['cmakelint']

" vim-cpp-enhanced-highlight
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" clang complete
" Plug 'rip-rip/clang_complete'
" path to directory where library can be found
" let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" or path directly to the library file
" let g:clang_library_path='/usr/lib64/libclang.so.3.8'

Plug 'fatih/vim-go'

" Go code : autocompletion"
"Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" Initialize plugin system

Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
let g:semshi#filetypes=['python']
let g:semshi#excluded_hl_groups=[]
let g:semshi#mark_selected_nodes=1



call plug#end()






" set CTRL-e to be NERDTreeToggle
map<silent> <C-e> :NERDTreeToggle<CR>
map s <nop>
nmap <C-s> :w<CR>zz
imap <C-s> <ESC>:w<CR>zz
imap <C-l> <ESC>la
map <C-q> <ESC>:q<CR>

"map R <ESC>:source ~/.config/nvim/init.vim <CR>
" let g:onedark_config={'style':'darker'}
colorscheme onedark

" set number and relativenumber
set nu
set relativenumber
" set tabstop=4
set tabstop=4
" 在编辑模式按退格键时，退回的缩进长度
set softtabstop=4
" 每一级缩进是4个空格
set shiftwidth=4
" 对c语言自动缩进
set cindent
" 自动缩进
set autoindent

set smarttab
" 让按下j时同时使下一行在竖直位置上居中
noremap j gjzz
noremap k gkzz
noremap o zzo

nmap <leader>bp :bp<cr>
nmap <leader>bn :bn<cr>
nmap <leader>v :vsp<space>
nmap <leader>s :sp<space>

"inoremap ' ''<ESC>i
""inoremap " ""<ESC>i
""inoremap ( ()<ESC>i
""inoremap [ []<ESC>i
" inoremap { {}<ESC>i
" inoremap {<CR> {}<ESC>i<CR><ESC>O<TAB>
