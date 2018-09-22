"ACM&Leetcode mod : C&C++

"显示行号
set nu
"语法高亮
set syntax on
"tab缩进
set tabstop=4
set shiftwidth=4
"tab不转换空格
set noexpandtab
"c文件自动缩进
set cindent
"背景色
set background=dark
"不知道
"map <C-A> ggVG"+y
"F5编译运行
map <F5> :call Run()<CR>
func! Run()
	exec "w"
	exec "!g++ -std=c++11 -Wall % -o %<"
	exec "!./%<"
endfunc

"其他配置

"不需要备份
set nobackup
"鼠标可用
set mouse=a
"文件自动检测外部更改
set autoread
"高亮查找匹配
set hlsearch
"显示标尺，就是在右下角显示光标位置
set ruler
