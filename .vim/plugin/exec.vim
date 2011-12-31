"-------------------------
"  exec.vim     by odiak
"-------------------------



command! Exec call s:Execute()


function! s:Execute()
    w
    let ftype = &filetype
    
    if ftype == 'c' 
        call s:exe_c()
    elseif ftype == 'cpp'
        call s:exe_cpp()
    elseif ftype == 'python'
        call s:exe_python()
    elseif ftype == 'ruby'
        call s:exe_ruby()
    elseif ftype == 'javascript'
        call s:exe_js()
    endif
endfunction


let s:key_y = 121
let s:key_n = 110


function! s:exe_c()
    if executable('gcc')
        let fname = expand('%:p')
        let command = 'gcc ' . fname . ' -o ' . fname . '.out 2>&1'
        let res = system(command)
        let key = s:key_y
        
        if strlen(res) > 0
            echo res
            echo 'continue? [y/n]:'
            let key = getchar()
        endif
        
        if key == s:key_y
            :! echo -en "\n\n" && %:p.out
        endif
    endif
endfunction


function! s:exe_cpp()
    if executable('g++')
        let fname = expand('%:p')
        let command = 'g++ ' . fname . ' -o ' . fname . '.out 2>&1'
        let res = system(command)
        let key = s:key_y
        
        if strlen(res) > 0
            echo res
            echo 'continue? [y/n]'
            let key = getchar()
        endif
        
        if key == s:key_y
            :! echo -en "\n\n" && %:p.out
        endif
    endif
endfunction


function! s:exe_python()
    if executable('python')
        :! echo -en "\n\n" && python %:p
    endif
endfunction


function! s:exe_ruby()
    if executable('ruby')
        :! echo -en "\n\n" && ruby %:p
    endif
endfunction


function! s:exe_js()
    if executable('node')
        :! echo -en "\n\n" && node %:p
    elseif executable('js')
        :! echo -en "\n\n" && js %:p
    endif
endfunction



