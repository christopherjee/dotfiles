function! Github(...)
python << EOF

import vim #so you can use the vim functions
import os, sys, re

file_name = vim.current.buffer.name
path = os.path.realpath(file_name)
dir = os.path.dirname(path)

num_args = int(vim.eval('a:0'))
if num_args != 0:
    args = vim.eval("a:1")#.split(' ')
else:
    args = []

if 'development' in path:
    reg = r'(.*/development)/?([^/]*)/?(.*)'
    base = r'https://github.etsycorp.com/Engineering/\2/blob/master/\3'
    replaced = re.sub(reg, base, path)

    # hack - ranges dont work.
    # current.range.start is where our cursor is
    # < and > indicate v-selected lines
    try:
        selected_start_line, selected_start_column = vim.current.buffer.mark('<')
        selected_end_line, selected_end_column = vim.current.buffer.mark('>')
    except TypeError:
        # type error means no v-select has yet occurred on this buffer
        selected_start_line = -1
        selected_start_column = -1
        selected_end_line = -1
        selected_end_column = -1

    line_current = vim.current.range.start + 1
    # but dont go away on unselect. Thus, hackery.
    # this will fail if we are trying to highlight only
    # the first line of a previously-v-selected group
    if line_current != selected_start_line:
        selected_start_line = line_current
        selected_end_line = line_current

    if 'l' in args:
        replaced += ("#L%s" % (selected_start_line))
        if selected_start_line != selected_end_line:
            replaced += ("L%s" % (selected_end_line))
    if 'o' in args:
        user = os.getenv('USER')
        ip = os.getenv('SSH_CLIENT').split()[0]
        os.system("ssh %s@%s 'open %s'" % (user, ip, replaced))

    print replaced

EOF
endfunction

command! -nargs=? -range=% Github :call Github(<f-args>)
