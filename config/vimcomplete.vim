vim9script
var options = {
    completor: { noNewlineInCompletionEver: true, alwaysOn: false },
    buffer: { enable: true, priority: 10, urlComplete: true, envComplete: true },
    abbrev: { enable: true, priority: 10 },
    lsp: { enable: false, priority: 10, maxCount: 5 },
    omnifunc: { enable: false, priority: 8, filetypes: ['c', 'cpp', 'python', 'javascript'] },
}
autocmd VimEnter * g:VimCompleteOptionsSet(options)
