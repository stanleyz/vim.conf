const { map, unmap } = api;

map(';B', 'b');     // open bookmarks
map('b', 'e');      // scroll half page up
map(';o', 'f');     // open a link
map('f', 'd');      // scroll half page down
map('h', 'E');      // Go one tab left
map('l', 'R');      // Go to right tab
map('H', 'S');      // Go back in history
map('o', 't');      // open a url
map(';t', 'C');     // open a new link in non-active new tab
map('t', 'on');     // open a new tab
map('gt', '<Ctrl-6>');      // Go to the last used tab
map('u', 'X');              // restore closed tab
map('L', 'D');              // Go forward History

unmap('d');
map('d', 'x'); // close the current page
// This doesn't work since it forms a loop with o
map('t', 'on'); // open a new tab
map('<Ctrl-9>', '<Alt-s>')
unmap('x')
unmap('f')
