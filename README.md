<h1 align="center">
	<img width="900" src="assets/screenshot.png" alt="mpsl">
    <br/>
    <h4 align="center">Using mpsl + <a href="https://github.com/LinArcX/mpi">mpi</a> + <a href="https://github.com/LinArcX/mpbtl">mpbtl</a>
</h1>

## Installation
Just copy `mpsl.vim` into your `plugin` directory.

## Why?
- [KISS](https://en.wikipedia.org/wiki/KISS_principle)
- I like [vim-airline](https://github.com/vim-airline/vim-airline). But its code is huge for such a simple task.(showing statusline)
- I like to manipulate and discover things and see what's going on under the hood(And i encourage you, too). So, instead of just using a huge plugin, install a minimal alternative and change it according to your needs.

## Customization
### Custom functins
You can add your own functions and call them later. For example i want to show file permisions and current git branch. First define them:

```
function! FilePermission()
    return getfperm(expand('%:p'))
endfunction

function! GitBranch()
    let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':' '
endfunction
```

And call them like this:
```
set statusline+=%1*\%{GitBranch()}
set statusline+=%1*\ %{FilePermission()}\ |
```

### Using emojies
Also you can add [unicode emojies](https://en.wikipedia.org/wiki/Template:Emoji_(Unicode_block)) like this:
`set statusline+=%5*\ %{nr2char(0x1f47d)}`


### Define custom colors
If you want to use different colors, first you should define different `Highlight commands`. Here is an example:
```
hi User5 ctermbg=233 ctermfg=39  " Black/Sky-Blue
hi User6 ctermbg=233 ctermfg=007 " Black/Sky-Blue
```
And use them like this:

`set statusline+=%5*\ %{nr2char(0x1f47d)}`

Here is the list of colors: https://jonasjacek.github.io/colors/

## Donate
- Bitcoin: `13T28Yd37qPtuxwTFPXeG9dWPahwDzWHjy`
<img src="assets/donate/Bitcoin.png" width="200" align="center" />

- Monero: `48VdRG9BNePEcrUr6Vx6sJeVz6EefGq5e2F5S9YV2eJtd5uAwjJ7Afn6YeVTWsw6XGS6mXueLywEea3fBPztUbre2Lhia7e`
<img src="assets/donate/Monero.png" align="center" />

## License
![License](https://img.shields.io/github/license/LinArcX/mpsl.svg)
