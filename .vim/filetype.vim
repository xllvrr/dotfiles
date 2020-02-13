" Specify Filetypes for R documents
augroup filetypedetect
  au! BufRead,BufNewFile *.r         setfiletype r
  au! BufRead,BufNewFile *.R         setfiletype r
  au! BufRead,BufNewFile *.Rnw       setf noweb
augroup END
