# latex + bib
[reference](https://www.zhihu.com/question/30344123?sort=created)

* 调用宏包 \usepackage{cite}
* 在文章中使用 \cite{name1}（name1为参考文献Bibtex名称）引用文章
* 设置参考文献类型 如 \bibliographystyle{IEEEtran}
* 在结尾处声明 参考文献文件名称 \bibliography{XX}


* 用pdfLaTeX编译你的 .tex 文件 , 这是生成一个 .aux 的文件, 这告诉 BibTeX 将使用那些应用.
* 用BibTeX 编译 .bib 文件.
* 再次用pdfLaTeX 编译你的 .tex 文件, 这个时候在文档中已经包含了参考文献, 但此时引用的编号可能不正确.最后用 再再次pdfLaTeX 编译你的 .tex 文件, 如果一切顺利的话, 这是所有东西都已正常了.

作者：swear
链接：https://www.zhihu.com/question/30344123/answer/53377390
来源：知乎
著作权归作者所有，转载请联系作者获得授权。