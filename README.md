# Bash

### 壳程序功能

提供用户操作系统的一个接口

### 操作方式

我们通过命令列模式来操作系统。

- 壳程序的很多命令，包括 man, chmod, chown, vi, fdisk, mkfs 等等，其实都是独立的应用程序；我们透过壳程序,也就是命令列模式，操作的其实是这些应用程序。

### ~/.bash_history 的写入问题

有时候我们会同时开好几个 bash 接口，这些 bash 在同时以 root 的身份登陆， 因此所有的 bash 都有自己的 1000 笔记录在内存中。因为等到注销时才会升级记录文件，所以最后注销的那个 bash 才会是最后写入的数据。

- 其实其它bash 的命令操作有被记录下来了，只是被后来的最后一个 bash 所覆盖升级了。

### 配置文件

shell 配置文件可以分为全体系统的配置文件以及用户个人偏好配置文件

一般来说，login shell 其实只会读取这两个配置文件

```
* /etc/profile
这是系统整体的配置，最好不要修改这个文件；

* ~/.bash_profile 或 ~/.bash_login 或 ~/.profile
属于使用者个人配置，你要改自己的数据，就写入这里！
```
#### 执行文件
- `/etc/profile`:此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.并从/etc/profile.d目录的配置文件中搜集shell的设置.


所以如果你有对/etc/profile有修改的话必须得重启你的修改才会生效，此修改对每个用户都生效。

- `/etc/bashrc`:为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取.

如果你想对所有的使用bash的用户修改某个配置并在以后打开的bash都生效的话可以修改这个文件，修改这个文件不用重启，重新打开一个bash即可生效。

- `~/.bash_profile`:每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件.

此文件类似于/etc/profile，也是需要需要重启才会生效，/etc/profile对所有用户生效，~/.bash_profile只对当前用户生效。

- `~/.bashrc`:该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该文件被读取.（每个用户都有一个.bashrc文件，在用户目录下）

此文件类似于/etc/bashrc，不需要重启生效，重新打开一个bash即可生效，  /etc/bashrc对所有用户新打开的bash都生效，但~/.bashrc只对当前用户新打开的bash生效。

- `~/.bash_logout`:当每次退出系统(退出bash shell)时,执行该文件. 

另外,`/etc/profile`中设定的变量(全局)的可以作用于任何用户,而`~/.bashrc`等中设定的变量(局部)只能继承`/etc/profile`中的变量,他们是"父子"关系.
 
`~/.bash_profile` 是交互式、login 方式进入bash 运行的；
`~/.bashrc` 是交互式 non-login 方式进入bash 运行的；
通常二者设置大致相同，前者会调用后者。


### 执行顺序

登录系统时要执行文件的过程如下：

- 在刚登录系统时，首先启动 `/etc/profile` 文件
- 然后再启动用户目录下的 `~/.bash_profile`、 `~/.bash_login`或 `~/.profile`文件中的其中一个
- 如果 `~/.bash_profile`文件存在的话，一般还会执行 `~/.bashrc`文件

因为在 `~/.bash_profile`文件中一般会有下面的代码：


>if [ -f ~/.bashrc ] ; then
>
> ./bashrc
> 
>fi

~/.bashrc中，一般还会有以下代码：
>if [ -f /etc/bashrc ] ; then
>
>. /bashrc
>
>fi

- 所以`~/.bashrc`会调用 `/etc/bashrc`文件
- 最后在退出 shell 时，还会执行 `~/.bash_logout`文件
