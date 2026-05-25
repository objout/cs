# Formual Editing

## 调整公式字体大小

```tex
\begin{small}
\begin{equation}
a = b + c
\end{equation}
\end{small}
```

这样公式编号也会缩小，故需在导言区调整公式编号的字体大小:

```tex
\makeatletter
\renewcommand{\maketag@@@}[1]{\hbox{\m@th\normalsize\normalfont#1}}%
\makeatother
```

## 公式左移右移

通过添加 `\hspace` 命令

```tex
% 左移
\begin{equation}
\hspace{-1em}
a = b + c
\end{equation}
```

```tex
% 右移
\begin{equation}
a = b + c
\hspace{1em}
\end{equation}
```
