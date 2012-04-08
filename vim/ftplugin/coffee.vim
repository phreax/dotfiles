" CoffeScript
let coffee_compile_on_save = 1
au FileType coffee vmap <Leader>c :CoffeeCompile<CR>
au FileType coffee set shiftwidth=2
au FileType coffee set tabstop=2 


