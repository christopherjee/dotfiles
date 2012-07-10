function! Github()
python << EOF

import vim #so you can use the vim functions
import os, sys, re

file_name = vim.current.buffer.name
path = os.path.realpath(file_name)

if 'development' in path:
    rep = r'(.*/development)/?([^/]*)/?(.*)'
    base = r'https://github.etsycorp.com/Engineering/\2/blob/master/\3'
    replaced = re.sub(rep, base, path)
    print replaced

EOF
endfunction

command! -nargs=? -range=% Github :call Github()
