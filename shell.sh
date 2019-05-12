echo "print 'hello world' "

# 同一行显示
echo -n "the time and date are: "
date

echo home: $HOME
echo "home: $HOME"

echo "\$10"

# 数组
myarray=(one two three)

echo $myarray # one

echo ${myarray[2]} # three

echo ${myarray[*]} # one two three

# 修改数组某个值
myarray[2]=seven

# 删除数组某个值
unset myarray[1]
echo ${myarray[*]} # one three
echo myarray[1] # 

var1=test
echo "$var1"
var1=test1

# 命令替换 从命令输出中提取信息并赋值给变量
# 反引号 `
# $()
test1=`date`
test2=$(date)

# 数学运算
# expr
expr 1 + 5
expr 5 \* 2
# var3=$(expr $var1 \* $var2)

# $[ operation ]
var1=$[ 10 + 20 ]

# bc 
# variable=$(echo "options; expression" | bc)
var1=$(echo "scale=4; 10 / 3" | bc)
# var1=$(echo "scale=4; $num1 / $num2" | bc)

# num1=10
# num2=3

# var1=$(
#   bc << EOF
#   scale = 4
#   $num1 / $num2
#   EOF
# )

# echo $var1

# 结构化命令
# if-then

##############
if pwd
then
  echo "pwd: $(pwd)"
fi
##############
if pwd; then
  echo pwd:$(pwd)
fi
##############
if pwd; then
  echo pwd:$(pwd)
else
  echo "else commands"
fi
##############
if test $nullVar
then  
  echo true
else 
  echo false
fi
##############
if test $nullVar
then
	echo true
elif pwd
then
	echo "elif echo"
fi
##############
var1=10
if [ $var1 -eq 10 ]
then 
  echo 等于10
else
  echo 不等于10
fi
##############
var1=haha
var2=bhahah
if [ $var1 = $var2 ]
then
  echo 内容相同
elif [ -n $var1 ]
then
  echo 长度不为0
else 
  echo 条件不成立
fi
##############
varFilePath=./go1.go
varDirPath=./../blog
if [ -f $varFilePath ]; then
  echo "文件"
fi

if [ -f $varDirPath ]; then
  echo "${varDirPath}是文件"
elif [ -d $varDirPath ]; then
  echo "${varDirPath}是文件夹"
fi

##############

varCurentFilePath=./shell.sh
if [ -f $varCurentFilePath ] && [ -x $varCurentFilePath ]; then
  echo ${varCurentFilePath}文件可以执行
fi

##############

num1=10
num2=20

if (( $num1 * $num2 == 200 )); then
  echo 等于200
fi

##############

var1=jiangtao
if [[ $var1 == j* ]]; then
  echo 符合条件
else
  echo 不符合条件
fi

if test -z $var1; then
  echo "长度为0"
else 
  echo "长度非0"
fi

##############

var1=jiangtao

case $var1 in
jiang | jiangt)
  echo 1;;
jiangtao)
  echo 符合条件
  echo 2;;
*)
  echo 没找到;;
esac

##############

for v in hello world
do
  echo $v
done

##############
f=./go1.go
IFS=$'\n'
for val in $(cat $f)
do
  echo $val
done

##############

for file in ./*
do
  # 因为目录名或文件名中可能包含一些特殊字符，所以应该将$file变量用双引号圈起来
  echo "$file"
done

##############

# 多个目录通配符
for file in ./* ./../*
do
  # 因为目录名或文件名中可能包含一些特殊字符，所以应该将$file变量用双引号圈起来
  echo "$file"
done

############## 
# c风格for
for (( i=1; i <= 10; i++ ))
do
  echo $i
done

for (( i=1, l=10; i <= 10; i++,l-- ))
do
  echo $i...${l}
done

############## 
# var1=1
# while [ $var1 -ne 10 ]
# do
#   echo $var1.....
#   var1=$[ $var1 + 1 ]
# done

# 多个测试命令

# var1=1
# while echo $var1 
#   [ $var1 -ne 10 ]
# do
#   echo $var1.....
#   var1=$[ $var1 + 1 ]
# done

############## 

var1=1
until [ $var1 -eq 10 ]
do
 echo $var1
 var1=$[ $var1 + 1 ]
done

# 循环嵌套 shell 99乘法表
for (( x = 1; x <= 9; x++ ))
do
  for (( y = 1; y <= x; y++ ))
  do
    echo -n "$y * $x = $[ $x * $y ]     "
  done
  echo " "
done

############## 
var1=1
while [ $var1 -le 10 ]
do
  var1=$[ $var1 + 1 ]
  if [ $var1 -eq 3 ]; then
    # break;
    continue
  fi
  echo $var1...
done > outpu.txt

##############
# 查找可执行文件

IFS=:
for folder in $PATH
do
  echo $folder下的可执行文件
  for file in $folder/*
  do
    echo $file
  done
done > output.txt

##############
# 获取不包含路径的脚本名
name=$(basename $0)
echo 脚本名为$name

# 判断参数是否存在
echo $#个参数
if [ -n "$1" ]
then
  echo "继续执行"
else 
  echo "参数不正确"
fi

echo '$* $@ 使用'
var1=1
for param in $*
do
  echo $var1'->'$param
  var1=$[ $var1 + 1 ]
done

var1=1
for param in $@
do 
  echo $var1'->'$param
  var1=$[ $var1 + 1 ]
done

# 移动参数
# while [ -n "$1" ]
# do
#   echo 展示$1
#   shift
# done

##############
# echo 处理选项
# echo 处理简单选项
# while [ -n "$1" ]
# do 
#   case "$1" in
#     -a) echo '选项-a';;
#     -b) echo '选项-b';;
#     *) echo 未知选项$1;;
#   esac
#   shift
# done

# echo 分离参数和选项
# while [ -n "$1" ]
# do
#   case "$1" in 
#     -a) echo '选项-a';;
#     -b) echo '选项-b';;
#     --) shift
#       echo "跳出参数"
#       break;;
#     *) echo "未知选项$1";;
#   esac
#   shift
# done
# while [ -n "$1" ]
# do
#   echo 选项$1
#   shift
# done

# 处理带值得选项
# while [ -n "$1" ]
# do 
#   case "$1" in
#     -a) echo '选项-a';;
#     -b) 
#       echo "选项-b，值$2"
#       shift;;
#     *) echo 未知选项$1;;
#   esac
#   shift
# done

# 通过getopt处理参数
# echo 通过getopt处理参数
# echo $@
# eval set -- $(getopt ab:cd "$@")
# echo $@..$1
# while [ -n "$1" ]
# do
#   case "$1" in 
#   -a)
#     echo '-a选项';;
#   -b)
#     echo '-b选项'
#     echo '-b参数'$2
#     shift;;
#   -c)
#     echo '-c选项';;
#   --)
#     shift
#     break;;
#   *)
#     echo '未知'$1;
#   esac
#   shift
# done

# while [ -n "$1" ]
# do
#   echo 参数$1
#   shift
# done

# getopts
# while getopts :ab:cd opt
# do
#   case $opt in
#     a) echo '选项-a';;
#     b) 
#       echo '选项-b'
#       echo 参数$OPTARG;;
#     c) echo '选项-c';;
#     *) echo '未知选项';;
#   esac
# done

##############
# 获取用户输入
# read -p "请输入name:" name
# echo $name

# read -p "测试未指定变量情况："
# echo $REPLY

# if read -t 5; then
#   echo 输入内容$REPLY
# else 
#   echo 超时
# fi

# read -n1 -p '测试长度限制'
# read -s -p "测试不可见" val
# echo $val

# 从文件读取
# cat ./go1.go | while read line
# do 
#   echo $line
# done
# echo $line


# 重定向输入
# cat < ./go1.go

# 重定向输出
# cat ./go1 2> ./error
# 正常输出和错误输出分离
# cat ./go1.go ./go1 1> go2.go 2> error
# 错误和正常输出重定向到同一个位置
# cat ./go1.go ./go1 &> log

# cat ./go1.go 1> go2.go  >&2

# 永久重定向
# exec 1> log
# echo "hahah"
# echo "lalal"

# 重定向输入
# echo 重定向输入
# exec 0< ./go1.go
# while read line
# do 
#   echo $line
# done
# echo $line

# 自定义重定向
# exec 3>> log3

# echo "测试自定义重定向3" >&3
# echo "end"

# 恢复默认文件描述符
# 恢复默认输出
# 凡是发送到文件描述符3的输出都会输出到显示器
# exec 3>&1
# # 默认输出都在testlog文件里
# exec 1> testlog

# echo "这行文字应该在testlog里"
# # 意味所有输出到文件描述3 也就是显示器上
# exec 1>&3
# echo "这行文字应该在显示器上"

# 恢复默认输入
# 凡是读取输入的文件描述符3都通过键盘获取
# exec 3<&0
# exec 0< go1.go
# while read line
# do
#   echo $line
# done
# echo $line
# exec 0<&3
# read -p "输入:"

# 使用一个文件描述符对同一个文件进行读写
# exec 3<> testfile
# read line <&3
# echo "read: $line"
# echo "this is a test line" >&3

# 关闭文件描述符
# exec 3>&-

# 获取打开的文件描述符
# exec 3> testfile
# lsof -a -p $$ -d 0,1,2,3 >
# 阻止输出
# lsof -a -p $$ -d 0,1,2,3 > /dev/null

# 输出到多个文件描述符
# date | tee testfile

# IFS=','
# while read line file
# do 
#   echo $line-$file
# done < ${1}
# echo $line $file

##############
# 捕获信号
# count=0
# trap "echo 捕获到了" SIGINT
# while [ $count -ne 10 ]
# do
#   echo $count
#   count=$[ $count + 1 ]
#   sleep 1
# done

# 捕获退出
# count=0
# trap "echo 捕获到了" EXIT
# while [ $count -ne 10 ]
# do
#   echo $count
#   count=$[ $count + 1 ]
#   sleep 1
# done

##############

# count=0

# while [ $count -le 100 ]
# do
#   echo $count
#   sleep 10
#   count=$[ $count + 1 ]
# done

##############

func1() {
  echo 函数内输出
}

func1
echo 退出码：$?

# 函数输出

func2() {
  echo 返回字符串结果
}

result=$(func2)
echo result:$result

func3() {
  echo $[ $1 + $2 ]
}

result=$(func3 10 20)
echo "计算结果${result}"

gvar=10
func4() {
  gvar=$[ $gvar + 10 ]
  echo "改变了全局变量"
}

func4

echo $gvar

func5() {
  gvar=函数内声明
}
func5
echo $gvar
