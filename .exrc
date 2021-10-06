let g:vjs_tags_enabled = 0

fun! s:watch(cmd)
  return "rg --files | entr -r -c sh -c 'echo ".escape('"'.a:cmd.'"', '"')." && ".a:cmd."'"
endf

let g:vigun_mappings = [
      \ {
      \   'pattern': 'test/.*_test.rb$',
      \   'all': 'rails test #{file}',
      \   'nearest': 'rails test #{file}:#{line}',
      \   'watch-all': s:watch('rails test #{file}'),
      \   'watch-nearest': s:watch('rails test #{file}:#{line}'),
      \ }
      \]
