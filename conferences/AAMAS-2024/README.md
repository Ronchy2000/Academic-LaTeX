# AAMAS 2024 会议模板

基于 AAMAS 2024 官方发布的 LaTeX 模板，适用于 AAMAS 与相关 ACM 会议投稿。

## 主要文件

- `aamas.cls`：会议专用文档类；
- `AAMAS_2024_sample.tex`：官方示例稿件；
- `sample.bib`：示例参考文献数据库；
- `ACM-Reference-Format.bst`：ACM 参考文献样式；
- `aamas2024logo.jpeg`：AAMAS 2024 官方标识。

## 编译建议

1. 建议使用 `pdflatex` → `bibtex` → `pdflatex` → `pdflatex` 的顺序编译；
2. 若需中文版投稿，可在模板基础上引入 `ctex` 系列宏包，但需确保符合会议排版要求；
3. 编译过程中产生的 `*.aux`、`*.log` 等文件可自行清理。

> 模板仅适用于 2024 年会议，如需最新版本，请前往 AAMAS 官方网站下载并替换。
