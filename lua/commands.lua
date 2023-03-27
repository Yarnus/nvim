local new_cmd = require('utils').new_cmd
new_cmd('Mix', ":!mix format %")
new_cmd('Black', ":!python3 -m black %")
new_cmd('Racket', ":!racket %")
