set guifont=Bitstream\ Vera\ Sans\ Mono:h14
colorscheme neon

" override new tab hotkey for CtrlP
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
endif
