" GUI SETTINGS
" ----------------------------------
" Preferences
set guioptions-=T            " Remove toolbar
set guioptions-=rL           " Remove right/left scroll bars
set guioptions-=a            " Don't copy to clipboard on visual select
set guioptions+=c            " Don't show popup dialogs; prefer text prompts in command bar

" Font
" Different fonts for each OS because of font rendering differences
if has('win32')
    if has("gui_running")
        " Maximize window
        au GUIEnter * simalt ~x
    endif
    set guifont=SauceCodePro_NF:h9
elseif has('unix')
    if has("gui_running")
        " Maximize window
        set lines=999 columns=999
    endif
    set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ 11
endif


" Try to use directx on windows
" if has('win32') || has('win64')
"     if (v:version == 704 && has("patch393")) || v:version > 704
"         set renderoptions=type:directx,
"             \level:0.5,gamma:1.5,contrast:0,
"             \geom:1,renmode:5,taamode:1
"     endif
" endif
