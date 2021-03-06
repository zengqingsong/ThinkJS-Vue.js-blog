-- phpMyAdmin SQL Dump
-- version 4.7.0-beta1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-04-20 13:35:36
-- 服务器版本： 5.5.53-log
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `ls_comment`
--

CREATE TABLE `ls_comment` (
  `id` int(10) NOT NULL,
  `content_id` int(10) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(500) DEFAULT NULL,
  `text` text,
  `status` int(10) DEFAULT NULL,
  `parent_id` int(10) DEFAULT '0',
  `create_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ls_config`
--

CREATE TABLE `ls_config` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ls_config`
--

INSERT INTO `ls_config` (`id`, `name`, `value`) VALUES
(1, 'site', '{\"title\":\"xin\",\"url\":\"\",\"keywords\":\"333\",\"description\":\"333\"}'),
(2, 'email', '{\"secure\":1,\"user\":\"\",\"pass\":\"\",\"port\":\"465\",\"host\":\"qq\"}');

-- --------------------------------------------------------

--
-- 表的结构 `ls_content`
--

CREATE TABLE `ls_content` (
  `id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `uid` int(10) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `thumb` varchar(200) DEFAULT NULL,
  `category_id` int(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL,
  `description` text,
  `markdown` text,
  `content` text,
  `create_time` int(10) NOT NULL,
  `modify_time` int(10) NOT NULL,
  `view` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ls_content`
--

INSERT INTO `ls_content` (`id`, `title`, `uid`, `slug`, `thumb`, `category_id`, `status`, `type`, `description`, `markdown`, `content`, `create_time`, `modify_time`, `view`) VALUES
(1, '浅谈 js 变量作用域', 1, 'js-variables', NULL, 1, 99, 'post', '<p>关于 javascript 这门语言许多人都是从开始的时候觉得容易，后来觉得难，再后来又觉得容易的过程走过来的。最开始的时候觉得简单，是因为没有重视，没有把它当作一门语言来来认真对待，总是以自己学习其他语言的“经验”来使用它。在使用中会遇到各种问题，比如 javascript特有的变量作用域和异步问题，这时候会觉得它其实也很难。但是如果真正理解了变量作用域和异步，其实也不是很难。只是写法的区别。</p>\n', '关于 javascript 这门语言许多人都是从开始的时候觉得容易，后来觉得难，再后来又觉得容易的过程走过来的。最开始的时候觉得简单，是因为没有重视，没有把它当作一门语言来来认真对待，总是以自己学习其他语言的“经验”来使用它。在使用中会遇到各种问题，比如 javascript特有的变量作用域和异步问题，这时候会觉得它其实也很难。但是如果真正理解了变量作用域和异步，其实也不是很难。只是写法的区别。\n<!--more-->\n无意间看到一套前端面试题，作为后端汪，也只能看看其中的 js 部分，见到一道 js 笔试题特别不错，特尝试解答一下。\n\n原题：\n```javascript\n\n    var a, b = 0, fn = function(){\n            var a = b = 2;\n        };\n        fn();\n        console.log(a, b);\n```\n\n看上去很简单的一道题，细细分析一下却发现这题出的真妙。咱们一行一行分析\n\n第一行声明了a,b,fn，此时a声明但未赋值，故a=undefined,b=0,fn为一个函数。\n\n第四行执行fn函数。\n\n在fn函数内部 var a=b=2;    这里才是真正的重点，var a重新使用 var 对 a做了覆盖声明，并把 b 的值赋给它。后面 b =2。这里 b 并没有使用 var 声明。事实上这一行是创建了一个函数内部的变量 a，和对全局变量 b 进行赋值。所以虽然这里 a 也被赋值了，但此时它是个函数内部的变量，外部无法访问。\n\n第五行，输出全局变量a和b，所以此时a=undefined，b=2；\n\n我们再来转换一种写法。\n```javascript\nvar a, b = 0, fn = function(){\n		var b=1;\n        a = b = 2;\n        console.log(a, b);\n    };\n    fn();\n    console.log(a, b);\n```\n\n和上面一样，第一行对三个变量声明。\n\n此时第四行输出a和b时都是函数内部的变量，a和b都是2\n\n最后一行输出的时候全局变量a是，在函数内部被赋值，所以是2。全局变量b在第一行被复制0，但是在函数内部第三行被var 重新声明为函数内部的变量，虽然被赋值为1，虽然下一行被赋值为2，但是事实上和全部变量b是没有关系的。所以此时b为0', '<p>关于 javascript 这门语言许多人都是从开始的时候觉得容易，后来觉得难，再后来又觉得容易的过程走过来的。最开始的时候觉得简单，是因为没有重视，没有把它当作一门语言来来认真对待，总是以自己学习其他语言的“经验”来使用它。在使用中会遇到各种问题，比如 javascript特有的变量作用域和异步问题，这时候会觉得它其实也很难。但是如果真正理解了变量作用域和异步，其实也不是很难。只是写法的区别。</p>\n<!--more-->\n<p>无意间看到一套前端面试题，作为后端汪，也只能看看其中的 js 部分，见到一道 js 笔试题特别不错，特尝试解答一下。</p>\n<p>原题：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">\n    <span class=\"hljs-keyword\">var</span> a, b = <span class=\"hljs-number\">0</span>, fn = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\"></span>)</span>{\n            <span class=\"hljs-keyword\">var</span> a = b = <span class=\"hljs-number\">2</span>;\n        };\n        fn();\n        <span class=\"hljs-built_in\">console</span>.log(a, b);\n</code></div></pre>\n<p>看上去很简单的一道题，细细分析一下却发现这题出的真妙。咱们一行一行分析</p>\n<p>第一行声明了a,b,fn，此时a声明但未赋值，故a=undefined,b=0,fn为一个函数。</p>\n<p>第四行执行fn函数。</p>\n<p>在fn函数内部 var a=b=2;    这里才是真正的重点，var a重新使用 var 对 a做了覆盖声明，并把 b 的值赋给它。后面 b =2。这里 b 并没有使用 var 声明。事实上这一行是创建了一个函数内部的变量 a，和对全局变量 b 进行赋值。所以虽然这里 a 也被赋值了，但此时它是个函数内部的变量，外部无法访问。</p>\n<p>第五行，输出全局变量a和b，所以此时a=undefined，b=2；</p>\n<p>我们再来转换一种写法。</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">var</span> a, b = <span class=\"hljs-number\">0</span>, fn = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\"></span>)</span>{\n		<span class=\"hljs-keyword\">var</span> b=<span class=\"hljs-number\">1</span>;\n        a = b = <span class=\"hljs-number\">2</span>;\n        <span class=\"hljs-built_in\">console</span>.log(a, b);\n    };\n    fn();\n    <span class=\"hljs-built_in\">console</span>.log(a, b);\n</code></div></pre>\n<p>和上面一样，第一行对三个变量声明。</p>\n<p>此时第四行输出a和b时都是函数内部的变量，a和b都是2</p>\n<p>最后一行输出的时候全局变量a是，在函数内部被赋值，所以是2。全局变量b在第一行被复制0，但是在函数内部第三行被var 重新声明为函数内部的变量，虽然被赋值为1，虽然下一行被赋值为2，但是事实上和全部变量b是没有关系的。所以此时b为0</p>\n', 1463760000, 1521712656, 0),
(3, 'DVI 接口的类别区分', 1, 'dvi', NULL, 1, 99, 'post', '<p>这台电脑的时候其实是准备写代码来的，所以没有装显卡。然而代码没写多少又想打游戏了 ，于是去卡吧收了个二手显卡，于是开始了“装卡之旅”。</p>\n', ' 这台电脑的时候其实是准备写代码来的，所以没有装显卡。然而代码没写多少又想打游戏了 ，于是去卡吧收了个二手显卡，于是开始了“装卡之旅”。\n<!--more-->\n显卡收到之后发现只有两个接口和显示器上的接口不一样。于是赶紧请教了一下度娘。发现显卡上是两个DVI接口，也就是所谓的高清接口。而我的杂牌显示器上是VGA接口。如图下示例。\n![b6JFjm6.jpg!web.jpg][1]\n这三个接口应该算是最常见的三种接口.\n\n左边是HDMI接口:高清晰度多媒体接口（英文：High Definition Multimedia Interface，HDMI）是一种数字化视频/音频接口技术，是适合影像传输的专用型数字化接口，其可同时传送音频和影像信号，最高数据传输速度为4.5GB/s\n\n中间的是VGA接口：VGA（Video Graphics Array）视频图形阵列是IBM于1987年提出的一个使用模拟信号的电脑显示标准。VGA接口即电脑采用VGA标准输出数据的专用接口。接收图形信号。\n\n右边的是DVI接口：由1998年9月，在Intel开发者论坛上成立的数字显示工作小组（Digital Display Working Group简称DDWG）发明的一种高速传输数字信号的技术，有 DVI-A、DVI-D 和 DVI-I 三种不同的接口形式。 DVI-D 只有数字接口，DVI-I 有数字和模拟接口，目前应用主要以 DVI-i(24+5) 为主。接收数字信号。\n\n百度之后看了一下发现显卡是 DVI 接口，而显示器是 VGA 接口的，而且对比了一下主板上的 DVI 接口发现显卡的上的 DVI 接口和主板上的 DVI 接口竟然还不太一样。继续百度。\n\n![QFJRFrr.jpg!web.jpg][2]\n竟然有五种类型的接口，按照针数的不同分为\n\n    12+5\n    18+1\n    18+5\n    24+1\n    24+5\n\n其中12+5的是 DVI-A 接口，就是与 VGA 规范一样的 包括 RGBHV 信号线的模拟接口。\n\n18+1和24+1的是 DVI-D 接口，传输的为数字信号。\n\n18+5和24+5的是 DVI-I 接口，则可以传输数字信号，也可以模拟图形信号。\n\n也就是说， xx+5的 DVI-I 接口通过转换头或者线可以连接到VGA设备上使用，也可以连接到任意DVI设备上使用，但是xx+1的 DVI-D 接口是不能连接到 VGA 设备上使用的。 现在市场上以 DVI-I 接口居多。\n\n前面的XX则是传输速率，18为单通道，传输速率只有24针的一半，为165MHz。在画面显示上，单通道的DVI支持的分辨率和双通道的完全一样，但刷新率却只有双通道的一半左右，会造成显示质量的下降。一般来讲，单通道的DVI接口，最大的刷新率只能支持到1920 1080 60hz或1600 1200 60hz，即现有23寸宽屏显示器和20寸普通比例显示器的正常显示，再高的话就会造成显示效果的下降。 大屏幕的话需要使用24针的接口，小屏幕使用18针的接口也可以正常显示。\n\n也就是说我需要一个 24+5 转 VGA 的转接头，下楼买完装上，开机，成功点亮！\n\n\n  [1]: http://lscho.com/usr/uploads/2017/03/3548923097.jpg\n  [2]: http://lscho.com/usr/uploads/2017/03/3296033423.jpg', '<p>这台电脑的时候其实是准备写代码来的，所以没有装显卡。然而代码没写多少又想打游戏了 ，于是去卡吧收了个二手显卡，于是开始了“装卡之旅”。</p>\n<!--more-->\n<p>显卡收到之后发现只有两个接口和显示器上的接口不一样。于是赶紧请教了一下度娘。发现显卡上是两个DVI接口，也就是所谓的高清接口。而我的杂牌显示器上是VGA接口。如图下示例。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/3548923097.jpg\" alt=\"b6JFjm6.jpg!web.jpg\" /><br />\n这三个接口应该算是最常见的三种接口.</p>\n<p>左边是HDMI接口:高清晰度多媒体接口（英文：High Definition Multimedia Interface，HDMI）是一种数字化视频/音频接口技术，是适合影像传输的专用型数字化接口，其可同时传送音频和影像信号，最高数据传输速度为4.5GB/s</p>\n<p>中间的是VGA接口：VGA（Video Graphics Array）视频图形阵列是IBM于1987年提出的一个使用模拟信号的电脑显示标准。VGA接口即电脑采用VGA标准输出数据的专用接口。接收图形信号。</p>\n<p>右边的是DVI接口：由1998年9月，在Intel开发者论坛上成立的数字显示工作小组（Digital Display Working Group简称DDWG）发明的一种高速传输数字信号的技术，有 DVI-A、DVI-D 和 DVI-I 三种不同的接口形式。 DVI-D 只有数字接口，DVI-I 有数字和模拟接口，目前应用主要以 DVI-i(24+5) 为主。接收数字信号。</p>\n<p>百度之后看了一下发现显卡是 DVI 接口，而显示器是 VGA 接口的，而且对比了一下主板上的 DVI 接口发现显卡的上的 DVI 接口和主板上的 DVI 接口竟然还不太一样。继续百度。</p>\n<p><img src=\"http://lscho.com/usr/uploads/2017/03/3296033423.jpg\" alt=\"QFJRFrr.jpg!web.jpg\" /><br />\n竟然有五种类型的接口，按照针数的不同分为</p>\n<pre><code>12+5\n18+1\n18+5\n24+1\n24+5\n</code></pre>\n<p>其中12+5的是 DVI-A 接口，就是与 VGA 规范一样的 包括 RGBHV 信号线的模拟接口。</p>\n<p>18+1和24+1的是 DVI-D 接口，传输的为数字信号。</p>\n<p>18+5和24+5的是 DVI-I 接口，则可以传输数字信号，也可以模拟图形信号。</p>\n<p>也就是说， xx+5的 DVI-I 接口通过转换头或者线可以连接到VGA设备上使用，也可以连接到任意DVI设备上使用，但是xx+1的 DVI-D 接口是不能连接到 VGA 设备上使用的。 现在市场上以 DVI-I 接口居多。</p>\n<p>前面的XX则是传输速率，18为单通道，传输速率只有24针的一半，为165MHz。在画面显示上，单通道的DVI支持的分辨率和双通道的完全一样，但刷新率却只有双通道的一半左右，会造成显示质量的下降。一般来讲，单通道的DVI接口，最大的刷新率只能支持到1920 1080 60hz或1600 1200 60hz，即现有23寸宽屏显示器和20寸普通比例显示器的正常显示，再高的话就会造成显示效果的下降。 大屏幕的话需要使用24针的接口，小屏幕使用18针的接口也可以正常显示。</p>\n<p>也就是说我需要一个 24+5 转 VGA 的转接头，下楼买完装上，开机，成功点亮！</p>\n', 1465315200, 1521712701, 0),
(4, '一个漏洞的发现过程', 1, 'ly-bug', NULL, 1, 99, 'post', '<p>无意间发现的一个漏洞。本想提交乌云，结果一看活动时间，今天晚上就要结束了，遂作罢。整个过程都抱着学习的态度记录了一下，整理成文，以记之。</p>\n', '无意间发现的一个漏洞。本想提交乌云，结果一看活动时间，今天晚上就要结束了，遂作罢。整个过程都抱着学习的态度记录了一下，整理成文，以记之。\n<!--more-->\n在12306研究研究咋买票，点了图片验证点了几十次都没登录成功。尼玛，那8*8像素的图片你让我咋识别。先刷个朋友圈放松一下。现在这朋友圈真是不行了，都是面膜。翻翻翻，戳我免单？这是什么玩意？原来是一个APP的活动，正好我手机上装的有这个玩意。点开火车票栏目，还真有个免单的玩意。唔，先看一下规则。\n![fmYbErm.jpg!web.jpg][1]\n我默默的数了数自己微信好友。。。这活动太不靠谱了。\n\n买买买，买了两张高铁票。买完又弹一个烦人的页面让我找人帮忙免单。尼玛，我去哪找那么多人帮我。随手给基友的微信分享了一个，骚扰骚扰他。然后顺手点进免单看了一下。这页面简直不忍直视，估计哪个程序员通宵赶工出来。整页的图片背景，图片按钮。好吧，我准备看一下它的代码写的烂不烂。把链接复制到电脑上。页面down下来看一下。\n\njs代码写的不错，暗赞了一句。开始找提交的按钮触发的事件。\n![za6fayu.png!web.png][2]\n\n然而菜鸡表示压力山大，没看懂。还是分析请求吧。模拟器开启，抓包工具开启。\n![6zaeqmi.jpg!web.jpg][3]\n\n看了一圈，这个请求比较可疑。拿出来分析一下。先照葫芦画瓢模拟一下请求。\n![VVnYzaA.jpg!web.jpg][4]\n毫无疑问，肯定会有限制，提示非法用户。由于是get请求，也不可能做特别复杂验证。并且这个活动是微信内部页面，大多数程序员都会或多或少的对安全验证方面不自觉的忽略（ 比如我，顺便鄙视一下居然用jsonp做跨域）。所以最用可能的还是在header中的几个参数。，加了cookie，没反应。加了X-Requested-With，没反应。加了Referer，我擦？竟然有反应了。\n![jIbEfuU.jpg!web.jpg][5]\n看到这个提示，觉得有戏。微信里用什么识别身份的？openid啊！找了找get的参数。果然有一个openid。随便改了一个字母。\n![uy2UNrB.png!web.png][6]\n执行成功，回头刷新了一下那个页面，over\n![Iz6N7rf.png!web.png][7]\n出现bug原因就是这一步没有验证openid的有效性。但即使验证了openid有效性，还是会出现问题。无非多收集几个有效的openid。其实最重要的还是在程序设计中对安全性的轻视。以为这个请求是在APP执行的，以为这个页面是在微信中打开的。如果放到电脑端，估计没有任何程序员会这样写一个活动页面，更别提这个大的一个公司的活动和产品。\n\n\n  [1]: http://lscho.com/usr/uploads/2017/03/1159021702.jpg\n  [2]: http://lscho.com/usr/uploads/2017/03/2954890667.png\n  [3]: http://lscho.com/usr/uploads/2017/03/634225941.jpg\n  [4]: http://lscho.com/usr/uploads/2017/03/2060227312.jpg\n  [5]: http://lscho.com/usr/uploads/2017/03/1783569698.jpg\n  [6]: http://lscho.com/usr/uploads/2017/03/1357037553.png\n  [7]: http://lscho.com/usr/uploads/2017/03/1309942170.png', '<p>无意间发现的一个漏洞。本想提交乌云，结果一看活动时间，今天晚上就要结束了，遂作罢。整个过程都抱着学习的态度记录了一下，整理成文，以记之。</p>\n<!--more-->\n<p>在12306研究研究咋买票，点了图片验证点了几十次都没登录成功。尼玛，那8*8像素的图片你让我咋识别。先刷个朋友圈放松一下。现在这朋友圈真是不行了，都是面膜。翻翻翻，戳我免单？这是什么玩意？原来是一个APP的活动，正好我手机上装的有这个玩意。点开火车票栏目，还真有个免单的玩意。唔，先看一下规则。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/1159021702.jpg\" alt=\"fmYbErm.jpg!web.jpg\" /><br />\n我默默的数了数自己微信好友。。。这活动太不靠谱了。</p>\n<p>买买买，买了两张高铁票。买完又弹一个烦人的页面让我找人帮忙免单。尼玛，我去哪找那么多人帮我。随手给基友的微信分享了一个，骚扰骚扰他。然后顺手点进免单看了一下。这页面简直不忍直视，估计哪个程序员通宵赶工出来。整页的图片背景，图片按钮。好吧，我准备看一下它的代码写的烂不烂。把链接复制到电脑上。页面down下来看一下。</p>\n<p>js代码写的不错，暗赞了一句。开始找提交的按钮触发的事件。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/2954890667.png\" alt=\"za6fayu.png!web.png\" /></p>\n<p>然而菜鸡表示压力山大，没看懂。还是分析请求吧。模拟器开启，抓包工具开启。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/634225941.jpg\" alt=\"6zaeqmi.jpg!web.jpg\" /></p>\n<p>看了一圈，这个请求比较可疑。拿出来分析一下。先照葫芦画瓢模拟一下请求。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/2060227312.jpg\" alt=\"VVnYzaA.jpg!web.jpg\" /><br />\n毫无疑问，肯定会有限制，提示非法用户。由于是get请求，也不可能做特别复杂验证。并且这个活动是微信内部页面，大多数程序员都会或多或少的对安全验证方面不自觉的忽略（ 比如我，顺便鄙视一下居然用jsonp做跨域）。所以最用可能的还是在header中的几个参数。，加了cookie，没反应。加了X-Requested-With，没反应。加了Referer，我擦？竟然有反应了。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/1783569698.jpg\" alt=\"jIbEfuU.jpg!web.jpg\" /><br />\n看到这个提示，觉得有戏。微信里用什么识别身份的？openid啊！找了找get的参数。果然有一个openid。随便改了一个字母。<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/1357037553.png\" alt=\"uy2UNrB.png!web.png\" /><br />\n执行成功，回头刷新了一下那个页面，over<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/1309942170.png\" alt=\"Iz6N7rf.png!web.png\" /><br />\n出现bug原因就是这一步没有验证openid的有效性。但即使验证了openid有效性，还是会出现问题。无非多收集几个有效的openid。其实最重要的还是在程序设计中对安全性的轻视。以为这个请求是在APP执行的，以为这个页面是在微信中打开的。如果放到电脑端，估计没有任何程序员会这样写一个活动页面，更别提这个大的一个公司的活动和产品。</p>\n', 1465660800, 1521712711, 0),
(5, 'PHP 程序设计之工厂模式的实现 ', 1, 'factory-html', NULL, 2, 99, 'post', '<p>什么是工厂模式？</p>\n<p>由工厂类根据参数来决定创建出哪一种产品类的实例；</p>\n<p>工厂类是指包含了一个专门用来创建其他对象的方法的类。 所谓按需分配，传入参数进行选择，返回具体的类。 工厂模式的最主要作用就是对象创建的封装、简化创建对象操作。</p>\n<p>简单的说，就是调用工厂类的一个方法（传入参数）来得到需要的类；</p>\n', '\n什么是工厂模式？\n\n由工厂类根据参数来决定创建出哪一种产品类的实例；\n\n工厂类是指包含了一个专门用来创建其他对象的方法的类。 所谓按需分配，传入参数进行选择，返回具体的类。 工厂模式的最主要作用就是对象创建的封装、简化创建对象操作。  \n\n简单的说，就是调用工厂类的一个方法（传入参数）来得到需要的类；\n<!--more-->\n工厂模式有什么用？\n\n通常我们在使用类的时候都是直接new出来一个直接使用。但是随着程序的开发，和项目的迁移修改，逐渐会产生许多问题。比如说过于依赖程序中的某个类，或者某个代码片段。类太多，不知道如何正确的管理这些类库。不知道如何正确的处理后续的迭代。这时候就需要使用工厂模式了。\n\n实例场景\n\n程序中用的是sql扩展链接数据库，更换了环境，需要使用pdo链接数据库。怎么办？难道在把每个数据库类实例全部修改一下？\n\n原来一些配置是从文件中读取的，但是现在把配置改为数据库存储的。怎么办？全部修改？\n\n如果一开始就是用工厂模式就不会出现这个问题了。\n\n简单实例\n```php\n    class MyObject{\n      //对象将从工厂返回\n    }\n    class MyFactory{\n    public static function factory(){\n    return new MyObject():\n       }\n    }\n    $instance=MyFactory::factory();\n```\n会员抽象工厂模式实例\n```php\n//定义一个用户抽象类\n	abstract class member{\n		protected $name;\n		protected $password;\n		public function __construct($name,$password){\n			$this->name=$name;\n			$this->password=$password;\n		 }		\n		//抽象方法\n		abstract protected function getResult();\n	}\n	//继承抽象类时必须实现其抽象方法且该方法的可见性大于等于抽象类的抽象方法\n	class user extends member{\n		public function getResult(){\n			echo \'name:\'.$this->name.\';password:\'.$this->password.\';type:user<br>\';\n		}\n		public function add($dosomething){\n			echo \'user:\'.$this->name.\'add \'.$dosomething.\'<br>\';\n		}		\n	}\n	class admin extends member{\n		public function getResult(){\n			echo \'name:\'.$this->name.\';password:\'.$this->password.\';type:admin<br>\';\n		}\n		public function add($dosomething){\n			echo \'admin:\'.$this->name.\'add \'.$dosomething.\'<br>\';\n		}\n	}\n	//定义一个工厂类\n	class Factory{\n		//保存实例\n		private static $obj;\n		public static function CreateOperation($type,$name,$password){\n			//返回不同的对象\n			self::$obj=new $type($name,$password);\n			return self::$obj;\n		}\n	}\n	//使用\n	$obj=Factory::CreateOperation(\"admin\",\"id\",\"pass\");\n	$obj->getResult();\n	$obj->add(\"66666\");\n\n	$obj=Factory::CreateOperation(\"user\",\"id\",\"pass\");\n	$obj->getResult();\n	$obj->add(\"66666\");\n```', '<p>什么是工厂模式？</p>\n<p>由工厂类根据参数来决定创建出哪一种产品类的实例；</p>\n<p>工厂类是指包含了一个专门用来创建其他对象的方法的类。 所谓按需分配，传入参数进行选择，返回具体的类。 工厂模式的最主要作用就是对象创建的封装、简化创建对象操作。</p>\n<p>简单的说，就是调用工厂类的一个方法（传入参数）来得到需要的类；</p>\n<!--more-->\n<p>工厂模式有什么用？</p>\n<p>通常我们在使用类的时候都是直接new出来一个直接使用。但是随着程序的开发，和项目的迁移修改，逐渐会产生许多问题。比如说过于依赖程序中的某个类，或者某个代码片段。类太多，不知道如何正确的管理这些类库。不知道如何正确的处理后续的迭代。这时候就需要使用工厂模式了。</p>\n<p>实例场景</p>\n<p>程序中用的是sql扩展链接数据库，更换了环境，需要使用pdo链接数据库。怎么办？难道在把每个数据库类实例全部修改一下？</p>\n<p>原来一些配置是从文件中读取的，但是现在把配置改为数据库存储的。怎么办？全部修改？</p>\n<p>如果一开始就是用工厂模式就不会出现这个问题了。</p>\n<p>简单实例</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\">    <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">MyObject</span></span>{\n      <span class=\"hljs-comment\">//对象将从工厂返回</span>\n    }\n    <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">MyFactory</span></span>{\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">factory</span><span class=\"hljs-params\">()</span></span>{\n    <span class=\"hljs-keyword\">return</span> <span class=\"hljs-keyword\">new</span> MyObject():\n       }\n    }\n    $instance=MyFactory::factory();\n</code></div></pre>\n<p>会员抽象工厂模式实例</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-comment\">//定义一个用户抽象类</span>\n	<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">member</span></span>{\n		<span class=\"hljs-keyword\">protected</span> $name;\n		<span class=\"hljs-keyword\">protected</span> $password;\n		<span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">__construct</span><span class=\"hljs-params\">($name,$password)</span></span>{\n			<span class=\"hljs-keyword\">$this</span>-&gt;name=$name;\n			<span class=\"hljs-keyword\">$this</span>-&gt;password=$password;\n		 }		\n		<span class=\"hljs-comment\">//抽象方法</span>\n		<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-keyword\">protected</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">getResult</span><span class=\"hljs-params\">()</span></span>;\n	}\n	<span class=\"hljs-comment\">//继承抽象类时必须实现其抽象方法且该方法的可见性大于等于抽象类的抽象方法</span>\n	<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">user</span> <span class=\"hljs-keyword\">extends</span> <span class=\"hljs-title\">member</span></span>{\n		<span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">getResult</span><span class=\"hljs-params\">()</span></span>{\n			<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\'name:\'</span>.<span class=\"hljs-keyword\">$this</span>-&gt;name.<span class=\"hljs-string\">\';password:\'</span>.<span class=\"hljs-keyword\">$this</span>-&gt;password.<span class=\"hljs-string\">\';type:user&lt;br&gt;\'</span>;\n		}\n		<span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">add</span><span class=\"hljs-params\">($dosomething)</span></span>{\n			<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\'user:\'</span>.<span class=\"hljs-keyword\">$this</span>-&gt;name.<span class=\"hljs-string\">\'add \'</span>.$dosomething.<span class=\"hljs-string\">\'&lt;br&gt;\'</span>;\n		}		\n	}\n	<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">admin</span> <span class=\"hljs-keyword\">extends</span> <span class=\"hljs-title\">member</span></span>{\n		<span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">getResult</span><span class=\"hljs-params\">()</span></span>{\n			<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\'name:\'</span>.<span class=\"hljs-keyword\">$this</span>-&gt;name.<span class=\"hljs-string\">\';password:\'</span>.<span class=\"hljs-keyword\">$this</span>-&gt;password.<span class=\"hljs-string\">\';type:admin&lt;br&gt;\'</span>;\n		}\n		<span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">add</span><span class=\"hljs-params\">($dosomething)</span></span>{\n			<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\'admin:\'</span>.<span class=\"hljs-keyword\">$this</span>-&gt;name.<span class=\"hljs-string\">\'add \'</span>.$dosomething.<span class=\"hljs-string\">\'&lt;br&gt;\'</span>;\n		}\n	}\n	<span class=\"hljs-comment\">//定义一个工厂类</span>\n	<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Factory</span></span>{\n		<span class=\"hljs-comment\">//保存实例</span>\n		<span class=\"hljs-keyword\">private</span> <span class=\"hljs-keyword\">static</span> $obj;\n		<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">CreateOperation</span><span class=\"hljs-params\">($type,$name,$password)</span></span>{\n			<span class=\"hljs-comment\">//返回不同的对象</span>\n			<span class=\"hljs-keyword\">self</span>::$obj=<span class=\"hljs-keyword\">new</span> $type($name,$password);\n			<span class=\"hljs-keyword\">return</span> <span class=\"hljs-keyword\">self</span>::$obj;\n		}\n	}\n	<span class=\"hljs-comment\">//使用</span>\n	$obj=Factory::CreateOperation(<span class=\"hljs-string\">\"admin\"</span>,<span class=\"hljs-string\">\"id\"</span>,<span class=\"hljs-string\">\"pass\"</span>);\n	$obj-&gt;getResult();\n	$obj-&gt;add(<span class=\"hljs-string\">\"66666\"</span>);\n\n	$obj=Factory::CreateOperation(<span class=\"hljs-string\">\"user\"</span>,<span class=\"hljs-string\">\"id\"</span>,<span class=\"hljs-string\">\"pass\"</span>);\n	$obj-&gt;getResult();\n	$obj-&gt;add(<span class=\"hljs-string\">\"66666\"</span>);\n</code></div></pre>\n', 1466352000, 1521712719, 0),
(6, 'PHP 程序设计之观察者模式的实现', 1, 'observer', NULL, 1, 99, 'post', '<p>什么是观察者模式？</p>\n<p>一个对象通过添加一个方法（该方法允许另一个对象，即观察者 注册自己）使本身变得可观察。当可观察的对象更改时，它会将消息发送到已注册的观察者。这些 观察者使用该信息执行的操作与可观察的对象无关。结果是对象可以相互对话，而不必了解原因。观察者模式是一种事件系统，意味着这一模式允许某个类观察另一 个类的状态，当被观察的类状态发生改变的时候，观察类可以收到通知并且做出相应的动作;观察者模式为您提供了避免组件之间紧密耦。</p>\n', '\n什么是观察者模式？\n\n一个对象通过添加一个方法（该方法允许另一个对象，即观察者 注册自己）使本身变得可观察。当可观察的对象更改时，它会将消息发送到已注册的观察者。这些 观察者使用该信息执行的操作与可观察的对象无关。结果是对象可以相互对话，而不必了解原因。观察者模式是一种事件系统，意味着这一模式允许某个类观察另一 个类的状态，当被观察的类状态发生改变的时候，观察类可以收到通知并且做出相应的动作;观察者模式为您提供了避免组件之间紧密耦。\n<!--more-->\n观察者模式有什么用？\n\n上面的一段文字可能说的太过书面化，但是任何设计模式都是脱胎于实际的场景中，只要理解什么情况下需要用这种模式，基本就理解这种模式是干什么用的。比如用户登录这一行为，可能会产生积分赠送、登录日志写入、通知好友等等一系列操作。但是积分和日志以及通知模块通常是独立的。是否启用登录送积分，登录日志是否写入，通知哪些好友又是需要管理员可控的。并且要考虑后续程序功能模块的删改，所以按照正常类继承写法无疑对后续开发产生许多不可控的影响。于是，这时候就需要使用观察者模式。许多开源程序的插件机制，主题机制都是基于这种模式。\n\n观察者模式要怎么实现？\n\n既然是观察者模式，肯定有观察者和被观察者。首先我们把他们抽象出来。然后根据上面提出的问题，针对用户登录这一行为，实现观察者模式。\n```php\n//抽象一个被观察者，并指定必要的抽象方法\n	abstract class observed{\n		//添加观察者,限制参数\n		abstract public function attach(observer $observer,$type);\n		//删除观察者\n		abstract public function detach(observer $observer,$type);\n		//通知\n		abstract public function notify($type);		\n	}\n	//抽象一个观察者，并指定抽象方法\n	abstract class observer{\n		abstract public function update(observed $observed,$type);\n	}\n```\n然后我们分别实例化一个被观察者和两个观察者，并实现其方法\n```php\n//实例化一个被观察者对象,并实现抽象方法\n	class user extends observed{\n	    CONST OBSERVER_TYPE_REGISTER = 1;//注册\n	    CONST OBSERVER_TYPE_LOGIN = 2;//登录	\n		//保存观察者\n		private $observers;\n		public $name;\n		//注意，实现抽象方法时可见性只能大于或者等于抽象方法\n		function attach(observer $observer,$type){\n			$this->observers[$type][] = $observer;\n		}\n		function detach(observer $observer,$type){\n			if($idx = array_search($observer, $this->observers[$type], true)){\n				unset($this->observers[$type][$idx]);\n			}\n		}\n		//满足条件则通知观察者\n		function notify($type){\n			if(!empty($this->observers[$type])){\n				foreach($this->observers[$type] as $observer){\n				    $observer->update($this,$type);\n				}				\n			}\n		}\n		//模拟登录方法\n		function login($name){\n			$this->name=$name;\n			//添加观察者[技巧：如果使用插件，则循环添加当前开启的插件即可]\n			$point=new point();\n			$this->attach($point,self::OBSERVER_TYPE_REGISTER);\n			$log=new log();\n			$this->attach($log,self::OBSERVER_TYPE_REGISTER);\n			//通知观察者\n			$this->notify(self::OBSERVER_TYPE_REGISTER);\n		}\n	}\n	//实例化观察者[积分]\n	class point extends observer{\n	    public function update(observed $observed,$type){\n	    	if($type==1){	//登录处理\n				echo \'login:add point \'.$observed->name.\'<br>\';\n	    	}\n	    }		\n	}\n	//实例化观察者[日志]\n	class log extends observer{\n	    public function update(observed $observed,$type){\n	    	if($type==1){	//登录处理\n				echo \'log:write log for \'.$observed->name.\'<br>\';\n	    	}\n	    }		\n	}\n\n在user中我们多增加了一个login方法来模拟登录这一行为。\n\n//模拟登录\n	$user=new user();\n	$user->login(\'name\');\n```\n执行之后我们会看到结果\n\nlogin:add point name\nlog:write log for name\n\n看到这里可能大家就明白了。观察者模式就是一个事件系统，一个对象去观察另一个对象的行为，并做出相应的处理。来避免各功能块之间的耦合，实现“低耦合”、“高聚合”这一概念\n', '<p>什么是观察者模式？</p>\n<p>一个对象通过添加一个方法（该方法允许另一个对象，即观察者 注册自己）使本身变得可观察。当可观察的对象更改时，它会将消息发送到已注册的观察者。这些 观察者使用该信息执行的操作与可观察的对象无关。结果是对象可以相互对话，而不必了解原因。观察者模式是一种事件系统，意味着这一模式允许某个类观察另一 个类的状态，当被观察的类状态发生改变的时候，观察类可以收到通知并且做出相应的动作;观察者模式为您提供了避免组件之间紧密耦。</p>\n<!--more-->\n<p>观察者模式有什么用？</p>\n<p>上面的一段文字可能说的太过书面化，但是任何设计模式都是脱胎于实际的场景中，只要理解什么情况下需要用这种模式，基本就理解这种模式是干什么用的。比如用户登录这一行为，可能会产生积分赠送、登录日志写入、通知好友等等一系列操作。但是积分和日志以及通知模块通常是独立的。是否启用登录送积分，登录日志是否写入，通知哪些好友又是需要管理员可控的。并且要考虑后续程序功能模块的删改，所以按照正常类继承写法无疑对后续开发产生许多不可控的影响。于是，这时候就需要使用观察者模式。许多开源程序的插件机制，主题机制都是基于这种模式。</p>\n<p>观察者模式要怎么实现？</p>\n<p>既然是观察者模式，肯定有观察者和被观察者。首先我们把他们抽象出来。然后根据上面提出的问题，针对用户登录这一行为，实现观察者模式。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-comment\">//抽象一个被观察者，并指定必要的抽象方法</span>\n	<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">observed</span></span>{\n		<span class=\"hljs-comment\">//添加观察者,限制参数</span>\n		<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">attach</span><span class=\"hljs-params\">(observer $observer,$type)</span></span>;\n		<span class=\"hljs-comment\">//删除观察者</span>\n		<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">detach</span><span class=\"hljs-params\">(observer $observer,$type)</span></span>;\n		<span class=\"hljs-comment\">//通知</span>\n		<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">notify</span><span class=\"hljs-params\">($type)</span></span>;		\n	}\n	<span class=\"hljs-comment\">//抽象一个观察者，并指定抽象方法</span>\n	<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">observer</span></span>{\n		<span class=\"hljs-keyword\">abstract</span> <span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">update</span><span class=\"hljs-params\">(observed $observed,$type)</span></span>;\n	}\n</code></div></pre>\n<p>然后我们分别实例化一个被观察者和两个观察者，并实现其方法</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-comment\">//实例化一个被观察者对象,并实现抽象方法</span>\n	<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">user</span> <span class=\"hljs-keyword\">extends</span> <span class=\"hljs-title\">observed</span></span>{\n	    <span class=\"hljs-keyword\">CONST</span> OBSERVER_TYPE_REGISTER = <span class=\"hljs-number\">1</span>;<span class=\"hljs-comment\">//注册</span>\n	    <span class=\"hljs-keyword\">CONST</span> OBSERVER_TYPE_LOGIN = <span class=\"hljs-number\">2</span>;<span class=\"hljs-comment\">//登录	</span>\n		<span class=\"hljs-comment\">//保存观察者</span>\n		<span class=\"hljs-keyword\">private</span> $observers;\n		<span class=\"hljs-keyword\">public</span> $name;\n		<span class=\"hljs-comment\">//注意，实现抽象方法时可见性只能大于或者等于抽象方法</span>\n		<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">attach</span><span class=\"hljs-params\">(observer $observer,$type)</span></span>{\n			<span class=\"hljs-keyword\">$this</span>-&gt;observers[$type][] = $observer;\n		}\n		<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">detach</span><span class=\"hljs-params\">(observer $observer,$type)</span></span>{\n			<span class=\"hljs-keyword\">if</span>($idx = array_search($observer, <span class=\"hljs-keyword\">$this</span>-&gt;observers[$type], <span class=\"hljs-keyword\">true</span>)){\n				<span class=\"hljs-keyword\">unset</span>(<span class=\"hljs-keyword\">$this</span>-&gt;observers[$type][$idx]);\n			}\n		}\n		<span class=\"hljs-comment\">//满足条件则通知观察者</span>\n		<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">notify</span><span class=\"hljs-params\">($type)</span></span>{\n			<span class=\"hljs-keyword\">if</span>(!<span class=\"hljs-keyword\">empty</span>(<span class=\"hljs-keyword\">$this</span>-&gt;observers[$type])){\n				<span class=\"hljs-keyword\">foreach</span>(<span class=\"hljs-keyword\">$this</span>-&gt;observers[$type] <span class=\"hljs-keyword\">as</span> $observer){\n				    $observer-&gt;update(<span class=\"hljs-keyword\">$this</span>,$type);\n				}				\n			}\n		}\n		<span class=\"hljs-comment\">//模拟登录方法</span>\n		<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">login</span><span class=\"hljs-params\">($name)</span></span>{\n			<span class=\"hljs-keyword\">$this</span>-&gt;name=$name;\n			<span class=\"hljs-comment\">//添加观察者[技巧：如果使用插件，则循环添加当前开启的插件即可]</span>\n			$point=<span class=\"hljs-keyword\">new</span> point();\n			<span class=\"hljs-keyword\">$this</span>-&gt;attach($point,<span class=\"hljs-keyword\">self</span>::OBSERVER_TYPE_REGISTER);\n			$log=<span class=\"hljs-keyword\">new</span> log();\n			<span class=\"hljs-keyword\">$this</span>-&gt;attach($log,<span class=\"hljs-keyword\">self</span>::OBSERVER_TYPE_REGISTER);\n			<span class=\"hljs-comment\">//通知观察者</span>\n			<span class=\"hljs-keyword\">$this</span>-&gt;notify(<span class=\"hljs-keyword\">self</span>::OBSERVER_TYPE_REGISTER);\n		}\n	}\n	<span class=\"hljs-comment\">//实例化观察者[积分]</span>\n	<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">point</span> <span class=\"hljs-keyword\">extends</span> <span class=\"hljs-title\">observer</span></span>{\n	    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">update</span><span class=\"hljs-params\">(observed $observed,$type)</span></span>{\n	    	<span class=\"hljs-keyword\">if</span>($type==<span class=\"hljs-number\">1</span>){	<span class=\"hljs-comment\">//登录处理</span>\n				<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\'login:add point \'</span>.$observed-&gt;name.<span class=\"hljs-string\">\'&lt;br&gt;\'</span>;\n	    	}\n	    }		\n	}\n	<span class=\"hljs-comment\">//实例化观察者[日志]</span>\n	<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">log</span> <span class=\"hljs-keyword\">extends</span> <span class=\"hljs-title\">observer</span></span>{\n	    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">update</span><span class=\"hljs-params\">(observed $observed,$type)</span></span>{\n	    	<span class=\"hljs-keyword\">if</span>($type==<span class=\"hljs-number\">1</span>){	<span class=\"hljs-comment\">//登录处理</span>\n				<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\'log:write log for \'</span>.$observed-&gt;name.<span class=\"hljs-string\">\'&lt;br&gt;\'</span>;\n	    	}\n	    }		\n	}\n\n在user中我们多增加了一个login方法来模拟登录这一行为。\n\n<span class=\"hljs-comment\">//模拟登录</span>\n	$user=<span class=\"hljs-keyword\">new</span> user();\n	$user-&gt;login(<span class=\"hljs-string\">\'name\'</span>);\n</code></div></pre>\n<p>执行之后我们会看到结果</p>\n<p>login:add point name<br />\nlog:write log for name</p>\n<p>看到这里可能大家就明白了。观察者模式就是一个事件系统，一个对象去观察另一个对象的行为，并做出相应的处理。来避免各功能块之间的耦合，实现“低耦合”、“高聚合”这一概念</p>\n', 1466524800, 1521712727, 0),
(7, '插件机制的实现与原理', 1, 'plug', NULL, 2, 0, 'post', '<p>如果使用过 wordpress、discuz等开源程序的同学可能对插件不太陌生。下载一个插件，放进指定的文件夹，直接就可以使用。让程序有了极其强大的扩展性。</p>\n', '\n如果使用过 wordpress、discuz等开源程序的同学可能对插件不太陌生。下载一个插件，放进指定的文件夹，直接就可以使用。让程序有了极其强大的扩展性。\n<!--more-->\n在这之前我们可能要了解一下 观察者模式 的原理，在这里我们需要一个观察者，把程序当成被观察的对象。当程序运行到一些程序允许使用插件的地方，则观察者向符合程序要求的插件发送通知。我把这个允许使用插件的地方叫做“钩子”。\n\n首先我们编写程序的时候要注意，在需要后期进行扩展开发，或者修改的地方，我们应当留下这个“钩子”。比如用户登录，发帖，充值等地方。\n```php\n$this->register_use(\'LOGIN_SUCCESS\',$data);\n```\n然后在“钩子”函数中通知插件：此时程序运行到了 LOGIN_SUCCESS 这个地方。\n```php\nfunction register_use($behavior,$data){\n            $handle=opendir(APP_FILE.\'use/\');\n            while($file=readdir($handle)) {\n                if (($file!=\".\")&&($file!=\"..\")&&strstr($file,\'.class.php\')){\n                    $classname=str_replace(\'.class.php\',\'\',$file);\n                    $obj = new ReflectionClass($classname);\n                    if($obj->hasMethod(\'notify\')){\n                        $instance =$obj->newInstanceArgs();\n                        $obj->getmethod(\'notify\')->invoke($instance,array(\'behavior\'=>$behavior,\'data\'=>$data));\n                    }\n                }\n            }\n            closedir($handle);\n        }\n```\n这里我们遍历了插件所在目录，并把符合我们要求的类挑选出来发送通知，因为使用了自动加载，所以没有引入文件这个操作，如果没有使用自动加载需要引入对应的文件。\n\n然后在插件的父类中添加一个通知方法\n```php\nfunction notify($data){\n            $behavior=\'use_\'.strtolower($data[\'behavior\']);\n            if(method_exists($this,$behavior)==true){\n                $this->$behavior($data[\'data\']);\n            }\n        }\n```\n这样，我们就可以在插件目录下编写文件，只要继承父类或者自己编写一个通知方法，即可接收到程序运行时发出的通知。编写对应的代码即可在执行到钩子的时候运行。\n```php\nfunction use_login_success(){\n			echo \"use_login_success\";\n			die();\n		}\n```\n然后我们登录测试一下\n![EVrMRrb.png!web.png][1]\n这时候我们发现，在登录处理完后触发了插件的方法。这时候，一个简单的插件就完成了。\n\n\n  [1]: http://lscho.com/usr/uploads/2017/03/4119552257.png', '<p>如果使用过 wordpress、discuz等开源程序的同学可能对插件不太陌生。下载一个插件，放进指定的文件夹，直接就可以使用。让程序有了极其强大的扩展性。</p>\n<!--more-->\n<p>在这之前我们可能要了解一下 观察者模式 的原理，在这里我们需要一个观察者，把程序当成被观察的对象。当程序运行到一些程序允许使用插件的地方，则观察者向符合程序要求的插件发送通知。我把这个允许使用插件的地方叫做“钩子”。</p>\n<p>首先我们编写程序的时候要注意，在需要后期进行扩展开发，或者修改的地方，我们应当留下这个“钩子”。比如用户登录，发帖，充值等地方。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-keyword\">$this</span>-&gt;register_use(<span class=\"hljs-string\">\'LOGIN_SUCCESS\'</span>,$data);\n</code></div></pre>\n<p>然后在“钩子”函数中通知插件：此时程序运行到了 LOGIN_SUCCESS 这个地方。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">register_use</span><span class=\"hljs-params\">($behavior,$data)</span></span>{\n            $handle=opendir(APP_FILE.<span class=\"hljs-string\">\'use/\'</span>);\n            <span class=\"hljs-keyword\">while</span>($file=readdir($handle)) {\n                <span class=\"hljs-keyword\">if</span> (($file!=<span class=\"hljs-string\">\".\"</span>)&amp;&amp;($file!=<span class=\"hljs-string\">\"..\"</span>)&amp;&amp;strstr($file,<span class=\"hljs-string\">\'.class.php\'</span>)){\n                    $classname=str_replace(<span class=\"hljs-string\">\'.class.php\'</span>,<span class=\"hljs-string\">\'\'</span>,$file);\n                    $obj = <span class=\"hljs-keyword\">new</span> ReflectionClass($classname);\n                    <span class=\"hljs-keyword\">if</span>($obj-&gt;hasMethod(<span class=\"hljs-string\">\'notify\'</span>)){\n                        $instance =$obj-&gt;newInstanceArgs();\n                        $obj-&gt;getmethod(<span class=\"hljs-string\">\'notify\'</span>)-&gt;invoke($instance,<span class=\"hljs-keyword\">array</span>(<span class=\"hljs-string\">\'behavior\'</span>=&gt;$behavior,<span class=\"hljs-string\">\'data\'</span>=&gt;$data));\n                    }\n                }\n            }\n            closedir($handle);\n        }\n</code></div></pre>\n<p>这里我们遍历了插件所在目录，并把符合我们要求的类挑选出来发送通知，因为使用了自动加载，所以没有引入文件这个操作，如果没有使用自动加载需要引入对应的文件。</p>\n<p>然后在插件的父类中添加一个通知方法</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">notify</span><span class=\"hljs-params\">($data)</span></span>{\n            $behavior=<span class=\"hljs-string\">\'use_\'</span>.strtolower($data[<span class=\"hljs-string\">\'behavior\'</span>]);\n            <span class=\"hljs-keyword\">if</span>(method_exists(<span class=\"hljs-keyword\">$this</span>,$behavior)==<span class=\"hljs-keyword\">true</span>){\n                <span class=\"hljs-keyword\">$this</span>-&gt;$behavior($data[<span class=\"hljs-string\">\'data\'</span>]);\n            }\n        }\n</code></div></pre>\n<p>这样，我们就可以在插件目录下编写文件，只要继承父类或者自己编写一个通知方法，即可接收到程序运行时发出的通知。编写对应的代码即可在执行到钩子的时候运行。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">use_login_success</span><span class=\"hljs-params\">()</span></span>{\n			<span class=\"hljs-keyword\">echo</span> <span class=\"hljs-string\">\"use_login_success\"</span>;\n			<span class=\"hljs-keyword\">die</span>();\n		}\n</code></div></pre>\n<p>然后我们登录测试一下<br />\n<img src=\"http://lscho.com/usr/uploads/2017/03/4119552257.png\" alt=\"EVrMRrb.png!web.png\" /><br />\n这时候我们发现，在登录处理完后触发了插件的方法。这时候，一个简单的插件就完成了。</p>\n', 1467388800, 1521712740, 0),
(8, 'php 闭包与匿名函数', 1, 'closure', '', 1, 99, 'post', '<p>提到闭包和匿名函数似乎一下子就想到了 javascript ，但其实在很多语言中都有闭包的特性。但是 javascript 坑爹的变量作用域让闭包变得非常重要。而其他语言完善私有共有变量和继承让闭包似乎没有什么卵用。但是为了有点B格，还是看了看 php 的闭包。<br />\n闭包和匿名函数</p>\n', '\n提到闭包和匿名函数似乎一下子就想到了 javascript ，但其实在很多语言中都有闭包的特性。但是 javascript 坑爹的变量作用域让闭包变得非常重要。而其他语言完善私有共有变量和继承让闭包似乎没有什么卵用。但是为了有点B格，还是看了看 php 的闭包。\n闭包和匿名函数\n<!--more-->\n闭包个人理解就是可以访问不同作用域内变量的方式。在 javascript 中，变量的作用域都是遵循从下往上的原则，而最上级的变量是挂载在 window 对象中(nodejs 是挂载在 gloub 中)，这就意味着如果随意定义的变量的话，挂载在最上级作用域的变量会越来越多，甚至会产生重名、覆盖等问题，这就是经常提到的变量污染。所以会使用闭包来解决变量污染和跨作用域访问变量。但是在 php 中有系统全局变量、一般的变量、常量、全局变量、静态变量，作用域划分明确。所以闭包在 php 中不是那么重要，所以理解起来也有点难度。（反正我是没理解 php 闭包有什么卵用）。 匿名函数则允许我们创建一个没有指定名称的函数，同时拥有一个执行环境。匿名函数是完成闭包的常用方式。 php5.3 之后引入了匿名函数的概念，laravel、CodeIgniter、Yii等框架都或多或少的使用的匿名函数和闭包。所以我们还是有必要了解一下。\n闭包的实现\n```php\n//把函数做为参数传入\n    function callFun($func){\n        $func( \"some string\\r\\n\" );\n    }\n    //php写法\n    $fun=function($str){\n        echo $str;\n    };//注意这里要带上结束符号，因为此时是赋值语句\n    callFun($fun);\n    //js写法\n    callFun(function($str){\n        echo $str;\n    });\n```\n与 javascript 的区别\n\n虽然从写法上看和 javascript 没有什么区别，但是在使用的时候还是有一定的区别。主要表现在变量作用域方面。在 javascript 中闭包函数可以使用上级作用域的变量。\n```php\nfunction fun(){\n  var a=1;\n  return function(){\n    console.log(a);\n  }\n}\nvar callfun=fun();\ncallfun();//1\n```\n但是在 php 中却不能这样使用。\n```php\nfunction callFun() {\n        $v=1;\n        $func=function(){\n            echo $v;    //Notice: Undefined variable: v\n        };\n        $func();\n    }\n    callFun();\n```\n这样会报一个警告，变量$v没有定义。php 中需要使用use关键字来解决这个问题。\n```php\n$func1=function() use ($v){\n            echo $v;    //1\n            $v++;\n        };\n        $func1();\n        echo $v;        //1\n```\n这时候和闭包函数内的$v改变不是影响到上级函数作用域内的变量。同样的，可以使用引用来关联。\n```php\n$func2=function() use (&$v){\n            echo $v;    //1\n            $v++;\n        };\n        $func2();\n        echo $v;        //2\n```\n替代递归\n\n闭包的使用非常广泛，比如简化代码、替换递归、替代循环等等…这里提供一个替代递归的方法。\n```php\n//递归\n    function func ($v){\n        if($v<10){\n            echo $v;    //123456789\n            $v++;\n            func($v);\n        }\n        echo $v;//101098765432\n    }\n    func(1);\n\n    //闭包\n    $fib = function($n) use(&$fib) {\n        if($n<10){\n            echo $n;    //123456789\n            $fib($n+1);\n        }\n        echo $n;    //10987654321\n    };\n   $fib(1);\n```\n可以看到执行结果上还是有少许差异，使用过程中一定要注意。另外据说闭包的执行效率并不是很好，所以使用的时候还是要视情况而定。33', '<p>提到闭包和匿名函数似乎一下子就想到了 javascript ，但其实在很多语言中都有闭包的特性。但是 javascript 坑爹的变量作用域让闭包变得非常重要。而其他语言完善私有共有变量和继承让闭包似乎没有什么卵用。但是为了有点B格，还是看了看 php 的闭包。<br />\n闭包和匿名函数</p>\n<!--more-->\n<p>闭包个人理解就是可以访问不同作用域内变量的方式。在 javascript 中，变量的作用域都是遵循从下往上的原则，而最上级的变量是挂载在 window 对象中(nodejs 是挂载在 gloub 中)，这就意味着如果随意定义的变量的话，挂载在最上级作用域的变量会越来越多，甚至会产生重名、覆盖等问题，这就是经常提到的变量污染。所以会使用闭包来解决变量污染和跨作用域访问变量。但是在 php 中有系统全局变量、一般的变量、常量、全局变量、静态变量，作用域划分明确。所以闭包在 php 中不是那么重要，所以理解起来也有点难度。（反正我是没理解 php 闭包有什么卵用）。 匿名函数则允许我们创建一个没有指定名称的函数，同时拥有一个执行环境。匿名函数是完成闭包的常用方式。 php5.3 之后引入了匿名函数的概念，laravel、CodeIgniter、Yii等框架都或多或少的使用的匿名函数和闭包。所以我们还是有必要了解一下。<br />\n闭包的实现</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-comment\">//把函数做为参数传入</span>\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">callFun</span><span class=\"hljs-params\">($func)</span></span>{\n        $func( <span class=\"hljs-string\">\"some string\\r\\n\"</span> );\n    }\n    <span class=\"hljs-comment\">//php写法</span>\n    $fun=<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">($str)</span></span>{\n        <span class=\"hljs-keyword\">echo</span> $str;\n    };<span class=\"hljs-comment\">//注意这里要带上结束符号，因为此时是赋值语句</span>\n    callFun($fun);\n    <span class=\"hljs-comment\">//js写法</span>\n    callFun(<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">($str)</span></span>{\n        <span class=\"hljs-keyword\">echo</span> $str;\n    });\n</code></div></pre>\n<p>与 javascript 的区别</p>\n<p>虽然从写法上看和 javascript 没有什么区别，但是在使用的时候还是有一定的区别。主要表现在变量作用域方面。在 javascript 中闭包函数可以使用上级作用域的变量。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">fun</span><span class=\"hljs-params\">()</span></span>{\n  <span class=\"hljs-keyword\">var</span> a=<span class=\"hljs-number\">1</span>;\n  <span class=\"hljs-keyword\">return</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">()</span></span>{\n    console.log(a);\n  }\n}\n<span class=\"hljs-keyword\">var</span> callfun=fun();\ncallfun();<span class=\"hljs-comment\">//1</span>\n</code></div></pre>\n<p>但是在 php 中却不能这样使用。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">callFun</span><span class=\"hljs-params\">()</span> </span>{\n        $v=<span class=\"hljs-number\">1</span>;\n        $func=<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">()</span></span>{\n            <span class=\"hljs-keyword\">echo</span> $v;    <span class=\"hljs-comment\">//Notice: Undefined variable: v</span>\n        };\n        $func();\n    }\n    callFun();\n</code></div></pre>\n<p>这样会报一个警告，变量$v没有定义。php 中需要使用use关键字来解决这个问题。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\">$func1=<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">()</span> <span class=\"hljs-title\">use</span> <span class=\"hljs-params\">($v)</span></span>{\n            <span class=\"hljs-keyword\">echo</span> $v;    <span class=\"hljs-comment\">//1</span>\n            $v++;\n        };\n        $func1();\n        <span class=\"hljs-keyword\">echo</span> $v;        <span class=\"hljs-comment\">//1</span>\n</code></div></pre>\n<p>这时候和闭包函数内的$v改变不是影响到上级函数作用域内的变量。同样的，可以使用引用来关联。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\">$func2=<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">()</span> <span class=\"hljs-title\">use</span> <span class=\"hljs-params\">(&amp;$v)</span></span>{\n            <span class=\"hljs-keyword\">echo</span> $v;    <span class=\"hljs-comment\">//1</span>\n            $v++;\n        };\n        $func2();\n        <span class=\"hljs-keyword\">echo</span> $v;        <span class=\"hljs-comment\">//2</span>\n</code></div></pre>\n<p>替代递归</p>\n<p>闭包的使用非常广泛，比如简化代码、替换递归、替代循环等等…这里提供一个替代递归的方法。</p>\n<pre><div class=\"hljs\"><code class=\"lang-php\"><span class=\"hljs-comment\">//递归</span>\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">func</span> <span class=\"hljs-params\">($v)</span></span>{\n        <span class=\"hljs-keyword\">if</span>($v&lt;<span class=\"hljs-number\">10</span>){\n            <span class=\"hljs-keyword\">echo</span> $v;    <span class=\"hljs-comment\">//123456789</span>\n            $v++;\n            func($v);\n        }\n        <span class=\"hljs-keyword\">echo</span> $v;<span class=\"hljs-comment\">//101098765432</span>\n    }\n    func(<span class=\"hljs-number\">1</span>);\n\n    <span class=\"hljs-comment\">//闭包</span>\n    $fib = <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span><span class=\"hljs-params\">($n)</span> <span class=\"hljs-title\">use</span><span class=\"hljs-params\">(&amp;$fib)</span> </span>{\n        <span class=\"hljs-keyword\">if</span>($n&lt;<span class=\"hljs-number\">10</span>){\n            <span class=\"hljs-keyword\">echo</span> $n;    <span class=\"hljs-comment\">//123456789</span>\n            $fib($n+<span class=\"hljs-number\">1</span>);\n        }\n        <span class=\"hljs-keyword\">echo</span> $n;    <span class=\"hljs-comment\">//10987654321</span>\n    };\n   $fib(<span class=\"hljs-number\">1</span>);\n</code></div></pre>\n<p>可以看到执行结果上还是有少许差异，使用过程中一定要注意。另外据说闭包的执行效率并不是很好，所以使用的时候还是要视情况而定。33</p>\n', 1467820800, 1521712748, 0),
(9, 'About', 1, 'about', NULL, 0, 99, 'page', '', '\n历程\n\n已经忘记了换了多少个域名。\n\n每换一次数据就丢一点。\n\n用以前的域名搜索了一下，恢复了一点文章。\n\n三天打鱼两天晒网。\n\n得治!\n\n从 2014 年开始写博客，也不能算是写博客，就是换服务器，换程序的一个折腾的过程。\n\n写过一个 php 的博客程序\n\n写过一个 nodejs的博客\n\n但是最终都是因为域名没有续费或是服务器没有续费最后弃用。连数据都没有保存。\n\n这次换了域名，换了服务器全部都是续了三年的费用，就这样。不折腾了。\n说明\n\n域名是我的名字拼音中取出来的几个字母。xin 则是我尚未见面的前世小情人的名字，以后这个博客会陪着她长大。\n环境和优化\n\n腾讯云、centos、lnmp、nodejs、redis、https、http2等\n', '<p>历程</p>\n<p>已经忘记了换了多少个域名。</p>\n<p>每换一次数据就丢一点。</p>\n<p>用以前的域名搜索了一下，恢复了一点文章。</p>\n<p>三天打鱼两天晒网。</p>\n<p>得治!</p>\n<p>从 2014 年开始写博客，也不能算是写博客，就是换服务器，换程序的一个折腾的过程。</p>\n<p>写过一个 php 的博客程序</p>\n<p>写过一个 nodejs的博客</p>\n<p>但是最终都是因为域名没有续费或是服务器没有续费最后弃用。连数据都没有保存。</p>\n<p>这次换了域名，换了服务器全部都是续了三年的费用，就这样。不折腾了。<br />\n说明</p>\n<p>域名是我的名字拼音中取出来的几个字母。xin 则是我尚未见面的前世小情人的名字，以后这个博客会陪着她长大。<br />\n环境和优化</p>\n<p>腾讯云、centos、lnmp、nodejs、redis、https、http2等</p>\n', 1521298248, 0, 61),
(10, 'Links', 1, 'links', NULL, 0, 99, 'page', '', '## 链接\n\n<ul class=\"flinks\">\n<li><a href=\"https://imququ.com/\">Jerry Qu</a></li>\n<li><a href=\"https://xuexb.com/\">谢亮</a></li>\n<li><a href=\"http://sentsin.com/\">贤心</a></li>\n<li><a href=\"http://www.barretlee.com/entry/\">小胡子哥</a></li>\n<li><a href=\"http://www.laruence.com/\">鸟哥</a></li>\n<li><a href=\"https://github.com/rccoder/blog/issues\">rccoder</a></li>\n<li><a href=\"https://cnodejs.org/\">CNode社区</a></li>\n<li><a href=\"https://laravel-china.org/topics\">laravel社区</a></li>\n<li><a href=\"https://juejin.im/explore/all\">掘金</a></li>\n<li><a href=\"https://segmentfault.com/\">segmentfault</a></li>\n<li><a href=\"https://joyqi.com/\">joyqi</a></li>\n</ul>\n\n## 说明\n\n> 以上为经常关注的博客和社区，不定期更新。', '<h2>链接</h2>\n<ul class=\"flinks\">\n<li><a href=\"https://imququ.com/\">Jerry Qu</a></li>\n<li><a href=\"https://xuexb.com/\">谢亮</a></li>\n<li><a href=\"http://sentsin.com/\">贤心</a></li>\n<li><a href=\"http://www.barretlee.com/entry/\">小胡子哥</a></li>\n<li><a href=\"http://www.laruence.com/\">鸟哥</a></li>\n<li><a href=\"https://github.com/rccoder/blog/issues\">rccoder</a></li>\n<li><a href=\"https://cnodejs.org/\">CNode社区</a></li>\n<li><a href=\"https://laravel-china.org/topics\">laravel社区</a></li>\n<li><a href=\"https://juejin.im/explore/all\">掘金</a></li>\n<li><a href=\"https://segmentfault.com/\">segmentfault</a></li>\n<li><a href=\"https://joyqi.com/\">joyqi</a></li>\n</ul>\n<h2>说明</h2>\n<blockquote>\n<p>以上为经常关注的博客和社区，不定期更新。</p>\n</blockquote>\n', 1521298347, 0, 33);
-- --------------------------------------------------------

--
-- 表的结构 `ls_meta`
--

CREATE TABLE `ls_meta` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `count` int(10) DEFAULT '0',
  `sort` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ls_meta`
--

INSERT INTO `ls_meta` (`id`, `uid`, `name`, `slug`, `description`, `type`, `count`, `sort`) VALUES
(1, 1, 'tech', 'tech', '', 'category', 5, 0),
(2, 1, 'life', 'life', '', 'category', 0, 0),
(6, 1, 'php', 'php', '', 'tag', 9, 0),
(7, 1, 'css', 'css', '', 'tag', 6, 0),
(9, 1, 'vue', 'vue', '', 'tag', 1, 0),
(10, 1, 'server', 'server', '', 'tag', 2, 0),
(11, 1, 'typecho', 'typecho', '', 'tag', 0, 0),
(12, 1, 'https', 'https', '', 'tag', 0, 0),
(13, 1, 'nodejs', 'nodejs', '', 'tag', 0, 0),
(14, 1, 'webapp', 'webapp', '', 'tag', 0, 0),
(15, 1, 'bug', 'bug', '', 'tag', 0, 0),
(16, 1, 'vb', 'vb', '', 'tag', 0, 0),
(17, 1, 'javascript', 'javascript', '', 'tag', 0, 0),
(18, 1, 'it', 'it', '', 'tag', 0, 0),
(19, 1, 'thinkphp5', 'thinkphp5', '', 'tag', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ls_relationships`
--

CREATE TABLE `ls_relationships` (
  `content_id` int(10) NOT NULL,
  `meta_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ls_relationships`
--

INSERT INTO `ls_relationships` (`content_id`, `meta_id`) VALUES
(2, 6),
(2, 7),
(2, 6),
(2, 7),
(1, 17),
(3, 18),
(4, 15),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(17, 6),
(17, 19),
(16, 6),
(16, 19),
(15, 13),
(11, 14);

-- --------------------------------------------------------

--
-- 表的结构 `ls_user`
--

CREATE TABLE `ls_user` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `github` varchar(100) DEFAULT NULL,
  `zhihu` varchar(100) DEFAULT NULL,
  `weibo` varchar(100) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `encrypt` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ls_user`
--

INSERT INTO `ls_user` (`id`, `username`, `email`, `qq`, `github`, `zhihu`, `weibo`, `password`, `encrypt`) VALUES
(1, 'root', NULL, '', NULL, NULL, NULL, '24d8cee9ed793b9f818b6c4b67aae9aa', 'Mje5sowT7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ls_comment`
--
ALTER TABLE `ls_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ls_config`
--
ALTER TABLE `ls_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ls_content`
--
ALTER TABLE `ls_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ls_meta`
--
ALTER TABLE `ls_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ls_user`
--
ALTER TABLE `ls_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ls_comment`
--
ALTER TABLE `ls_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `ls_config`
--
ALTER TABLE `ls_config`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ls_content`
--
ALTER TABLE `ls_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `ls_meta`
--
ALTER TABLE `ls_meta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `ls_user`
--
ALTER TABLE `ls_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
