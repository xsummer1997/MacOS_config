# Standard IO
# 文件IO —> 直接调用系统调用函数 —> 头文件是 <unistd.h>
## 		1. close
## 		2. open
## 		3. lseek
## 		4. write	|>无缓冲
## 		5. read		|>无缓冲

# 标准IO —> 间接调用系统调用函数 —> 头文件是 <stdio.h>
## 	1. FIFE \*fopen(const char \*path, const char \*mode)

### 	1, fopen 打开出错则返回一个NULL
		
### 	2, fopen 的第二个参数在使用时加“”,r表示只读，w表示先清除再写入，没有文件则创建一个新的文件，a表示在已有的文件里追加内容，没有则创建一个新的文件，+表示可读可写，b表示以二进制打开文件（Linux忽略该参数）
	
## 	2. 标准
### 	0 —> 标准输入 —> stdin —> 键盘
		
### 	1 —> 标准输出 —> stdout —> 屏幕
		
### 	2 —> 标准错误 —> stderr —> 屏幕
	
## 	3. 读写函数
### 	1. 行缓存 —> 遇到换行符（\n)  或者写满库缓存 才会调用系统调用函数	
			1. 读：fgets,gets,printf,fprintf,sprintf
			
			2. 写：fputs,puts,scanf
			
			3. 一个字符 读：fgetc,getc,getchar
			
			4. 一个字符 写：fputc,putc,putchar
		
#### 		1. fgets和fputs	
##### 			1. char \*fgets(char \*s（缓存，读到哪里去）,int size（读多少字节）,FILE \*		stream（从什么地方读）)若成功则返回s（缓存地址），若已经在文件尾端或出错则返回NULL
		
##### 			2. char \*fputs(char \*s（缓存，写什么内容），FILE \*stream（写到哪里）)	若成功则返回非负值，失败返回EOF-1
	   	
#### 		2. gets和puts
	   
##### 			1. char gets(char \*/buf) —> 	从标椎输入读入字符读到buf里，不将新行符存入缓存中，fgets会
	   			
##### 			2. int puts(const char \*s) —> 将要显示的内容显示到标椎输出，并添加一个新行符，fputs不会
                                                                      
#### 		3. int fgetc(FILE \*fp) ==> 返回值：正确为读取的字符，到文件结尾或出错时返回EOF。

#### 		4. int fputc(FILE \*fp) ==> 返回值：成功返回写入的字符，出错返回EOF。（EOF==-1）

#### 		5. int feof(FILE \*stream) ==> 返回值：到文件结束，返回非0，没有则返回0。

#### 		6. int ferror(FILE \*stream) ==> 返回值：是读写错误，返回非0，不是则返回0。 

#### 		7. int clearerr(FILE \*stream) ==> 清除流错误。
		
	   			
### 	2. 无缓存 —> 只要用户调用这个函数，就会将其中的内容写入到内核中
			
#### 		3. fprintf、printf、sprintf
	   
##### 			1. int fprintf（FILE \*stream，“字符串格式”）: 可以在文件和屏幕上输出

##### 			2. int printf: 只能在屏幕上输出
				
##### 			3. int sprintf（str\*,”字符串格式“）: 输出内容到一个字符串中
		
### 	3. 全缓存 —> 只有写满缓存再调用系统调用函数（返回值为实际读写单元数）
#### 		1. 读：fread ==> size_t fread(void \*ptr（读到哪里去）,size_t size（读的内容中，每个单元所占的字节数）,size_t nmemb（读的内容中，有多少个单元数）,FILE \*stream(从哪里读))

#### 		2. 写：fwrite ==> size_t fwrite(const void \*ptr（写的内容）,size_t size（写的内容中，每个单元所占的字节数）,size_t nmemb（写的内容中，有多少个单元数）,FILE \*stream（写到哪里去）)
					
### 	fflush(FILE \*fp) —> 强制将内容写到内核缓存
		
### 	fclose(FILE \*fp) —> fflush && 关闭文件
		
### 	fseek(FILE \*fp, offest,SEEK_SET/SEEK_END/SEEK_CUR)，成功返回0，失败返回-11
		
### 	rewind(FILE \*fp) <==> (void) fseek(fp,0,SEEK_SET)，成功无返回值
		
### 	ftell(FILE \*fp) <==> fseek(fp,0,SEEK_END) —> len=ftell(fp)—> 获取当前的文件长度。函数 		ftell() 用于得到文件位置指针当前位置相对于文件首的偏移字节数。成功返回。。。，出错返回-1L。
		
# 目录IO
##	opendir		==>		打开目录			==>		DIR \*opendir(const char \*pathname);
成功返回目录流指针，失败返回NULL

##	mkdir		==>		创建目录			==>		int mkdir(const char \*path,mode_t mode(该目录的访问权限))

##	readdir		==>		读目录			    ==>		struct dirent \*readdir(DIR \*dr);返回值：成功则返回struct dirent指针，若在目录为或出错则返回NULL。

##	rewinddir	==>		调整目录指针		==>		void rewinddir(DIR \*dr)

##	telldir		==>		调整目录指针		==>		DIR \*

##	seekdir		==>		调整目录指针		==>		DIR \*

##	closedir	==>		关闭目录			==>		closedir(DIR \*)


# #include <pthread.h>
int pthread_create(pthread_t \* thread, const pthread_arrt_t\* attr,void\*(\*start_routine)(void \*), void\* arg);

（1）thread参数是新线程的标识符,为一个整型。

（2）attr参数用于设置新线程的属性。给传递NULL表示设置为默认线程属性。

（3）start_routine和arg参数分别指定新线程将运行的函数和参数。start_routine返回时,这个线程就退出了

（4）返回值:成功返回0,失败返回错误号。


# 进程通信都是基于文件IO的原理
# open
# write
# read
# close

# 管道通信
## 1. 无名管道 ==> 在文件系统中无文件名 ==> 队列：出队（read），入队（write）

## 管道文件是一个特殊文件，是由队列来实现的
#### int pipe(int fd[2]) ==> 有两个文件描述符：fd[0]、fd[1],管道有一个读端fd[0]用来读和一个写端fd[1]用来写，规定不能变。返回值：成功返回0，出错返回-1。
#### 注意：
#####		1. 管道是创建在内存中的，进程结束，空间释放，管道就不存在了
#####		2. 管道中的东西，读完了就会删除
#####		3. 如果管道中没有东西刻度，则会读阻塞
#####		4. 如果写入的字节大于管道容量就会写阻塞

## 2. 有名管道 ==> 在文件系统中有文件名 ==> 管道文件
### int mkfifo(const char \*filename,mode_t mode(权限));创建成功返回0失败返回-1

### 当mkfifo创建管道文件时，并没有在内核空间创建一个管道，当用open打开管道文件时才会在内核空间创建一个管道

# 信号通信
		[屏幕快照 2019-09-28 15.10.48.png]
		
## 1. 信号的发送（发送信号进程）：kill、raise、alarm
###		int raise(int sig) ==>发信号给自己 <==> kill(getpid(),sig)
###		unsigned int alram(unsigned int seconds)	==>发送定时信号给当前进程 

## 2. 信号的接收（接受信号进程）：pause()、sleep()、while(1)
## 3. 信号的处理（接收信号进程）：signal
### void(\*singal(int signum,void(\*handler)(int)))(int);
### 第一个参数处理哪个信号，第二个参数是怎样处理信号
### 所需头文件 #include<stdio.h>
### 函数传入值：signum：制定信号
####			  handle：1.SIG_IGN:忽略该信号
####		              2.SIG_DFL:采用系统默认的方式处理信号
####					  3.自定义的信号处理函数指针（常用）
### 函数返回值	成功：设置之前的信号处理方式
####			失败：-1

## 4 waitpid()	wait()



## 指针函数 ==> 本质是一个函数，返回一个指针 int \*func()

## 函数指针 ==> 本质是一个指针，其指向一个函数 int (\*func)()

## 指针数组 ==> 本质是一个数组，里面的成员均为指针 void \*a[4]

## 数组指针 ==> 本质是一个指针，其指向是一个数组 int (\*a)[4]


#占用磁盘:
#	普通文件		==>		标识："r"		==>		创建："open"
#	目录文件		==>		标识："d"		==>		创建："mkdir"
#	链接文件		==>		标识："l"		==>		创建： "ln -s"
#只有inode号，不占磁盘块空间:
#	管道文件		==>		标识："p"		==>		创建："mkfifo"
#	字符设备文件	==>		标识："s"		==>		创建："mknod"
#	块设备文件	    ==>		标识："b"		==>		创建："mknod"
#	套接字		    ==>		标识："s"		==>		创建："socket"


# 标准IO - 错误信息处理

## extern int errno  //定义一个全局变量
## void perror(const char \*s)
## cahr \*strerror(int errno)
## errno 存放错误号
## perror 先输出字符串s,在输出错误号对应的错误信息
## strerror 根据错误号返回对应的错误信息






