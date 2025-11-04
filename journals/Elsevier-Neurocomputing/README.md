# Elsevier Neurocomputing 模板

Elsevier 出版社提供的 `elsarticle` 模板，适用于 Neurocomputing 期刊及同系列期刊。

## 目录概览

- `elsarticle-template-*.tex`：多种引用风格的示例文档；
- `elsarticle-*.bst`：对应的 BibTeX 样式文件；
- `elsarticle.cls`（由 `elsarticle.dtx`/`elsarticle.ins` 生成）：主文档类；
- `doc/`：官方说明文档（英文）。

## 编译指引

1. 根据需要选择 `elsarticle-template-num.tex`、`elsarticle-template-num-names.tex` 或 `elsarticle-template-harv.tex`；
2. 将 `.cls` 与 `.bst` 文件放在同一路径，执行 `pdflatex` + `bibtex` 组合编译；
3. 参考 `doc/` 目录中的官方说明获取更多格式细节。

> 原始归档中附带的 `README`、`manifest.txt` 与 `changelog.txt` 保存了官方更新记录，请勿删除。
