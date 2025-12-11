#import "../src/lib.typ": *
// Typst does not support global variables, so for now we import
// everything we need into an import file and import it here and
// for all subfiles.
// Some Macros are also defined in the import file.
#import "imports.typ": *

#show: codly-init.with()
#codly(languages: (python: (name: "Python", color: rgb("#006699"))))
// No idea what this does, but it seems fancy.
#show "Typst": fancy-typst
#show "LaTeX": fancy-latex

// Next line HAS to be HERE for ctheorems to work properly
#show: thmrules

// Document type for this template
#show: tuw-thesis.with(
  header-title: "Peek-a-Boo",
  lang: "en",
)
#maketitle(
  title: "A Critical Study on Batman",
  thesis-type: [Thesis],
  authors: (
    (
      name: "TheInvisibleFoe",
      email: [#link("mailto:lolcat@example.com")],
      supervisor: "Wikipedia",
    ),
  ),
)
#abstract[
  #include "abstract.typ"
]




#pagebreak()
#outline()


= Introduction
If you have started reading this document, I have successfully lured you in to reading about batman. Spoiler Alert: Batman is awesome, and he cannot be studied because he is AWESOME. Anyways, there are just some sample examples of different usages of some stuff here.

= Math
#definition("Kolmogorov Smirnov Test")[

  The one sample Kolmogorov Smirnov test is defined as follows:
  The empirical distribution function $F_n$ for n independent and identically distributed (i.i.d.) ordered observations $X_i$ is defined as
  $
    F_n (x) = ("number of elements in sample"<= x)/n = (1/n) sum_(i=1)^n I_([-infty, x])(X_i)
  $
  where $I_([-infty, x])(X_i)$ is an indicator function that is 1 if $X_i$ is in the interval $[-infty, x]$ and 0 otherwise.

  The Kolmogorov Smirnov statistic $D_n$ is then defined as
  $
    D_n = sup_x |F_n(x) - F(x)|
  $
  where $F$ is the cumulative distribution function of the reference distribution being tested against.
]<KStest>
// labelling the definition for later referencing
#theorem("Glivenko-Cantelli Theorem")[
  Suppose that the observations $X_1, X_2, ..., X_n$ used in @KStest in are independent and identically distributed with cumulative distribution function $F$. Then, the empirical distribution function $F_n$ converges uniformly to $F$ almost surely, i.e.,
  $
  norm(F_n - F)_infty = sup_(x in RR) |F_n (x) - F(x)| --> 0 "as" n --> infty
  $

]
Here is a really interesting paper, where this test was used @Neave2010, and the code for generating the same is below.

```typst
#definition("Kolmogorov Smirnov Test")[

  The one sample Kolmogorov Smirnov test is defined as follows:
  The empirical distribution function $F_n$ for n independent and identically distributed (i.i.d.) ordered observations $X_i$ is defined as
  $
    F_n (x) = ("number of elements in sample"<= x)/n = (1/n) sum_(i=1)^n I_([-infty, x])(X_i)
  $
  where $I_([-infty, x])(X_i)$ is an indicator function that is 1 if $X_i$ is in the interval $[-infty, x]$ and 0 otherwise.

  The Kolmogorov Smirnov statistic $D_n$ is then defined as
  $
    D_n = sup_x |F_n(x) - F(x)|
  $
  where $F$ is the cumulative distribution function of the reference distribution being tested against.
]<KStest>
// labelling the definition for later referencing
#theorem("Glivenko-Cantelli Theorem")[
  Suppose that the observations $X_1, X_2, ..., X_n$ used in @KStest in are independent and identically distributed with cumulative distribution function $F$. Then, the empirical distribution function $F_n$ converges uniformly to $F$ almost surely, i.e.,
  $
  norm(F_n - F)_infty = sup_(x in RR) |F_n (x) - F(x)| --> 0 "as" n --> infty
  $
]
```
== Unnumbered Math

A random lagrangian as given by Github Copilot is,
#nonum($
  cal(L) = -bar(psi)(i gamma^mu D_mu - m)psi - (1/4) F_(mu nu) F^(mu nu) + |D_mu phi|^2 - V(phi)
$)
where $D_mu = partial_mu + i e A_mu$ is the covariant derivative, $F_(mu nu) = partial_mu A_nu - partial_nu A_mu$ is the electromagnetic field strength tensor, $psi$ is the Dirac spinor field representing the electron, $A_mu$ is the electromagnetic four-potential, $phi$ is the complex scalar field, and $V(phi)$ is the potential energy term for the scalar field.

Below is the code for generating the above lagrangian without equation numbering.

```typst
#nonum($
  cal(L) = -bar(psi)(i gamma^mu D_mu - m)psi - (1/4) F_(mu nu) F^(mu nu) + |D_mu phi|^2 - V(phi)
$)
```
= Fun CS stuff


Here is some ChatGPT generated Python code that prints the first 10 terms of the Fibonacci sequence:
```python
n = 10  # number of terms

a, b = 0, 1

for _ in range(n):
    print(a, end=" ")
    a, b = b, a + b   # swapped & updated without third variable

```
A program which prints out its own source code is called a quine. A polyquine is a program that can output its own source code when compiled or interpreted in multiple programming languages. The following is polyquine called the Ourobourous quine that works in 128 different programming languages. The github repo is here #link("https://github.com/mame/quine-relay","Ourobourous Quine").

// // The default link type is filled. The alternate link style is box style, which can be enabled by uncommenting the below code. Or one can set the default link style in the /src/styles.typ file.
// #show link: this => {
//   let show-type = "box" // "box" or "filled", see below
//   let label-color = olive
//   let default-color = red
//   if show-type == "box" {
//     if type(this.dest) == label {
//       // Make the box bound the entire text:
//       set text(bottom-edge: "bounds", top-edge: "bounds")
//       box(this, stroke: label-color + 1pt)
//     } else {
//       set text(bottom-edge: "bounds", top-edge: "bounds")
//       box(this, stroke: default-color + 1pt)
//     }
//   }
// }

As a refresher on this and more fun stuff is an NDC conference talk by Dylan Beattie, #link("https://www.youtube.com/watch?v=6avJHaC3C2U","The Art of Code"). For now, the whole source code is pasted below:

#codly-disable()
#show raw: set text(size:0.321em)
```ruby
eval$s=%q(eval(%w(B=92.chr;g=32.chr;puts(eval(%q(N=10.chr;n=0;e=->s{Q[Q[s,B],?"].K(N,B+?n)};E=->s{'("'+e[s]+'")'};d=->s,t=?"{s.K(t){t+t}};def~f(s,n)s.K(/.{1,#{n*255}}/m){yield$S=E[$s=$&]}end;Q=->s,t=?${s.K(t){B+$&}};R=";return~0;";V=->s,a,z{s.K(/(
#{B*4})+/){a+"#{$&.size/2}"+z}};C=%w(System.Console~Write);$C=C*?.;$D="program~QR";$G="~contents~of"+$F="~the~mix!g~bowl";$L="public~static";$W="s.WriteByte";rp=->s,r{v="";[r.!ject(s){|s,j|o={};m=n=0;s.size.times{|i|o[f=s[i,2]]||=0;c=o[f]+=1;m<c&&
(m=c;n=f)};v=n+v;s.K(n,(j%256).chr)},v]};%(fn~mX{Z`x21("{}",#{E["object~QR~extends~App{#{f(%((display~"#{e[%(Zf("1d;s/.//;s/1/~the~sum~of~a~son~and0/g;s/0/~twice/g;s/2/`x59ou~are~as~bad~as/g;s/3/~a~son`x21Speak~your~m!d`x21/g^n#The~Relay~of~Qu!e.^
n#Ajax,~a~man.^n#Ford,~a~man.^n#Act~i:~Qu!e.^n#Scene~i:~Relay.^n#[Enter~Ajax~and~Ford]^n#Ajax:^n#");function[]=f(s);for~i=1:2:length(s),Zf("2%s3",part(dec2b!(hex2dec(part(s,i:i+1))),$:-1:2)),end;endfunction`n#{s,v=rp["Z"+E[%(fun~p~n=Z(Int.toSJ~n`x
5e"~");fun~mX=(p~0;p~0;p~130;List.tabulate(127,p);SJ.map(fn~c=>(p(3+ord~c);Z"-1~0~";c))#{E[~~~~~~%(object"Application"{state"ma!"{foreach(s~![#{f("Z#{E[%(puts~"#{Q[e[%(echo~'a::=`x7e#{Q[Q["let~s=#{E[%(void~p(!t[]c){foreach(!t~v~!~c)stdout.Zf("%c%c
",v/256,v%256);}void~mX{!t[]a;p({19796,26724,0,6,0,1,480,19796,29291,#{s=%(module~QR;!itial~beg!~#{f((%(Module~QR`nSub~MX`nDim~c,n:Dim~s~As~Object=#{C[0]}.OpenStandardOutput():Dim~t()As~Short={26,34,86,127,148,158,200}:For~Each~d~!"BasmCBBBCRE`x60
F<<<<C<`x60C<B`x60BBD#C`x58wasi_snapshot_preview1`x4afd_HBBEEDCDGECB@IUD`x48memoryDB`x48_startBDL|DRBAC~BA`x4alACA4RB9MiCD<AERCA>D`x21BE@ABRCABRCABRCA`x4a`x21CE@~B-BB~CACk:CvACqRC~COBMADRCACRCADRCABRCABRC~BACj:B-BBOBMADRCADRCADRCAFRCMM}CBABM`x7e#{
40.chr}BBBCBBB,BBBDBBB0BBBDBBB4BBB=BBB?BBB;BBB~...^t..^n..(module(import~:wasi_snapshot_preview1:~:fd_H:~(func(param~i32~i32~i32~i32)(result~i32)))(memory(export~:memory:)(data~:^08^00^00^00$:))(func(export~:_start:)i32.const~1~i32.const~0~i32.con
st~1~i32.const~0~call~0~drop))":c=Asc(d):If~c=36:For~c=0To~11:#$W(If(c~Mod~3,Asc(#{s="<?xml#{O="~version='1.0'"}?><?xml-#{I="stylesheet"}~type='text/xsl'href='QR.xslt'?><xsl:#{I+O}~xmlns:xsl='http://www.w3.org/1999/`x58SL/Transform'><xsl:output~me
thod='text'/><#{U="xsl:template"}~match='/'><`x21[CDATA[#{%(su b~f(s$,n)  Z(s$);:for~i=1to~n~Z("Y");:next:end~sub:f("#{V[e[%(H,format="#{y="";f("^H{-}{txt}{#{Q["echo~-E~$'#{Q[Q[E[%(with~Ada.Text_Io;procedure~qr~is~beg!~Ada.Text_Io.Put("#{d[%(trans
~B(Buffer)`ntrans~O(n){`nB:add(Byte(+~128~n))}`ntra ns~f(v     ~n){      `nO(+(/~    n~64)107)`nO(n:mod~64)`nO~v}`ntrans~D(n){if(<~n~4){f(+(*~6~n)9)48}{if(n:odd-p){D(-~n~3)`nf~27~48`nf~36~11}{D(/~n~2)`nf~21~48`nf~48~20}}}`ntrans~S(Buffer"#{e[%W[ST
RINGz:=~226+~153,a:=z+~166,b:=a+"2"+z+~160,c:=b+"   8"+       z                     +~165,t:="#{d[%(class~QR{#$L~void~ma!(SJ[]a){a=#{E["H('#{Q[e["implement~ma!0()=Z"+E[                "BEGIN{Z#{E[%(echo~'#{%(f(s){System.out.Z(s);}s="389**6+44*6+00
p45*,";for(c:#{E[(s="#!clude<iostream>`n!t~mX{s    td                                          ::cout<<#{E[%(class~Program{#$L~void~MX{#$C("Qu!e~Relay~Coffee.                                  ^n^nIngredients.^n");for(!t~i=9;i++<126;)#$C($"{i}~g~ca
ffe!e~{i}^n");#$C("^nMethod.^n");foreach(char                                                ~c~!#{E[%((doseq[s(lazy-cat["IDENTIFICATION~DIVISION.""PROGR                                            AM-ID.~QR.""PROCEDURE~DIVISION."'DISPLA`x59](map~#
(str"~~~~^""(.replace~%1"^"""^"^"")"^"")(re-                                                        seq~#".{1,45}""#{e["(f=(n)->Array(n+1).jo!~'Y');c                                                    onsole.log('%s',#{V[E[%((H-l!e"#{e["puts#{E["i
mport~std.stdio;void~mX{H(`x60#{"['']p[#{"I                                                             O.puts"+E[%((pr!c~"#{e["`nma!(_)->`nio:fH#                                                          {d[E[%(echo~"#{e['Zfn("""'+d[?"+"%option~no
yywrap`n%%`n%%`n!t~mX{puts#{E["echo~'#{Q[                                                             Q[%(~:~A~."#{g*9}"~;~:~B~A~."~WRITE(*,*)'                                                                "~A~;~:~C~B~T`x59PE~."~'"~CR~;~:~D~S"~#$
D"~C~S^"~Z~^"(&"~C~S^"~#{e[%(Z"#{e["s:=     Outp                                                           utTextUser();WriteAll(s,#{E[%(Zf"#                          {e[d[f('set~Z"                             -";Z'+E[%(package~ma!;import"fmt";fun
c~mX{fmt.Pr!t#{E[%(236:j;{119:i;{206i-     :i;.4                                                               8<{71+}{[i]^48-*}if}%}:t;"al                     goritmo~QR;!"[195][173]++'ci                       o~imprima("'"013141"t"/12131"t~6*"/1
:1918151:??6271413/4=3626612/2/353251      215/                                                              `x5a0`x5a0R"t"#{e[%(z=new~j                   ava.util.zip.G`x5aIPOutputStream(Syste                    m.out);z.H('#{"ma!=putStr"+E["clas
s~QR{#$L~function~mX{neko.Lib.Z#{E[%(                      procedure~mX;i:=c:=0;s                                :=#{E[%(.class~public~                 QR`n.super~#{$T="java/io/Pr!tStream"}`n.meth                   od~#$L~ma!([L#{S="java/lang/S"}J
;)V~;]`n.limit~stack~2`ngetstatic~#{S  }yst         em/out~L#$T;`nldc~"#{e[%(class~QR{                              #$L~void~ma!(SJ[]                v){SJ~c[]=new~SJ[99999],y="",z=y,s="#{z=t=(0..r=q=                 126).map{|n|[n,[]]};a="";b=->n{
a<<(n%78+55)%84+42};(%(P={0:'[+[]]',m:'  ((+[])'+(C="['constructor']")+"+[])['11']"};for(R                            ~!~B=('`x21[]                @`x21`x21[]@[][[]]@'+(A="[]['fill']")+"@([]+[])['fontc                 olor']([])@(+('11e20')+[])['s
plit']([])@"+A+C+"('return~escape')(     )("+A+')').split('@'))for(E~!~D=eval(G='('+B[R]+'+[                         ])'))P[T=D[E                ]]=P[T]||G+"['"+E+"']";for(G='[',B=0;++B<36;)P[D=B.toSJ(36                )]=B<10?(G+='+`x21+[]')+']':
P[D]||"(+('"+B+"'))['to'+([]+[])"      +C+"['name']]('36')";A+=C+"('console.log(unescape(^"";fo                         r(E~!~G=               #{E["fun~ma!(a:Array<SJ>){Z#{Q[E[%(p(){~echo~-n~$1;};f(){~for                ~x~!~$(p~"$1"|od~-An~-tu1~-
v);do;p~$4;for((j=$3;j--;));do;h     ~$2~$x~$j;done;done;};p~k^`x60;h(){~p~^`x60${1:$(($2>>$3&1))                         :2};               };f~'console.log#{Q[E[%(@s=global[#{i=(s=%(`x48AI~1.2`nVISIBLE~"#               {"x=sJ.K(#{V[E["changequot
e(<@,@>)`ndef!e(p,<@#{"all:`n`      t@echo~'#{d["solve~satisfy;output~[#{E["MODULE~QR;FROM~StrIO~IM                        PO   RT~WriteSJ;BEGIN~#{(%(.assembly~t{}.method~#$L~void~MX{.entrypo!t~ldstr"#{e["m{              {`x21:~x`nqr:~|-`n~:db`x60
#{e[s="$Z#{E["Zf#{E["echo#{E      ["#import<stdio.h>#{N}!t~mX{puts#{E["Z_sJ"+E["s=double#{E["Z#{E["$c                     onsole                 :l!e[#{"#$D(output);beg!~H(#{f((p="eval";%($_="#{s,v=rp["$_='#{              Q[%(<?php~$z=3+$w=strlen(
$s=#{Q[E["!t~mX{H#{E["(#{Q[      "qr:-H('#{Q[e["!it{#{f(%(Z('cat("')`nfor~c~!"".jo!(["echo~'say~''%s'''                                                      ^n"%l~for~l~!#{E[d[d["eval$s=%q(#$s)",?'],?']]}.spl               it("^n")]):Z('r=fput(cha
r(%d))'%ord(c))`nZ('end^n"      )')#),6){"Zf#{d[$S,?%]};"}}}"],?']}').",B]})Z~quit"]+R}}"]]})*3;echo"^x8                                                           9PNG^r^n^x1a^n";$m="";$t="^xc0^0^xff";for($i=-              1;++$i<128*$z;$m.=$c--?(
$w-$c||$i>$z)&&$i/$z<($c<      $w?ord($s[(!t)($c/3)]):$c--%3+2)?$t[2].$t[$c%3%2].$t[$c%3]:"^0^0^0":"^0")$c                                                              =$i%$z;foreach(array("I`x48DR".pack("NNCV              ",$w+2,128,8,2),"IDAT".g
zcompress($m),"IEND")as$d      )echo~pack("NA*N",strlen($d)-4,$d,crc32($d));).K(B,"`x7f"),?']}';s:g/^x7f/Y/                                                                 ;Z~$_",128..287];s="$_='#{Q[s,c=/['Y]              /]}';$n=32;$s='#{Q[v,c]}
';$s=`x7es{..}{$a=$&;$b=      chr(--$n&255);`x7es/$b/$a/g;}eg;Z";(s+N*(-s.size%6)).unpack("B*")[0].K(/.{6}/){                                                                   n=$&.to_i~2;((n+14)/26*6+n+47).chr              }}";s|.|$n=ord$&;substr
~unpack(B8,chr$n-!t($n/3      2)*6-41),2|eg;eval~pack'B*',$_).scan(/[~,-:A-z]+|(.)/){p="s++#{$1?"chr~#{$1.ord}                                                                     +e":$&+?+};"+p};p),1){"'#$s',"}              }'')end.".K(/[:;()]/){?
`x5e+$&}}]"]};quit"]};t       =num2cell(b=11-ceil(s/13));for~n=1:9m={};for~i=1:141f=@(x,y,n)repmat(['Ook'~char(x                                                                      )~'~Ook'~char(y)~'~'],[1~ab               s(n)]);m(i)=[f(z=46,63,
n)~f(q=z-(i<13)*13,q,i-       13)~f(33,z,1)~f(63,z,n)];end;t(x=b==n)=m(diff([0~s(x)])+13);end;Zf('%%s',t{:})"]]+R                                                                        }}"]}"]}`n"]};"]}`x60`n~              global~_start`n~_start:m
ov~edx,#{s.size}`n~mov~       ecx,m`n~mov~ebx,1`n~mov~eax,4`n~!t~128`n~mov~ebx,0`n~mov~eax,1`n~!t~128`nx:~|`n~}}  {                                                                         {{qr}}}"]}"call~void~              [mscorlib]#{C*"::"}(sJ)r
et})).K(/()[#{i=94.chr}       "]+|[#{i}']+/){["WriteSJ(",$&,");"]*($1??":?')}}END~QR."]}];",?$].K(?'){"'^''"}}     '"                    }@>)`np"],          ?&,?                             &]},'&(%d+)&',func               tion(s)return~sJ.rep('Y'
,tonumber(s))end);Z(x)"       .K(/[:"]/,":^0")}"`n`x4bT`x48`x58B`x59E~B`x59E)).size+1}x~i8]c"#{s.K(/[^"`n`t]/        )                   {"^%02`x58"%$     &.ord}}^00"                          declare~i32@put               s(i8*)def!e~i32@mX{%1=cal
l~i32@puts(i8*getelement       ptr([#{i}x~i8],[#{i}x~i8]*@s,i32~0,i32~0))ret~i32~0})],?#].K(?',%('"'"'))}'~k          k                    i~7~'`x60`x60s  `x60`x60s`x60`          x60s`          x60`x60s`x60                `x60s`x60`x60s`x60`x60s`x
60`x60si';h(){~p~${1:$((        (($2%83-10)>>((2-$3)*2))%4)):1};};f~'AG-`x48-`x48Fy.IlD==;=jdlAy=;=jldltld             lt                    l{lAulAy=jtlldlAyFy=?=jdlAyGFyF     yG2AFy>zlAFF       BCjldGyGF                y>GFy.AGy=G==n`x48==nlldC=
j@=jtlldltldlAut11'~ski^`        x60~3)]]}~}"]})A+="'+`x21[]+'"+G.charCodeAt(E).toSJ(16);for(A+="^".repla             ce(/                    '+`x21[]+'/g,^"%^")))')()",R=0;R   <9;R++)A=A.repla     ce(/'.                *?'/g,function(B){T=[];for(
E=1;B[E+1];)T.push(P[B[E++        ]]);return~T.jo!('+')});console.log('"'+A+'"'))).bytes{|n|r,z=z[n]||(             b[r/78];                    b[r];q<6083&&z[n]=[q+=1,[]];t[n] )};b[r/78];b[r]}";!   t~i                 =0,n=0,q=0;for(;++n<126;)c[n
]=""+(char)n;for(;i<#{a.si         ze};){q=q*78+(s.charAt(i)-13)%84;if(i++%2>0){y=q<n?c[q]:y;c[n++]=z              +y.charAt(                     0);System.out.Z(z=c[q]);q=0;}}}})]}"`n!vokevirtual~# $                  T/Zln(L#{S}J;)V`nreturn`n.end
~method)+N]};H("DO,1<-#"||*         s);s?while~t:=ord(move(1))do{i+:=1;u:=-i;every~0to~7do{u:=u*2+t              %2;t/:=2};H("P                      LEASE")^(i%4/3);H("DO,1SUB#"||i||"<-#"||((c-u)%25                   6));c:=u;};H("PLEASEREADOUT,1^
nPLEASEGIVEUP");end)]};}}"].          tr(?"+B,"`x21`x7e")}'.tr('`x7e`x21','Y`u0022')as~byte[]);z.c             lose())]}"{"W""w"@                      j~1+:j^-~118%1+*}%"/35512416612G61913@921/17A                   331513"t'");fim')]};})],61){"Zn#
$S`n"},?%]]}"`nquit)]});CloseS          tream(s);QUIT;"]}")]}"~DUP~A~."~DO~10~I=1,"~.~CR~S"~&A,              &"~C~."~10~~~~~~CONTI                        NUE"~CR~S^"~&A)^",&"~C~0~DO~B~."~&char(                     "~COUNT~.~."~),&'"~CR~LOOP~S^"~&^
"^""~C~S"~end~#$D"~C~A~."~STOP"           ~CR~A~."~END"~CR~B`x59E~;~D~),B],?`x21].K(?',%('"'"               '))}'"]};}".K(?"){'"34,"                          '}.K(N){'"10,"'}+?",?%]+'~""")'                       ]}")],?`x7e]}."]}"))]}]p['']pq"}`x6
0);}"]}"]}"))].K(?`x60,"Yx60"),'#            {f(',')}']})"]}"))["~~~~^"~^".""STOP~RUN."])]                (Zln(str"message(STATUS~^"~~                              ~~~"(.replace(.rep                            lace(str~s)"Y""YY")"^"""Y^"")"^")")))
).reverse]})#$C($"Put~caffe!e~{(!t)             c}~!to#$F.^n");#$C("Liquify#$G.^nPour#$                G~!to~the~bak!g~dish.^n^nServes~1.                                                                       ^n");}})]};}/****//****/";t={};b="";L="
";n=i=0;D=->n{L<<(n+62)%92+35;D};s.by                tes{|c|n>0?n-=1:(t[c]=(t[c]||[                  ]).reject{|j|j<i-3560};x=[];t[c].map{|                                                                   j|k=(0..90).f!d{|k|not~s[i+1+k]==s[j+k]}|
|91;k>4&&x<<[k,j]};x=x.max)?(n,j=x;x=b.                     size;(u=[x,3999                       ].m!;D[u%87][u/87];L<<b[0,u];b[0,u]="";x-=u)                                                             while~x>0;x=4001+i-j;D[x%87][x/87][n-5]):b<<
c;t[c]+=[i+=1]};"#!clude<stdio.h>`nchar*p=                                                     #{E[L]},s[999999],*q=s;!t~mX{!t~n,m;for(;*p;){n=(*                                                       p-5)%92+(p[1]-5)%92*87;p+=2;if(n>3999)for(m=(*p
++-5)%92+6;m--;q++)*q=q[4000-n];else~for(;n--                                               ;)*q++=*p++;}puts(s)#{R}}")]}){s+="00g,";for(m=1;m<256;m*                                               =2)s+="00g,4,:"+(c/m%2>0?"4+":"")+",";f(s);s="4,:,"
;}f(s+s);for(c:Base64.getDecoder().decode("kaARERE                                      `x58/I0ALn3n5ef6l/Pz8+fnz58/BOf5/7/hE`x58/O`x5azM5mC`x58/Oczm`x5a                                       zBPn5+`x58/OczMznBL/nM5m`x5azBPu++fPPOc5zngnnO`x5azO`x5
agnBMGAW7A==")){c=c<0?256+c:c;for(i=0;i++<3;c/=8)f(c%8);                         f("8*+8*+,");}f("@");).K(?',%('"'"'))}'|sed~-e's/Y/YY/g'~-e's/"/Yq/g'~-e's/.*/Z                         ~"&"^nquit/')]}}"]],?']}');".K(/^+/){"`x5e#{$&.size}`x5e"}]}.s
plit("Y`x5e");for(!t~i=1;i<a.length;a[0]+=a[i+1],i+=2){a[0]+="Y".repeat(Integer.parseInt(a[i]));}System.out.Z(a[0]);}})]}";FORiTO`~UPBtDO`~INTn:=ABSt[i];Z(~(50+n%64)+c+~(50+n%8MOD8)+c+~(50+nMOD8)+b+"`x4a"+a)OD]*"REPR"]}")`nwhile(`x21=(S:length)0){
`ntrans~c(S:read)`nD(c:to-!teger)`nf~35~39}`nf~24~149`n!terp:library"afnix-sio"`ntrans~o(afnix:sio:OutputTerm)`no:H~B)].K(N,'"&Character'+?'+'Val(10)&"')}");end;)]+"`nsys.exit~0",B],?']}'",/[^{}]/]}}",35){y<<",`n"+$S;"%s"}}")+y],'",','):f("']}",0)
)}]]></#{U}></xsl:#{I}>";s.size*16+3}.ToSJ("x8")(1`x58or~7-c*2^3)),92)):Next:Else:n=(c>124)*(8*c-#{s.size+1294}):Do~While~n>127:#$W(128+(127And~n)):n^=128:Loop:#$W(If(c<125,If((c-1)^7-8,c+66*(c>65And~c<91),t(c-57)),n)):End~If:Next:For~Each~c~!"#{d
[s].K~N,'"&~VbLf~&"'}":#$W(Asc(c)):Next:End~Sub:End~Module)).l!es.map{|s|"let~s=#{E[s]}`nput=s`nZ`n"}.jo!+"qa`x21",3){%($H("%s",#$S);)+N}}end~endmodule);W=s.size*72+4;"%d,%d"%[W/65536,W%65536]}});foreach(!t~c~!#{E[s]}.data)foreach(!t~v~!~a={0,9,7,
4,5,c/100*7/6+1,c%100/10*7/6+1,c%10*7/6+1,7})p({144,v=15450+v*256,384,v});p({255,12032});})]},i=0,t='k';while(s[i])t='^x60.'+s[i++]+t;console.log(t)",B],?`x21].K(?',%('"'"'))}'"^n::=^na")],/[`[`]$]/]}")]}",4){$S+?,}}])Console.H(s);Application.exit
();}})]};Z"0~0~-1");)],127..255];f(%(variable~s=`x60#{s.K(/.{1,234}/){$&.K("`x60",%(`x60+"`x60"+`x60))+"`x60+`n`x60"}}`x60,i;for(i=0;i<129;i++)s=strreplace(s,pack("C",255-i),substrbytes(`x60#{v[0,99]}`x60+`n`x60#{v[99..-1]}`x60,i*2+1,2));Zf("%s",s
)),7){"f('%s')`n"%$s.unpack("`x48*")}}Zf("^n#[Exeunt]");quit)]}")),196){%(Z#$S;)}}}"]});})).gsub(/[!HJKXYZ^`~]/){[B*2,:write,B,:tring,:gsub,"ain()",B*4,:print,g,:in][$&.ord%47%12]})))*"")#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_
#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffer_for_future_bug_fixes_#_buffe
####################################################################################  Quine Relay -- Copyright (c) 2013, 2014 Yusuke Endoh (@mametter), @hirekoke  ###################################################################################)

```

= Conclusion
This is the conclusion. Batman is still awesome. Anways, here is a joke.
#quote(attribution: "Alan Moore")[
  #set par(
    first-line-indent: 0em
  )
  See, there were these two guys in a lunatic asylum...and one night, one night they decide they don't like living in an asylum any more.
  #v(0.5em)

  They decide they're going to escape! So, like, they get up onto the roof and there, just across this narrow gap, they see the rooftops of the town, stretching away in the moonlight...stretching away to freedom. Now, the first guy, he jumps right across with no problem. But his friend, his friend daren't make the leap.

  #v(0.5em)

  Y'see...y'see, he's afraid of falling. So then, the first guy has an idea...

  #v(0.5em)

  He says 'Hey! I have my flashlight with me! I'll shine it across the gap between the buildings. You can walk along the beam and join me!'

  #v(0.5em)

  B-but the second guy just shakes his head. He suh-says... he says

  #v(0.5em)
  'What do you think I am? Crazy? You'd turn it off when I was half way across!
]
//#show: appendix
#include "appendix.typ"
#bibliography("refs.bib")
