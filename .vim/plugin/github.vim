function! Github(...)
python << EOF

import vim #so you can use the vim functions
import os, sys, re

file_name = vim.current.buffer.name
path = os.path.realpath(file_name)
dir = os.path.dirname(path)
args = vim.eval("a:1")#.split(' ')

if 'development' in path:
    reg = r'(.*/development)/?([^/]*)/?(.*)'
    base = r'https://github.etsycorp.com/Engineering/\2/blob/master/\3'
    replaced = re.sub(reg, base, path)
    if 'l' in args:
        replaced += ("#L%s" % vim.current.range.start)
    if 'o' in args:
        user = os.getenv('USER')
        ip = os.getenv('SSH_CLIENT').split()[0]
        os.system("ssh %s@%s 'open %s'" % (user, ip, replaced))

    print replaced

EOF
endfunction

command! -nargs=? -range=% Github :call Github(<f-args>)
