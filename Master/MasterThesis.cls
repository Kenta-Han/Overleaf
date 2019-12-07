%
% 修士学位請求論文（副・正）クラスファイル
% MasterThesis.cls
% By KASHINA, Yuki (EM-14003)
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MasterThesis}[2015/12/24 (2.0.1) by KASHINA, Yuki (EM-14003)]
\LoadClass[10pt,a4j,onecolumn,titlepage,oneside,report]{jsbook}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 公開コマンド（汎用）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------ 図表の参照 -------------------
\def\flabel#1{\label{fig:#1}}
\def\tlabel#1{\label{tbl:#1}}
\def\elabel#1{\label{eqn:#1}}
%
\def\fref#1{図~\ref{fig:#1}}
\def\tref#1{表~\ref{tbl:#1}}
\def\eref#1{式~(\ref{eqn:#1})}

%------------ 章節の参照 -------------------
\def\partlab#1{\label{part:#1}}
\def\chapterlab#1{\label{chapter:#1}}
\def\sectionlab#1{\label{section:#1}}
\def\subsectionlab#1{\label{subsection:#1}}
%
\def\partref#1{\ref{part:#1}~部}
\def\chapterref#1{\ref{chapter:#1}~章}
\def\sectionref#1{\ref{section:#1}~節}
\def\subsectionref#1{\ref{subsection:#1}~項}

%------------ 表最上部用の太罫線 -------------
%pi * exp(1) - (pi + exp(1))
\def\Hline{\noalign {\ifnum 0=`}\fi \hrule \@height 2.67985974062474\arrayrulewidth \futurelet \reserved@a \@xhline}

%------------ 本文領域いっぱいの下線 ----------
%\ulfill

%------------ 均等割り付け ------------------
%\fitwidth

%------------ 英文対応キャプション ------------
%\caption[]{}
%\kcaption[]{}
%\newcaption[]{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 変数の定義とデフォルト値の設定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------ フォントサイズ -----------------
%本文のフォントサイズ
\def\mainfontsize{\fontsize{12pt}{21pt}}
%英語タイトルのフォントサイズ
\def\etitlefontsize{\fontsize{14pt}{14pt}}
%キャプションのフォントサイズ
\def\captionfontsize{\fontsize{11pt}{14pt}}

%------------ 書式関係 ---------------------
%日本語タイトル・サブタイトル
\let\@jtitle\relax
\let\@jsubtitle\relax

%英語タイトル・サブタイトル
\let\@etitle\relax
\let\@esubtitle\relax

%日本語著者名
\let\@jauthor\relax

%英語著者名
\let\@eauthor\relax

%著者所属
\let\@affiliate\relax

%研究室名
\let\@laboratory\relax

%指導教官
\let\@supervisor\relax
\let\@professorship\relax

%修了年月
\let\@ptdate\relax

%前文の章タイトル
\let\@jabstract\relax
\let\@eabstract\relax

%年数カウンタ
\newcount\c@year@thesis
\c@year@thesis=\year
\ifnum\the\month<4
	\advance\c@year@thesis -1
\fi

%目次・図目次・表目次の制御
\newif\iftoc
\newif\iflof
\newif\iflot


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% プリアンブルでの使用を強制
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@onlypreamble\eom
\@onlypreamble\jtitle
\@onlypreamble\etitle
\@onlypreamble\affiliate
\@onlypreamble\laboratory
\@onlypreamble\author
\@onlypreamble\supervisor
\@onlypreamble\setyear
\@onlypreamble\ptdate
\@onlypreamble\abstractname
\@onlypreamble\toctrue
\@onlypreamble\tocfalse
\@onlypreamble\loftrue
\@onlypreamble\loffalse
\@onlypreamble\lottrue
\@onlypreamble\lotfalse
\@onlypreamble\domestictrue
\@onlypreamble\domesticfalse


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 書誌情報の設定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%日本語タイトル設定
\def\jtitle#1{\def\@jtitle{\ulfill{#1}}}

%英語タイトル設定
\def\etitle#1{\def\@etitle{\ulfill{#1}}}

%学部学科
\def\affiliate#1{\def\@affiliate{#1}}

%研究室名
\def\laboratory#1{\edef\@laboratory{#1}}

%著者氏名
\def\author#1{\def\@jauthor{#1}}

%指導教官名・職位
\def\supervisor#1#2{\def\@supervisor{#1}\def\@professorship{#2}}

%年度の手動設定
\def\setyear#1{\c@year@thesis#1}

%修了年月（西暦）
\def\ptdate#1#2{\def\@ptdate{#1年#2月}}

%アブストラクト名の設定
\def\abstractname#1#2{\def\@jabstract{#1}\def\@eabstract{#2}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 文書構造の明示に関するコマンド
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 文書メタの終了
\def\eom{%
	\begin{document}
	\maketitle
	%
	\pagenumbering{roman}}

%%% 日本語アブストラクト
\def\jabstract{%
	\clearpage
	%
	\chapter*{\@jabstract}
	%
	\mainfontsize\selectfont
	\parindent=1zw}

%%% 英語アブストラクト
\def\eabstract{%
	\clearpage
	%
	\begin{flushleft}
		\fontsize{12pt}{0pt}\selectfont
		\fitwidth{3zw}{Title}
		\hspace*{2.75zw}
		%
		\begin{minipage}[t]{121mm}
			\etitlefontsize\selectfont
			\baselineskip=2zh
			\@etitle
		\end{minipage}
	\end{flushleft}
	%
	\npbchapter*{\@eabstract}
	%
	\mainfontsize\selectfont
	\parindent=.5in
	\noindent}

%%% 本文
\def\main{%
	\clearpage
	%
	\iftoc\tableofcontents\clearpage\fi
	\iflof\listoffigures\clearpage\fi
	\iflot\listoftables\clearpage\fi
	%
	\pagenumbering{arabic}
	\setcounter{page}{1}
	%
	\mainfontsize\selectfont
	%
	\clearpage
	\parindent=1zw}

%%% 謝辞
\def\acknowledge#1{%
	\clearpage\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}}

%%% 参考文献
\def\references#1{%
	\def\bibname{#1}
	\clearpage}

%%% 発表実績
\def\publications#1{%
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}}
%
\def\publicationtype#1{\par\vtop{\section*{#1}}}
%
\newenvironment{thepublication}%
	{\renewcommand{\labelenumi}{[\theenumi]}\begin{enumerate}}%
	{\end{enumerate}}


%%% 付録
\let\@appendix\appendix
\def\appendix{\clearpage\@appendix}

%%% 研究室内部用の資料
\newif\ifdomestic
\def\domestictrue{\includecomment{domestic}}
\def\domesticfalse{\excludecomment{domestic}}

%%% End Of File
\def\eof{%
	\printindex\end{document}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 標題紙のテンプレート
%  top =35mm, bottom=10mm,
%  left=30mm, right =30mm,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\@kanjiskip\kanjiskip
\let\@xkanjiskip\xkanjiskip
\def\maketitle{%
	\thispagestyle{empty}
	\vspace*{5mm}
	%
	\begin{center}
		\fontsize{24pt}{0pt}\selectfont
		\hspace*{-1.75zw}\fitwidth{58mm}{修士学位論文}
	\end{center}
	%
	\vspace*{21mm}
	%
	\begin{flushleft}
		\fontsize{12pt}{0pt}\selectfont
		\fitwidth{5.5zw}{論文題目}
		\hspace*{.25zw}
		%
		%\let\@udfullwidth0
		\setbox0=\hbox{\fitwidth{5.5zw}{論文題目}\hspace*{.25zw}}
		\edef\@udfullwidth{\wd0}
		%
		\begin{minipage}[t]{121mm}
			\fontsize{20pt}{0pt}\selectfont
			\baselineskip=3zh
			\@jtitle
		\end{minipage}
	\end{flushleft}
	%
	\vfill
	%
	\vspace*{2zh}
	%
	\vspace*{4pt}
	\begin{flushleft}
		\fontsize{12pt}{0pt}\selectfont
		\ruby[g]{\fitwidth{5.5zw}{氏名}}{ふりがな}
		%
		\fontsize{9.5pt}{0pt}\selectfont
		\hspace*{5.5zw}\hskip 0zw plus 0zw minus 0zw
		\fontsize{12pt}{0pt}\selectfont
		%
		\begin{minipage}[t]{121mm}
			\fontsize{20pt}{0pt}\selectfont
			\kanjiskip=.25zw
			\xkanjiskip=.25zw
			\newdimen\@orgwspc
			\@orgwspc=\fontdimen2\font
			\fontdimen2\font=2zw
			\hfil\@jauthor\hfil\\
			\fontdimen2\font=\@orgwspc
			\rule{\hsize}{\@ulfill@ulht}
		\end{minipage}
	\end{flushleft}
	\vspace*{-4pt}
	%
	\vspace*{7mm}
	\begin{flushleft}
		\fontsize{12pt}{0pt}\selectfont
		\fitwidth{5.5zw}{専攻}
		%
		\fontsize{9.5pt}{0pt}\selectfont
		\hspace*{5.5zw}\hskip 0zw plus 0zw minus 0zw
		\fontsize{12pt}{0pt}\selectfont
		%
		\begin{minipage}[t]{121mm}
			\fontsize{20pt}{0pt}\selectfont
			\kanjiskip=.25zw
			\xkanjiskip=.25zw
			\hfil\@affiliate\hfil\\
			\rule{\hsize}{\@ulfill@ulht}
		\end{minipage}
	\end{flushleft}
	%
	\vspace*{7mm}
	\begin{flushleft}
		\fontsize{12pt}{0pt}\selectfont
		\fitwidth{5.5zw}{指導教授}
		%
		\fontsize{9.5pt}{0pt}\selectfont
		\hspace*{5.5zw}\hskip 0zw plus 0zw minus 0zw
		\fontsize{12pt}{0pt}\selectfont
		%
		\begin{minipage}[t]{121mm}
			\fontsize{20pt}{0pt}\selectfont
			\kanjiskip=.25zw
			\xkanjiskip=.25zw
			\newdimen\@orgwspc
			\@orgwspc=\fontdimen2\font
			\fontdimen2\font=1.5zw
			\hfil\@supervisor~\@professorship\hfil\\
			\fontdimen2\font=\@orgwspc
			\rule{\hsize}{\@ulfill@ulht}
		\end{minipage}
	\end{flushleft}
	%
	\vspace*{7mm}
	\begin{flushleft}
		\fontsize{12pt}{0pt}\selectfont
		\fitwidth{5.5zw}{修了年月}
		%
		\fontsize{9.5pt}{0pt}\selectfont
		\fitwidth{5.5zw}{（西暦）}\hskip 0zw plus 0zw minus 0zw
		\fontsize{12pt}{0pt}\selectfont
		%
		\begin{minipage}[t]{121mm}
			\fontsize{20pt}{0pt}\selectfont
			\kanjiskip=.25zw
			\xkanjiskip=.25zw
			\hfil\@ptdate\hfil\\
			\rule{\hsize}{\@ulfill@ulht}
		\end{minipage}
	\end{flushleft}
	%
	\vspace*{5.5zh}
	\begin{center}
		\fontsize{20pt}{0pt}\selectfont
		\hspace*{-2.5zw}
		\fitwidth{67mm}{工学院大学大学院}
	\end{center}
	\vspace*{1.5zh}
	%
	\c@page=0
	%
	\clearpage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 表のインクルードとラベルの自動定義
%  by KASHINA, Yuki
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\Tin@found{f}
\def\Tinput@path{./}
\def\tablepath#1{\def \Tinput@path {#1}}
\def\includetable#1{%
	\IfFileExists{#1.tbl}%
		{%
			\input{#1.tbl}
			\def\Tin@found{t}
		}%
		{%
			\expandafter\@tfor%
			\expandafter\Tin@prefix%
			\expandafter:\expandafter=\Tinput@path\do{%
				\IfFileExists{\Tin@prefix#1.tbl}%
					{%
						\input{\Tin@prefix#1.tbl}
						\def\Tin@found{t}
					}%
					{%
						\relax
					}
			}
		}
	\if \Tin@found t
		\tlabel{#1}
	\else
		\input{#1.tbl}
	\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 改行ページしない章
% no page break chapter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\long\def\npbchapter{%
	\par
	\plainifnotempty
	\global\@topnum\z@
	\if@english \@afterindentfalse \else \@afterindenttrue \fi
	\secdef
		{\@omit@numberfalse\@chapter}%
		{\@omit@numbertrue\@schapter}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ulfill
%  by KASHINA, Yuki
%  (ref: udline.sty v2.52)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefined{iftdir}{\newif\iftdir\tdirfalse}{}
%--------------------------------------------------------------------
%%% frontend
\def\ulfill#1{\leavevmode\@ulfill@dolist#1\@endul \@ulfill\par}

%--------------------------------------------------------------------
%%% util
\def\@endul{\relax}
\def\eiji{\@endul}
\def\Eiji{\eiji}
\def\@hogo#1{\@ulfill@makeun{\mbox{#1}}\@ulfill@dolist}
\def\@eiji#1{\@ulfill@makeun{#1}\futurelet\@t@gi\@checkEiji}
\def\@checkEiji{%
	\ifx\@t@gi\Eiji\let\@ulfill@next=\@dolist\else\@ulfill@ulgl\let\@ulfill@next=\@eiji\fi\@ulfill@next}
\let\@endline@a\\\relax
\let\@endline@b\newline\relax

%--------------------------------------------------------------------
%%% counter
\newcount\@ulfill@n
\@ulfill@n=0

%--------------------------------------------------------------------
%%% underline weight (height) - default: 0.05ex
\def\settitleulwidth#1{\def\@ulfill@ulht{#1}}
\settitleulwidth{0.05ex}

%--------------------------------------------------------------------
%%% minsep between underline and baseline
%%%  - default: landscape=0.6ex, portrait=1.2ex
\def\settitleulminsep#1#2{%
	\def\@ulfill@ulminsep{\iftdir#1\else#2\fi}}
\settitleulminsep{1.2ex}{0.6ex}

%--------------------------------------------------------------------
%%% offset - default: 2pt
\def\settitleulsep#1{\def\@ulfill@ulsep{#1}}
\settitleulsep{2\p@}

%--------------------------------------------------------------------
%%% underline
\def\@ulfill{%
	\\[\dimexpr-\baselineskip+\@ulfill@ulsep+\@ulfill@ulminsep+\@ulfill@ulht]
	\leavevmode \leaders \hrule width 0pt height 0pt depth \@ulfill@ulht
	\hfill \kern \z@}

%--------------------------------------------------------------------
%%% nextchar frontend
\def\@ulfill@dolist{\futurelet\@ulfill@next\@ulfill@chkbg}

%--------------------------------------------------------------------
%%% nextchar mode changer
\def\@ulfill@chkbg{%
	\if\bgroup\@ulfill@next
		\let\@ulfill@next\@ulfill@@dolistmbox
	\else
		\let\@ulfill@next\@ulfill@@dolist
	\fi
	\@ulfill@next}

%--------------------------------------------------------------------
%%% nextchar logic
\def\@ulfill@@dolist{\afterassignment\@ulfill@d@list\let\@ulfill@next= }
\def\@ulfill@@dolistmbox{\@ulfill@@dolist\mbox}

%--------------------------------------------------------------------
%%% put char and underline (main)
\def\@ulfill@d@list{%
	\ifx\@ulfill@next\@endul
		\let\@ulfill@next\relax
	\else\ifx\@ulfill@next\mbox
		\let\@ulfill@next\@hogo
	\else\ifx\@ulfill@next\eiji
		\let\@ulfill@next\@eiji
	\else
		\@ulfill@udline\let\@ulfill@next\@ulfill@dolist
	\fi \fi \fi
	\@ulfill@next}
%
\def\@ulfill@makeun#1{%
	\hskip \z@ plus.5\p@ minus\z@\relax
	\if\space\@ulfill@next
		\def\@tempdima{\hskip .34em plus .17em minus .11em}\relax
		\setbox0=\hbox{\@tempdima}\relax
		%
		\advance\@ulfill@n\wd0\relax
		\ifnum \@ulfill@n>\textwidth
			\@ulfill@n=\wd0\relax
			%
			\@ulfill \par\noindent
		\fi
		%
		\@tempdima
		%
		%\typeout{!!! SPACE !!! \@ulfill@n}\relax
	\else \ifx\@endline@a#1
		\@ulfill \par\noindent
		\@ulfill@n=0\relax
		%
		%\typeout{!!! CRLF1 !!! \@ulfill@n}\relax
	\else \ifx\@endline@b#1
		\@ulfill \par\noindent
		\@ulfill@n=0\relax
		%
		%\typeout{!!! CRLF2 !!! \@ulfill@n}\relax
	\else
		\setbox0=\hbox{#1}\relax
		%
		\advance\@ulfill@n\wd0\relax
		\ifnum \@ulfill@n>\textwidth
			\@ulfill@n=\wd0\relax
			%
			\@ulfill \par\noindent
		\fi
		%
		\vrule width\z@#1\vrule width\z@\relax
		%
		%\typeout{!!! LETTR !!! : \meaning#1 (\the\@ulfill@n / \number\textwidth)}\relax
	\fi \fi \fi}
	
%--------------------------------------------------------------------
%%% spacing
\def\@ulfill@udline{%
	\if !\@ulfill@next\relax\penalty10000\fi
	\if "\@ulfill@next\relax\penalty10000\fi
	\if '\@ulfill@next\relax\penalty10000\fi
	\if )\@ulfill@next\relax\penalty10000\fi
	\if *\@ulfill@next\relax\penalty500\fi
	\if +\@ulfill@next\relax\penalty500\fi
	\if -\@ulfill@next\relax\penalty10000\fi
	\if .\@ulfill@next\relax\penalty10000\fi
	\if ,\@ulfill@next\relax\penalty10000\fi
	\if /\@ulfill@next\relax\penalty500\fi
	\if ;\@ulfill@next\relax\penalty10000\fi
	\if ?\@ulfill@next\relax\penalty10000\fi
	\if :\@ulfill@next\relax\penalty10000\fi
	\if ]\@ulfill@next\relax\penalty10000\fi
	\if 、\@ulfill@next\relax\penalty10000\fi
	\if 。\@ulfill@next\relax\penalty10000\fi
	\if ，\@ulfill@next\relax\penalty10000\fi
	\if ．\@ulfill@next\relax\penalty10000\fi
	\if ・\@ulfill@next\relax\penalty10000\fi
	\if ：\@ulfill@next\relax\penalty10000\fi
	\if ；\@ulfill@next\relax\penalty10000\fi
	\if ？\@ulfill@next\relax\penalty10000\fi
	\if ！\@ulfill@next\relax\penalty10000\fi
	\if ）\@ulfill@next\relax\penalty10000\fi
	\if ｝\@ulfill@next\relax\penalty10000\fi
	\if ］\@ulfill@next\relax\penalty10000\fi
	\if ’\@ulfill@next\relax\penalty10000\fi
	\if ー\@ulfill@next\relax\penalty10000\fi
	\if ＋\@ulfill@next\relax\penalty200\fi
	\if −\@ulfill@next\relax\penalty200\fi
	\if ＝\@ulfill@next\relax\penalty200\fi
	\if ぁ\@ulfill@next\relax\penalty150\fi
	\if ぃ\@ulfill@next\relax\penalty150\fi
	\if ぅ\@ulfill@next\relax\penalty150\fi
	\if ぇ\@ulfill@next\relax\penalty150\fi
	\if ぉ\@ulfill@next\relax\penalty150\fi
	\if っ\@ulfill@next\relax\penalty150\fi
	\if ゃ\@ulfill@next\relax\penalty150\fi
	\if ゅ\@ulfill@next\relax\penalty150\fi
	\if ょ\@ulfill@next\relax\penalty150\fi
	\if ァ\@ulfill@next\relax\penalty150\fi
	\if ィ\@ulfill@next\relax\penalty150\fi
	\if ゥ\@ulfill@next\relax\penalty150\fi
	\if ェ\@ulfill@next\relax\penalty150\fi
	\if ォ\@ulfill@next\relax\penalty150\fi
	\if ッ\@ulfill@next\relax\penalty150\fi
	\if ャ\@ulfill@next\relax\penalty150\fi
	\if ュ\@ulfill@next\relax\penalty150\fi
	\if ョ\@ulfill@next\relax\penalty150\fi
	\@ulfill@makeun{\@ulfill@next}%
	\ifx \#\@ulfill@next\relax\penalty500\fi
	\ifx \$\@ulfill@next\relax\penalty500\fi
	\ifx \%\@ulfill@next\relax\penalty500\fi
	\ifx \&\@ulfill@next\relax\penalty500\fi
	\ifx \`\@ulfill@next\relax\penalty10000\fi
	\if (\@ulfill@next\relax\penalty10000\fi
	\if [\@ulfill@next\relax\penalty10000\fi
	\if （\@ulfill@next\relax\penalty10000\fi
	\if ｛\@ulfill@next\relax\penalty10000\fi
	\if ［\@ulfill@next\relax\penalty10000\fi
	\if ‘\@ulfill@next\relax\penalty10000\fi
	\if ＃\@ulfill@next\relax\penalty200\fi
	\if ＄\@ulfill@next\relax\penalty200\fi
	\if ％\@ulfill@next\relax\penalty200\fi
	\if ＆\@ulfill@next\relax\penalty200\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 均等割り付け
% http://www.math.nagoya-u.ac.jp/~kubo/ja/latex/tips-003.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\fitwidth#1#2{\leavevmode{%
	\setbox0=\hbox{#2}%
	\ifdim\wd0>#1 \resizebox{#1}{\height}{#2}%
	\else
		\def\@tempa{#2}%
		\ifx\@tempa\empty\hbox to#1{\hss}%
		\else\relax\hbox to#1\bgroup\hfil\@fitwidth#2{}\end@fitwidth\fi
	\fi}}
\def\@fitwidth#1#2\end@fitwidth{\def\@tempa{#2}#1%
	\ifx\@tempa\empty\let\next\end@fitwidth
	\else\hfill\def\next{\@fitwidth#2\end@fitwidth}\fi
	\next}
\def\end@fitwidth{\hfil\egroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% クラスファイル定義の終了
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{fleqn}{\PassOptionsToPackage{fleqn}{amsmath}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsbook}}
\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 必要なパッケージ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{top=30truemm,left=30truemm,right=20truemm,bottom=27truemm}
\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage{times}
\RequirePackage{pxrubrica}
\RequirePackage[dvipdfmx]{hyperref}
\RequirePackage{pxjahyper}
\RequirePackage{makeidx}
\RequirePackage{amsmath}
\RequirePackage{comment}
\RequirePackage{caption}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% キャプションの再定義
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%英語図表キャプションの接頭辞
\def\jfigurename{図}
\def\jtablename{表}
\def\efigurename{Fig.~}
\def\etablename{Table~}

%captionパッケージの設定
\DeclareCaptionFont{mainfontsize}{\captionfontsize\selectfont}
\captionsetup{font=mainfontsize,labelsep=quad}

%キャプション接頭辞の再定義
\long\def\figurename{\if@english\efigurename\else\jfigurename\fi}
\long\def\tablename{\if@english\etablename\else\jtablename\fi}

%キャプション命令の再定義
\renewcommand{\caption}[2][]{%
\ifx \@captype \@undefined \@latex@error {\noexpand\caption outside float}\@ehd \expandafter \@gobble \else \refstepcounter \@captype \expandafter \@firstofone \fi {\@dblarg {\k@caption \@captype }}{#2}[#1]}
%
\newcommand{\kcaption}[2][]{%
\ifx \@captype \@undefined \@latex@error {\noexpand\caption outside float}\@ehd \expandafter \@gobble \else \refstepcounter \@captype \expandafter \@firstofone \fi {\@dblarg {\k@caption \@captype }}{#2}[#1]}
%
\newcommand{\newcaption}[2][]{%
\ifx \@captype \@undefined \@latex@error {\noexpand\caption outside float}\@ehd \expandafter \@gobble \else \refstepcounter \@captype \expandafter \@firstofone \fi {\@dblarg {\k@caption \@captype }}{#2}[#1]}
%
\long\def\k@caption#1[#2]#3[#4]{%
\let\@abovecaptionskip\abovecaptionskip
\let\@belowcaptionskip\belowcaptionskip
\ifx #4 #4 \else \def\belowcaptionskip{\z@} \fi
\par \addcontentsline {\csname ext@#1\endcsname }{#1}{\protect \numberline {\csname the#1\endcsname }{\ignorespaces #2}}\begingroup \@parboxrestore \if@minipage \@setminipage \fi \normalsize \@makecaption {\csname fnum@#1\endcsname }{\ignorespaces #3}\par %
\ifx #4 #4 \else \def\belowcaptionskip{\@belowcaptionskip} \fi
\def\abovecaptionskip{\z@} %
\ifx #4 #4 \else \@englishtrue \@makecaption {\csname fnum@#1\endcsname }{\ignorespaces #4}\par \@englishfalse \fi %
\def\abovecaptionskip{\@abovecaptionskip} %
\endgroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %研究室内部用資料デフォルト（無効）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\domesticfalse


%%%%%% END OF CLASS FILE %%%%%%